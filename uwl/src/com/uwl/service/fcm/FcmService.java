package com.uwl.service.fcm;

import com.uwl.common.NotificationRequest;
import com.uwl.service.domain.User;

public interface FcmService {

	public void send(final NotificationRequest notificationRequest) throws Exception;
	
	public void register(final String userId, final String token) throws Exception;
	
	public void deleteToken(final String userId) throws Exception;
	
	public String getToken(final String userId) throws Exception;
	
	public void sendNotification(final NotificationRequest request) throws Exception;
	
	public void createReceiveNotification(String sender, String receiverId, String notiCode) throws Exception;
	
	
}
