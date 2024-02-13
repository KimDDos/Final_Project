package com.four.www.user.oauth;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/login/**")
@CrossOrigin(origins = "*")
@PropertySource("classpath:application-api.properties")
public class loginController {
	
	@Value("${google.client.id}")
	private String googleClientId;
	@Value("${google.client.pwd}")
	private String googleClientPwd;
	@Value("${redirect.url}")
	private String redirect_uri;
	
	@GetMapping("/google")
	public void getGoogleAuthUrl(HttpServletResponse response) throws Exception {
		response.sendRedirect("https://accounts.google.com/o/oauth2/v2/auth?"
				+ "scope=https%3A//www.googleapis.com/auth/drive.metadata.readonly&"
				+ "response_type=code&"
				+ "redirect_uri="+redirect_uri
				+ "&client_id="+googleClientId);
	}
	
	@GetMapping(value = "/{socialLoginType}/callback")
	public String callback(@PathVariable(name = "socialLoginType") String socialLoginType ,
			@RequestParam(name="code") String code) {
		log.info(">>>> 소셜 로그인 API 서버로부터 받은 code :: {}", code);
		return "";
	}
}
