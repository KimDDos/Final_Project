package com.four.www.user.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.four.www.user.domain.MemberVO;
import com.four.www.user.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberDAO mdao;
	
<<<<<<< HEAD
=======
	// private final BCryptPasswordEncoder passwordEncoder;
>>>>>>> f1fdcba2e20666f74eb668b133104370d23d1bb8

	@Override
	public int memberRegister(MemberVO mvo) {
		mvo.setUserSerialNo("U"+mdao.selectUserCount());
<<<<<<< HEAD
=======
		// mvo.setUserPwd(passwordEncoder.encode(mvo.getUserPwd()));
>>>>>>> f1fdcba2e20666f74eb668b133104370d23d1bb8
		return mdao.register(mvo);
	}

	
}
