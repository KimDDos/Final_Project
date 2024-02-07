package com.four.www.user.repository;

import com.four.www.user.domain.MemberVO;

public interface MemberDAO {

	int selectUserEmailAndPwd(MemberVO mvo);

	int register(MemberVO mvo);

	String selectUserCount();

}
