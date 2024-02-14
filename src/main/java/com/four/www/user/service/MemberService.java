package com.four.www.user.service;

import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;

public interface MemberService {

	int memberRegister(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	String selectUserCount();

	MemberDTO getSocialMbr(MemberDTO mdto);

	int regSocialMbr(MemberDTO mdto);

	MemberVO getSocialUser(MemberVO mvo);

}
