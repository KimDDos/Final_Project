package com.four.www.user.oauth;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserAuthVO;
import com.four.www.user.domain.UserVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.four.www.user.domain.MemberDTO;
import com.four.www.user.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class OauthParser {
	
	private final MemberService msv;

	// Google 파싱
	public MemberDTO googleUser(Map<String, String> userInfo) {
		
		String userEmail = userInfo.get("email");
		String userName = userInfo.get("family_name") + userInfo.get("given_name");
		String userNickName = userInfo.get("name"); 
		
		MemberDTO mdto = new MemberDTO();
		MemberVO mvo = new MemberVO();
		UserVO uvo = new UserVO();
		mdto.setMvo(mvo);
		mdto.setUvo(uvo);
		mdto.getMvo().setUserEmail(userEmail);
		UUID uuid = UUID.randomUUID();
		mdto.getMvo().setUserPwd(uuid.toString());
		mdto.getMvo().setUserName(userName);
		mdto.getMvo().setUserNickName(userNickName);
		mdto.getMvo().setUserBirthDate("None");
		mdto.getMvo().setUserPhoneNum("None");
		mdto.getMvo().setUserAddress("None");
		mdto.getMvo().setUserItrs("None");
		mdto.getMvo().setIsTrainer("N");
		mdto.getUvo().setUserLoginType("G");
		
		return regAndAuth(mdto);
	}
	
	// Naver 파싱 : 
	public MemberDTO naverUser(Map<String, String> userInfo) {
		MemberDTO mdto = new MemberDTO();
		MemberVO mvo = new MemberVO();
		UserVO uvo = new UserVO();
		log.info("user info >>>>>>>>>>>>>>>>>>>>>>>>>>> {}",userInfo);
		
		try {
			// 데이터 파싱
			/*
			Map<String, String> responseMap = userInfo.get("response");
			String userEmail = userInfo.get("response").get("email");
			String userName = (String)response_obj.get("name");
			String userNickName = (String)response_obj.get("nickname");
			String userGender = (String)response_obj.get("gender");
			String userPhoneNum = (String)response_obj.get("mobile");
			String userBirthDate = (String)response_obj.get("birthyear") + "-" + (String)response_obj.get("birthday");

			mdto.setMvo(mvo);
			mdto.setUvo(uvo);
			mdto.getMvo().setUserEmail(userEmail);
			UUID uuid = UUID.randomUUID();
			mdto.getMvo().setUserPwd(uuid.toString());
			mdto.getMvo().setUserName(userName);
			mdto.getMvo().setUserNickName(userNickName);
			mdto.getMvo().setUserBirthDate(userBirthDate);
			mdto.getMvo().setUserPhoneNum(userPhoneNum);
			mdto.getMvo().setUserAddress("None");
			mdto.getMvo().setUserItrs("None");
			mdto.getMvo().setIsTrainer("N");
			mdto.getUvo().setUserLoginType("N");
			*/
			log.info(">>>>>>>>>>>>>>>>>>>>>>>> mdto >>>>>>>>>>>>>>>>>>>>>> {}", mdto);
			log.info(">>>>>>>>>>>>>>>>>>>>>>>> mdto.getMvo >>>>>>>>>>>>>>>>>>>>>> {}", mdto.getMvo());
			log.info(">>>>>>>>>>>>>>>>>>>>>>>> mdto.getUvo >>>>>>>>>>>>>>>>>>>>>> {}", mdto.getUvo());
			return regAndAuth(mdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// OAuth 전용 등록 메서드
	private MemberDTO regAndAuth(MemberDTO mdto) {
		
		// DB에 회원정보가 없으면 회원 등록(Oauth 전용)
		if(msv.getSocialMbr(mdto.getMvo()) == null) {
			int isOk = msv.regSocialMbr(mdto);
		}
		
		MemberVO oauthMvo = msv.getSocialUser(mdto.getMvo());
		
		UserAuthVO authvo = new UserAuthVO();
		authvo.setUserSerialNo(oauthMvo.getUserSerialNo());
		if(oauthMvo.getIsTrainer().equals("N")) {
			authvo.setUserRole("ROLE_USER");
		} else {
			authvo.setUserRole("ROLE_TRAINER");
		}
		
		List<UserAuthVO> authList = new ArrayList<>();
		authList.add(authvo);
		oauthMvo.setAuthList(authList);
		
		MemberDTO authmdto = new MemberDTO();
		authmdto.setMvo(oauthMvo);
		
		return authmdto;
	}
	
}
