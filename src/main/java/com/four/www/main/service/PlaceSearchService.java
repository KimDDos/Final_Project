package com.four.www.main.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.four.www.main.repository.SearchDTO;
import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PlaceSearchService {

	private Gson gson;

	@PostConstruct
	private void setup() {
		gson = new Gson();

	}

	public List<String> searchPlace(String keyword) {
		try {
			keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("ENC FAIL", e);
		}
		String apiURL = "https://openapi.naver.com/v1/search/local.json?query=\r\n"+keyword+"&display=20&start=1&sort=random";
	
		Map<String,String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id","2kNsc9sKyIAwUbSWJCJN");
		requestHeaders.put("X-Naver-Client-Secret","OF8OjwHHRc");
		String responseBody = get(apiURL,requestHeaders);
		List<String> sList = null;
		
		sList.add(responseBody);
		
		return sList;
	}
	
	private String get(String apiUrl,Map<String,String>requestHeaders)
	{
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String>header :requestHeaders.entrySet())
			{
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			}
			else {
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API요청 응답 실패",e);
		} finally {
			con.disconnect();
		}
	}
	
	private HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL 에러",e);
		} catch (IOException e)
		{
			throw new RuntimeException("연결 실패",e);
		}
	}
	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);
		
		try (
				BufferedReader lineReader = new BufferedReader(streamReader)
				){
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while ((line = lineReader.readLine())!= null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답읽기 실패",e);
		}
	}
}
