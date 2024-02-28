package com.four.www.user.service;

import java.util.List;

import org.springframework.security.config.authentication.PasswordEncoderParser;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserVO;
import com.four.www.user.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberDAO mdao;
	
	private final BCryptPasswordEncoder passwordEncoder;
	@Override
	public int memberRegister(MemberVO mvo) {
		mvo.setUserPwd(passwordEncoder.encode(mvo.getUserPwd()));
		return mdao.register(mvo);
	}

	@Override
	public boolean updateLastLogin(String authEmail) {
		String isOk = mdao.selectUserInfo(authEmail);
		log.info("MEMBERCHECK = " + isOk);
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
		MemberVO serialTemp = mdao.getUserDetail(mdto.getMvo().getUserEmail());
		mdto.getUvo().setUserName(mdto.getMvo().getUserName());
		mdto.getUvo().setUserNickName(mdto.getMvo().getUserNickName());
		mdto.getUvo().setUserSerialNo(serialTemp.getUserSerialNo());
		isOK *= mdao.regUser(mdto.getUvo());
		return isOK;
	}

	@Override
	public MemberVO getSocialUser(MemberVO mvo) {
		return mdao.getSocialMbr(mvo);
	}

	@Override
	public List<MemberVO> getList(MemberVO mvo) {
		return mdao.getList(mvo);
	}

	@Override
	public int getUserDetail(String userEmail) {
		MemberVO mvo = mdao.getUserDetail(userEmail);
		return mvo.getUserSerialNo();
	}

	@Override
	public void updateLoginDate(int userSerialNo) {
		mdao.updateLoginDate(userSerialNo);	
	}

	@Override
	public void authRegister(int userSerialNo) {
		mdao.authRegister(userSerialNo);
	}

	@Override
	public void userRegister(UserVO newUvo) {
		mdao.userRegister(newUvo);
		
	}

	@Override
	public int memberModify(MemberVO mvo) {
		int isOk = mdao.memberModify(mvo);
		isOk *= mdao.memberUserVOModify(mvo);
		return isOk;
	}

	@Override
	public int checkPwd(MemberVO mvo) {
		MemberVO tmp = mdao.getUserDetailS(mvo.getUserSerialNo());
		log.info(tmp.getUserPwd());
		log.info(passwordEncoder.encode(mvo.getUserPwd()));
		if (passwordEncoder.matches(mvo.getUserPwd(), tmp.getUserPwd())) return 1;
		return 0;
	}

	@Override
	public int deleteMember(int userSerialNo) {
		int isOk = mdao.deleteMember(userSerialNo);
		isOk *= mdao.deleteMemberAuth(userSerialNo);
		isOk *= mdao.deleteMemberUser(userSerialNo);
		return isOk;
	}
	
}
