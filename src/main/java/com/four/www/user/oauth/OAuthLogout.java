package com.four.www.user.oauth;

import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.google.api.client.util.Value;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@PropertySource("classpath:application-api.properties")
public class OAuthLogout {

	@Value("${naver.client.id}")
	private String CLIENT_ID;
	
	@Value("${naver.client.pwd}")
	private String CLIENT_SECRET;
	
	// 네이버 토큰 취소, 로그아웃
	public void naverLogout(String accessToken) {
		
		String data = "grant_type=delete"+
				"&client_id="+CLIENT_ID+
				"&client_secret="+CLIENT_SECRET+
				"&access_token="+accessToken +
				"&service_provider=NAVER";
		
		sendRevokeRequest(data, "naver", null);
	}
	
	// Google 토큰 취소, 로그아웃
	public void googleLogout(String accessToken) {
		
		String data = "token=" + accessToken;
		
		sendRevokeRequest(data, "google", null);
	}
	
	// 토큰 취소 
	
	public void sendRevokeRequest(String data, String provider, String accessToken) {
        String googleRevokeUrl = "https://accounts.google.com/o/oauth2/revoke";
        String naverRevokeUrl = "https://nid.naver.com/oauth2.0/token";
  	
        
        RestTemplate restTemplate = new RestTemplate();
        String revokeUrl = "";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<String> entity = new HttpEntity<>(data, headers);
        
        switch (provider) {
	          case "google":
	              revokeUrl = googleRevokeUrl;
	              break;
	          case "naver":
	              revokeUrl = naverRevokeUrl;
	              break;
        }
        
        ResponseEntity<String> responseEntity = restTemplate.exchange(revokeUrl, HttpMethod.POST, entity, String.class);

        // Get the response status code and body
        HttpStatus statusCode = (HttpStatus) responseEntity.getStatusCode();
        String responseBody = responseEntity.getBody();
        
        log.info("Logout Status Code = {} " , statusCode);
        log.info("Logout Response = {} " , responseBody);
    }
	
}
