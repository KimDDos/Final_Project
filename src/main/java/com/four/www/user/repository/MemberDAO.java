package com.four.www.user.repository;

import java.util.List;

import com.four.www.user.domain.MemberVO;
import com.four.www.user.oauth.authVO;

public interface MemberDAO {

	int selectUserEmailAndPwd(MemberVO mvo);

	int register(MemberVO mvo);

	String selectUserCount();

	String selectUserInfo(String authEmail);

	MemberVO selectMemberInfo(String username);

	List<authVO> selectAuths(String username);

}
