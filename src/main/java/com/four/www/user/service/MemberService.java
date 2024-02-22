package com.four.www.user.service;

import java.util.List;

import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;

public interface MemberService {

	int memberRegister(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	int selectUserCount();

	MemberVO getSocialMbr(MemberVO memberVO);

	int regSocialMbr(MemberDTO mdto);

	MemberVO getSocialUser(MemberVO mvo);

	List<MemberVO> getList(MemberVO mvo);

}
