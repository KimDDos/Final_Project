package com.four.www.user.oauth;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.four.www.user.domain.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login/**")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class loginController {
	
	private final OauthParser parser;
	
	private final GoogleOAuth googleOAuth;
	private final NaverOAuth naverOAuth;
	
	// Google 로그인 첫 화면
	@GetMapping("/google")
	public void getGoogleAuthUrl(HttpServletResponse response) throws Exception {
		// 구글 Code 발행을 위한 유저 구글 로그인을 위한 로그인 사이트로 이동
		response.sendRedirect(googleOAuth.getGoogleAuthUrl());
	}
	
	// Naver 로그인 첫 화면 
	@GetMapping("/naver")
	public void getNaverAuthUrl(HttpServletResponse response) throws Exception {
		response.sendRedirect(naverOAuth.getNaverAuthUrl());
	}
	
	// callback 함수 처리
	@GetMapping(value = "/{socialLoginType}/callback")
	public String getAccessToken(@PathVariable(name = "socialLoginType") String socialLoginType ,
			@RequestParam(name="code") String code, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info(">>>> 소셜 로그인 API 서버로부터 받은 code : {}", code);
		MemberDTO mdto = new MemberDTO();
		
		switch (socialLoginType) {
		case "google":
			try {
				Map<String, String> userInfo = googleOAuth.getGoogleAccessTokenUrl(code);
				log.info(">>>>>> Google UserInfo >>>>>>> {}", userInfo);
				mdto = parser.googleUser(userInfo);
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>>>>> Google Login Error >>>>>>> {}", e.toString());
				return "redirect:/member/memberLogin";
			}
			break;
		case "naver":
			try {
				Map<String, String> userInfo = naverOAuth.getNaverAccessTokenUrl(code);
				log.info(">>>>>> Naver UserInfo >>>>>>> {}", userInfo);
				mdto = parser.naverUser(userInfo);
			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>>>>> Naver Login Error >>>>>>> {}", e.toString());
				return "redirect:/member/memberLogin";
			}
			break;
		default:
			break;
		}
		socialUserCreateMemberAndAuthSet(mdto, request, response);
		return "redirect:/";
	}
	
	// 인증권한 세팅 메서드
	private void socialUserCreateMemberAndAuthSet(MemberDTO mdto, 
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		AuthMember OauthUser = new AuthMember(mdto);
		Authentication authentication = 
				new UsernamePasswordAuthenticationToken(OauthUser, null, OauthUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
	}
}
