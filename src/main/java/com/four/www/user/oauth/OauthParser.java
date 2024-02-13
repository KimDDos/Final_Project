package com.four.www.user.oauth;

import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;

import com.four.www.user.domain.MemberVO;
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
		
		String id = userInfo.get("id");
		String userName = userInfo.get("family_name") + userInfo.get("given_name");
		String userNickName = userInfo.get("name"); 
		String userEmail = userInfo.get("email");
		
		MemberDTO mdto = new MemberDTO();
		mdto.getMvo().setUserEmail(userEmail);
		UUID uuid = UUID.randomUUID();
		mdto.getMvo().setUserPwd(uuid.toString());
		mdto.getMvo().setUserName(userName);
		mdto.getMvo().setUserNickName(userNickName);
		mdto.getMvo().setUserBirthDate("");
		mdto.getMvo().setUserPhoneNum("");
		mdto.getMvo().setUserAddress("");
		mdto.getMvo().setUserItrs("");
		mdto.getMvo().setIsTrainer("N");
		mdto.getUvo().setUserLoginType("G");
		
		return regAndAuth(mdto);
	}
	
	private MemberDTO regAndAuth(MemberDTO mdto) {
		
		// DB에 회원정보가 없으면 회원 등록(Oauth 전용)
		if(msv.getSocialMbr(mdto) == null) {
			int isOk = msv.regSocialMbr(mdto);
		}
		
		return null;
	}
	
}
