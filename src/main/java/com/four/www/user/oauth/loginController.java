package com.four.www.user.oauth;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.four.www.user.domain.MemberVO;

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
	
	@GetMapping("/google")
	public void getGoogleAuthUrl(HttpServletResponse response) throws Exception {
		// 구글 Code 발행을 위한 유저 구글 로그인을 위한 로그인 사이트로 이동
		response.sendRedirect(googleOAuth.getGoogleAuthUrl());
	}
	
	@GetMapping(value = "/{socialLoginType}/callback")
	public String getAccessToken(@PathVariable(name = "socialLoginType") String socialLoginType ,
			@RequestParam(name="code") String code) {
		log.info(">>>> 소셜 로그인 API 서버로부터 받은 code :: {}", code);
		
		Map<String, String> userInfo = googleOAuth.getGoogleAccessTokenUrl(code);
		
		
		
		switch (socialLoginType) {
		case "google":
			 
			try {
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
		default:
			break;
		}
		
		return "redirect:/index";
	}
}
