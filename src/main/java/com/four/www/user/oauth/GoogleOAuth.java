package com.four.www.user.oauth;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.cbor.MappingJackson2CborHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@PropertySource("classpath:application-api.properties")
public class GoogleOAuth {

	private final String GOOGLE_CODE_REQUEST_URL = "https://accounts.google.com/o/oauth2/v2/auth?";
	private final String GOOGLE_TOKEN_REQUEST_URL = "https://oauth2.googleapis.com/token";
	
	@Value("${google.client.id}")
	private String googleClientId;
	@Value("${google.client.pwd}")
	private String googleClientPwd;
	@Value("${redirect.url}")
	private String redirect_uri;
	
	public String getGoogleAuthUrl(){
		String login_url = GOOGLE_CODE_REQUEST_URL
				+ "scope=email profile&"
				+ "response_type=code&"
				+ "redirect_uri="+redirect_uri
				+ "&client_id="+googleClientId;
		return login_url;
	}
	
	public Map<String, String> getGoogleAccessTokenUrl(String code) {
		// Token 요청 리다이렉트 URL 설정
		MultiValueMap<String, String> parameter = new LinkedMultiValueMap<String, String>();
		parameter.add("code", code);
		parameter.add("client_id", googleClientId);
		parameter.add("client_secret", googleClientPwd);
		parameter.add("redirect_uri", redirect_uri);
		parameter.add("grant_type", "authorization_code");
		
		// request header 설정
		HttpHeaders headers = new HttpHeaders();
		// Content-type을 application/x-www-form-urlencoded 로 설정
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		// header와 body로 Request 생성
		HttpEntity<?> entity = new HttpEntity<>(parameter, headers);
		try {
			RestTemplate restTemplate = new RestTemplate();
			// 응답 데이터(JSON)을 Map으로 받을 수 있도록 관련 메시지 컨버터 추가
			restTemplate.getMessageConverters().add(new MappingJackson2CborHttpMessageConverter());
			
			// post 방식으로 Http 요청
			// 응답 데이터 형식은 Hashmap 으로 지정
			ResponseEntity<HashMap> result = restTemplate.postForEntity(GOOGLE_TOKEN_REQUEST_URL, entity, HashMap.class);			
			log.info(">>>>> Post 호출 관련 데이터 >>>>> {}",result);
			Map<String, String> resMap = result.getBody();
			
			// 응답 데이터 확인
			log.info(">>>>> AccessToken 데이터 >>>>> {}",resMap);
			
			String access_token = resMap.get("access_token");
			String userInfoURL = "https://www.googleapis.com/userinfo/v2/me";
			
			// Header에 access token 삽입
			headers.set("Authorization", "Bearer "+access_token);
			
			// Request entity 생성
			HttpEntity<?> userInfoEntity = new HttpEntity<>(headers);
			
			ResponseEntity<HashMap> userResult = restTemplate.exchange(userInfoURL, HttpMethod.GET, userInfoEntity, HashMap.class);
			Map<String, String> userResultMap = userResult.getBody();
			// return resultMap을 반환해야함!;
			log.info(">>>>> userResultMap 데이터 >>>>> {}",userResultMap);
			return userResultMap;
		} catch (Exception e) {
			e.printStackTrace();
			log.info(">>>>>> getGoogleAccessTokenUrl Exception = " + e.toString());
		}
		return null;
	}
	
}
