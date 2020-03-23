package com.uwl.service.imp.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.uwl.service.imp.ImpService;

@Service
public class ImpServiceImpl implements ImpService {
	
	@Value("#{apiProperties['impKey']}")
	String impKey;

	@Value("#{apiProperties['impSecret']}")
	String impSecret;

	private String accessToken;
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	
	@PostConstruct
	public void init() throws Exception{
		this.getToken();
		System.out.println(this.accessToken);
	}
	
	public Map impInfo(String importId) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://api.iamport.kr/payments/" + importId;
		System.out.println("request url : " + url);
		System.out.println("impUid : " + importId);

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		httpGet.setHeader("Authorization", this.accessToken);

		HttpResponse httpResponse = httpClient.execute(httpGet);
		System.out.println(httpResponse);

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));

		JSONObject json = (JSONObject)JSONValue.parse(br);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(json.get("response").toString(), new TypeReference<Map<String, Object>>() {	});
		System.out.println(map);
		
		return map;
	}
	
	@Override
	public Map impCancel(String importId) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://api.iamport.kr/payments/cancel";
		System.out.println("request url : " + url);

		// json으로 갖고와버려서 parse
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		httpPost.setHeader("Authorization", this.accessToken);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("imp_uid", importId);
		HttpEntity httpEntity = new StringEntity(jsonObject.toString(), "utf-8");
		httpPost.setEntity(httpEntity);

		HttpResponse httpResponse = httpClient.execute(httpPost);
		System.out.println(httpResponse);

		HttpEntity httpResponseEntity = httpResponse.getEntity();
		InputStream is = httpResponseEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));

		JSONObject json = (JSONObject)JSONValue.parse(br);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(json.toString(), new TypeReference<Map<String, Object>>() {	});
		System.out.println(map);
		
		return map;
	}

	public void getToken() throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://api.iamport.kr/users/getToken";

		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("imp_key", impKey);
		jsonObject.put("imp_secret", impSecret);

		HttpEntity httpEntity = new StringEntity(jsonObject.toString(), "utf-8");
		httpPost.setEntity(httpEntity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		System.out.println(httpResponse);
		
		HttpEntity httpEntityResponse = httpResponse.getEntity();
		InputStream is = httpEntityResponse.getContent(); 
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
		
		JSONObject json = (JSONObject)JSONValue.parse(br);
		String accessToken = (String)((JSONObject)json.get("response")).get("access_token");
		setAccessToken(accessToken);
		
	}
	

}
