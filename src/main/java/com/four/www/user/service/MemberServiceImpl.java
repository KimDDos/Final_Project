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
	
	// private final BCryptPasswordEncoder passwordEncoder;
<<<<<<< HEAD

	@Override
	public int memberRegister(MemberVO mvo) {
		mvo.setUserSerialNo("U"+mdao.selectUserCount());
		// mvo.setUserPwd(passwordEncoder.encode(mvo.getUserPwd()));
		return mdao.register(mvo);
	}
=======
	@Override
	public int memberRegister(MemberVO mvo) {
		mvo.setUserSerialNo("U"+ Integer.toString(mdao.selectUserCount()+1));
		// mvo.setUserPwd(passwordEncoder.encode(mvo.getUserPwd()));
		return mdao.register(mvo);
	}

>>>>>>> 3414582e43935288a9b40236ce7c5e8b430457f9
	@Override
	public boolean updateLastLogin(String authEmail) {
		String isOk = mdao.selectUserInfo(authEmail);
		return (isOk != null || isOk != "") ? true : false;
	}

	@Override
	public int selectUserCount() {
		return mdao.selectUserCount();
	}

	@Override
	public MemberVO getSocialMbr(MemberVO mvo) {
		return mdao.getSocialMbr(mvo);
	}

	@Transactional
	@Override
	public int regSocialMbr(MemberDTO mdto) {
		int isOK = 1;
		isOK *= memberRegister(mdto.getMvo());
		mdto.getUvo().setUserName(mdto.getMvo().getUserName());
		mdto.getUvo().setUserNickName(mdto.getMvo().getUserNickName());
		mdto.getUvo().setUserSerialNo(mdto.getMvo().getUserSerialNo());
		isOK *= mdao.regUser(mdto.getUvo());
		return isOK;
	}
<<<<<<< HEAD
=======

	@Override
	public MemberVO getSocialUser(MemberVO mvo) {
		return mdao.getSocialMbr(mvo);
	}
>>>>>>> 3414582e43935288a9b40236ce7c5e8b430457f9
	
}
