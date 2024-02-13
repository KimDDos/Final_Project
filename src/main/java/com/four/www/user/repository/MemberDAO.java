package com.four.www.user.repository;

import java.util.List;

import com.four.www.user.domain.UserAuthVO;
import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserVO;

public interface MemberDAO {

	int selectUserEmailAndPwd(MemberVO mvo);

	int register(MemberVO mvo);

	String selectUserCount();

	String selectUserInfo(String authEmail);

	MemberVO selectMemberInfo(String username);

	List<UserAuthVO> selectAuths(String username);

	Object selectSocialUser(MemberDTO mdto);

	MemberVO getSocialMbr(MemberVO mvo);

	int regUser(UserVO uvo);

}
