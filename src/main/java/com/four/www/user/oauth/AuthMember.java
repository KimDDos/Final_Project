package com.four.www.user.oauth;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@ToString
public class AuthMember extends User{
	
	private static final long serialVersionUID = 1L;
	
	private MemberDTO mdto;
	
	public AuthMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public AuthMember(MemberDTO mdto) {
		super(mdto.getMvo().getUserEmail(), mdto.getMvo().getUserPwd(), 
				mdto.getMvo().getAuthList()
				.stream()
				.map(authVO -> new SimpleGrantedAuthority(authVO.getUserRole()))
				.collect(Collectors.toList()));
		this.mdto = mdto;
	}
	
}
