package com.uwl.service.fcm.impl;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;
import com.uwl.common.NotificationRequest;
import com.uwl.service.fcm.FcmService;

@Service
public class FcmServiceImpl implements FcmService {

	public FcmServiceImpl() {
		System.out.println("FcmServiceImpl run()...");
	}

	private final Map<String, String> tokenMap = new HashMap<>();

	@PostConstruct
	public void init() {
		try {
			FileInputStream serviceAccount = new FileInputStream(
					"C:\\Users\\User\\Downloads\\webuwl-firebase-adminsdk-cdwqm-f2eba118f1.json");
			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.setDatabaseUrl("https://webuwl.firebaseio.com").build();
			FirebaseApp.initializeApp(options);
			System.out.println("Firebase application has been initialized");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void send(NotificationRequest notificationRequest) throws Exception {
		System.out.println("run FCMService send()");
		Message message = Message.builder().setToken(notificationRequest.getToken())
				.setWebpushConfig(
						WebpushConfig.builder().putHeader("ttl", "300")
								.setNotification(new WebpushNotification(notificationRequest.getTitle(),
										notificationRequest.getMessage(), notificationRequest.getIcon()))
								.build())
				.build();

		String response = FirebaseMessaging.getInstance().sendAsync(message).get();
		System.out.println("Sent Message : " + response);
	}

	@Override
	public void register(String userId, String token) throws Exception {
		tokenMap.put(userId, token);
		System.out.println("tokenMap : " + tokenMap);
	}

	@Override
	public void deleteToken(String userId) throws Exception {
		tokenMap.remove(userId);
	}

	@Override
	public String getToken(String userId) throws Exception {
		return tokenMap.get(userId);
	}

	@Override
	public void sendNotification(NotificationRequest request) throws Exception {
		try {
			System.out.println("run sendNotification");
			this.send(request);
		} catch (InterruptedException | ExecutionException e) {
			e.printStackTrace();
		}
	}

	// sender : 유저의 name 혹은 nickname, receiverId : userId
	@Override
	public void createReceiveNotification(String sender, String receiverId, String notiCode) throws Exception {
		System.out.println("run CreateReceiveNotification");
		String msg = sender + "님으로부터 알림이 도착했습니다.";
		NotificationRequest request = new NotificationRequest();
		request.setTitle("어'울림 알림메시지");
		request.setToken(this.getToken(receiverId));
		
		if (notiCode.equals("requestFriend")) {
			msg = sender + "님이 친구가 되기를 요청했습니다.";
		} else if (notiCode.equals("acceptFriend")) {
			msg = sender + "님이 친구요청을 수락했습니다.";
		} else if (notiCode.equals("ask")) {
			msg = "ASK에 새로운 질문이 등록되었습니다.";
		} else if (notiCode.equals("timeline")) {
			msg = sender + "님이 타임라인에 댓글을 등록했습니다..";
		} else if (notiCode.equals("post")) {
			msg = sender + "님이 게시글에 댓글을 등록했습니다..";
		} else if (notiCode.equals("question")) {
			msg = "1:1 문의사항에 답변이 등록되었습니다.";
		} else if (notiCode.equals("matching")) {
			msg = "누군가가 당신에게 꽃을 보냈습니다.";
		}
		
		request.setMessage(msg);
		request.setIcon("/images/logo.png");
		System.out.println("FCM send msg :: " + request);
		this.sendNotification(request);
	}

}
