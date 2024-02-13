package com.four.www.user.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.four.www.user.domain.MemberDTO;
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

<<<<<<< HEAD
=======
	@Override
	public boolean updateLastLogin(String authEmail) {
		String isOk = mdao.selectUserInfo(authEmail);
		return (isOk != null || isOk != "") ? true : false;
	}

	@Override
	public String selectUserCount() {
		return mdao.selectUserCount();
	}

	@Override
	public Object getSocialMbr(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return mdao.getSocialMbr(mdto.getMvo());
	}

	@Transactional
	@Override
	public int regSocialMbr(MemberDTO mdto) {
		
		int isOK = 1;
		isOK *= mdao.register(mdto.getMvo()); 
		isOK *= mdao.regUser(mdto.getUvo());
		return isOK;
	}
>>>>>>> f6ceab4aff08024477d54ca1d5245e41e0183b91
	
}
