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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.four.www.main.repository.SearchDTO;
import com.google.api.client.json.Json;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PlaceSearchService {

	private Json json;

	public List<SearchDTO> searchPlace(String keyword) {
		try {
			keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("ENC FAIL", e);
		}
		String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + keyword
				+ "&display=5&start=1&sort=random";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", "2kNsc9sKyIAwUbSWJCJN");
		requestHeaders.put("X-Naver-Client-Secret", "OF8OjwHHRc");
		String responseBody = get(apiURL, requestHeaders);
		log.info("받아온 값 : " + responseBody);
		/*
		 * 자료 형식
		 * title
		 * link
		 * category
		 * description
		 * telephone
		 * address
		 * roadAddress
		 * mapx
		 * mapy
		 */
		JSONParser parser = new JSONParser();
		List<SearchDTO> sList = new ArrayList<SearchDTO>();

		try {
			Object obj = parser.parse(responseBody);
			JSONObject jobj = (JSONObject) obj;
			
			JSONArray items = (JSONArray)jobj.get("items");

			for(int i=0;i<items.size();i++)
			{
				JSONObject item = (JSONObject) items.get(i);
				String title = item.get("title").toString();
				String address = item.get("address").toString();
				String link = item.get("link").toString();
				double mapx = (double)(Integer.parseInt(item.get("mapy").toString())/10000000.0);
				double mapy = (double)(Integer.parseInt(item.get("mapx").toString())/10000000.0);
				
				sList.add(new SearchDTO(title,address,link,mapx,mapy));
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sList;
	}

	private String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			} else {
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API요청 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL 에러", e);
		} catch (IOException e) {
			throw new RuntimeException("연결 실패", e);
		}
	}

	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답읽기 실패", e);
		}
	}
}
