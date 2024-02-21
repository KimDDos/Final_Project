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
		MemberDTO mdto = new MemberDTO();
		MemberVO mvo = mdao.selectMemberInfo(userEmail);
		if(mvo == null) {
			throw new UsernameNotFoundException(userEmail);
		}
		UserVO uvo = mdao.selectUser(mvo.getUserSerialNo());
		mvo.setAuthList(mdao.selectAuths(userEmail));
		mdto.setMvo(mvo);
		mdto.setUvo(uvo);
		return new AuthMember(mdto);
	}

}
