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
	@Override
	public int memberRegister(MemberVO mvo) {
		mvo.setUserSerialNo("U"+mdao.selectUserCount());
		// mvo.setUserPwd(passwordEncoder.encode(mvo.getUserPwd()));
		return mdao.register(mvo);
	}

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
	public MemberDTO getSocialMbr(MemberDTO mdto) {
		MemberVO mvo = mdao.getSocialMbr(mdto.getMvo());
		
		mdto.setMvo(mvo);
		mdto.setUvo(null);
		return mdto;
	}

	@Transactional
	@Override
	public int regSocialMbr(MemberDTO mdto) {
		int isOK = 1;
		isOK *= mdao.register(mdto.getMvo());
		mdto.getUvo().setUserName(mdto.getMvo().getUserName());
		mdto.getUvo().setUserNickName(mdto.getMvo().getUserNickName());
		mdto.getUvo().setUserSerialNo(mdto.getMvo().getUserSerialNo());
		isOK *= mdao.regUser(mdto.getUvo());
		return isOK;
	}

	@Override
	public MemberVO getSocialUser(MemberVO mvo) {
		return mdao.getSocialMbr(mvo);
	}
	
}
