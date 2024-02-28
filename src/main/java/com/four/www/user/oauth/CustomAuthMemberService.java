package com.four.www.user.oauth;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserVO;
import com.four.www.user.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAuthMemberService implements UserDetailsService {

	@Inject
	private MemberDAO mdao;
	
	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		log.info(">>>>>>>>>LOGIN TRY<<<<<<<<<<<<<<<<"+userEmail);
		MemberDTO mdto = new MemberDTO();
		MemberVO mvo = mdao.selectMemberInfo(userEmail);
		log.info(">>>>>>>>>GETTING MVO<<<<<<<<<<<<<<<<"+mvo);
		if(mvo == null) {
			throw new UsernameNotFoundException(userEmail);
		}
		UserVO uvo = mdao.selectUser(mvo.getUserSerialNo());
		log.info(">>>>>>>>>GETTING UVO<<<<<<<<<<<<<<<<"+uvo);
		mvo.setAuthList(mdao.selectAuths(mvo.getUserSerialNo()));
		mdto.setMvo(mvo);
		mdto.setUvo(uvo);
		return new AuthMember(mdto);
	}

}
