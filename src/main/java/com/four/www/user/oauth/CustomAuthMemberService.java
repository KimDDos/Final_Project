package com.four.www.user.oauth;

import javax.inject.Inject;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
		mdto.setAvo(mdao.getAlarmList(mvo.getUserSerialNo()));
		return new AuthMember(mdto);
	}
	
	public Authentication createNewAuthentication() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		AuthMember authMember = (AuthMember) auth.getPrincipal();
		String username = authMember.getUsername();
		log.info("USER NAME ================================="+username);
		UserDetails newPrincipal = this.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal,
				auth.getCredentials(), newPrincipal.getAuthorities());
		newAuth.setDetails(auth.getDetails());
		return newAuth;
	}

}
