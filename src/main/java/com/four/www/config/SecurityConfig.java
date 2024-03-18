package com.four.www.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.four.www.user.oauth.CustomAuthMemberService;
import com.four.www.user.oauth.LoginFailurHandler;
import com.four.www.user.oauth.LoginSuccessHandler;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public BCryptPasswordEncoder bcPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	// SuccessHandler : 사용자 커스텀 생성
	@Bean
	public AuthenticationSuccessHandler authSuccessHandler() {
		return new LoginSuccessHandler();
	}

	// FailurHabdler : 사용자 커스텀 생성
	@Bean
	public AuthenticationFailureHandler authFailurHandler() {
		return new LoginFailurHandler();
	}
	
	// UserDetail : 사용자 커스텀 생성
	@Bean
	public UserDetailsService customUserService() {
		return new CustomAuthMemberService();
	}
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// 인증 되는 객체 설정
		auth.userDetailsService(customUserService())
		.passwordEncoder(bcPasswordEncoder());

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		
		// FilterChain에 UTF-8 인코딩을 추가 >>> URI 전송간 다양한 문자를 활용하기 위해서 선언해줘야함.
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
		
        http.addFilterBefore(filter, CsrfFilter.class);
		
		// 승인 요청
		http.authorizeRequests()
		.antMatchers("/**").permitAll()
		.anyRequest().authenticated();
		
		// 커스텀 로그인 페이지를 구성
		// Controller에 주소요청 맵핑이 같이 있어야 함. (필수)  >> 없으면 로그인 경로를 인지하지 못 함
		// 없으면 Security 가 제공하는 로그인 페이지로 넘어가버림
		http.formLogin()
		.usernameParameter("userEmail")
		.passwordParameter("userPwd")
		.loginPage("/member/login")
		.successHandler(authSuccessHandler())
		.failureHandler(authFailurHandler());
		
		// 로그아웃 페이지 (Security에서는 반드시 get 매핑이 아닌 post 이여야만 함)
		// method = "post"
		http.logout()
		.logoutUrl("/member/memberLogout")
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		.logoutSuccessUrl("/");
		
	}
	
	

}
