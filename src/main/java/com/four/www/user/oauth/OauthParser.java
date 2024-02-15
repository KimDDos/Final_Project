package com.four.www.user.oauth;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;

import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserAuthVO;
import com.four.www.user.domain.UserVO;
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
		
		try {
			// 데이터 파싱
			Object resp = userInfo.get("response");
			String stringObj = resp.toString();
			Map<String, String> naver_resp = parseResponse(stringObj);
			String userEmail = naver_resp.get("email");
			String userName = naver_resp.get("name");
			String userNickName = naver_resp.get("nickname");
			String userGender = naver_resp.get("gender");
			String userPhoneNum = naver_resp.get("mobile");
			String userBirthDate = naver_resp.get("birthyear") + "-" + naver_resp.get("birthday");

			mdto.setMvo(mvo);
			mdto.setUvo(uvo);
			mdto.getMvo().setUserEmail(userEmail);
			UUID uuid = UUID.randomUUID();
			mdto.getMvo().setUserPwd(uuid.toString());
			mdto.getMvo().setUserName(userName);
			mdto.getMvo().setUserNickName(userNickName);
			mdto.getMvo().setUserBirthDate(userBirthDate);
			mdto.getMvo().setUserPhoneNum(userPhoneNum);
			mdto.getMvo().setUserItrs("None");
			mdto.getMvo().setIsTrainer("N");
			mdto.getUvo().setUserLoginType("N");
			return regAndAuth(mdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// Naver Parsing 메서드
	private static Map<String, String> parseResponse(String resp){
		// response 문자열을 파싱하여 맵 형태로 변환
		Map<String, String> naver_resp = new HashMap<String, String>();
		String[] pairs = resp.substring(1, resp.length()-1).split(", ");
		for(String pair : pairs) {
			String[] entry = pair.split("=");
			naver_resp.put(entry[0], entry[1]);
		}
		return naver_resp;
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
