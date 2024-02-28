package com.four.www.user.service;

import java.util.List;

import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserVO;

public interface MemberService {

	int memberRegister(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	int selectUserCount();

	MemberVO getSocialMbr(MemberVO memberVO);

	int regSocialMbr(MemberDTO mdto);

	MemberVO getSocialUser(MemberVO mvo);

	List<MemberVO> getList(MemberVO mvo);

	int getUserDetail(String userEmail);

	void updateLoginDate(String userSerialNo);

	void authRegister(int i);

	void userRegister(UserVO newUvo);

	int memberModify(MemberVO mvo);

}
