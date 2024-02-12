package com.four.www.user.oauth;

import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class GoogleOAuth {

	private final String googleLoginUrl = "https://accounts.google.com";
	private final String GOOGLE_TOKEN_REQUEST_URL = "https://";
	
}
