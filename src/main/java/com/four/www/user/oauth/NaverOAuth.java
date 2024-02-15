package com.four.www.user.oauth;

import java.util.HashMap;
import java.util.Map;

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
public class NaverOAuth {

	// Naver 로그인 인증을 요청하는 URL
	private final String NAVER_CODE_REQUEST_URL = "https://nid.naver.com/oauth2.0/authorize";
	// 접급 토큰의 발급, 갱신, 삭제 요청
	private final String NAVER_TOKEN_REQUEST_URL = "https://nid.naver.com/oauth2.0/token";
	// 네이버 회원의 프로필 조회
	private final String NAVER_PROFILE_REQUEST_URL = "https://openapi.naver.com/v1/nid/me";
	
	@Value("${naver.client.id}")
	private String naverClientId;
	@Value("${naver.client.pwd}")
	private String naverClientPwd;
	@Value("${naver.redirect.url}")
	private String redirect_uri;
	
	public String getNaverAuthUrl() {
		String login_url = NAVER_CODE_REQUEST_URL 
				+"?response_type=code"
				+"&client_id="+naverClientId
				+"&state=STATE_STRING"
				+"&redirect_uri="+redirect_uri;
		return login_url;
	}
	
	
	public Map<String, String> getNaverAccessTokenUrl(String code) {
		MultiValueMap<String, String> parameter = new LinkedMultiValueMap<String, String>();
		parameter.add("grant_type", "authorization_code");
		parameter.add("client_id", naverClientId);
		parameter.add("client_secret", naverClientPwd);
		parameter.add("code", code);
		
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
			ResponseEntity<HashMap> result = restTemplate.postForEntity(NAVER_TOKEN_REQUEST_URL, entity, HashMap.class);			
			log.info(">>>>> Post 호출 관련 데이터 >>>>> {}",result);
			Map<String, String> resMap = result.getBody();
			
			// 응답 데이터 확인
			log.info(">>>>> AccessToken 데이터 >>>>> {}",resMap);
			
			String access_token = resMap.get("access_token");
			
			// Header에 access token 삽입
			headers.set("Authorization", "Bearer "+access_token);
			
			// Request entity 생성
			HttpEntity<?> userInfoEntity = new HttpEntity<>(headers);
			
			ResponseEntity<HashMap> userResult = restTemplate.exchange(NAVER_PROFILE_REQUEST_URL, HttpMethod.GET, userInfoEntity, HashMap.class);
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
