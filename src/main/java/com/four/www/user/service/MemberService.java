package com.four.www.user.service;

import com.four.www.user.domain.MemberVO;

public interface MemberService {

	int memberRegister(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

}
