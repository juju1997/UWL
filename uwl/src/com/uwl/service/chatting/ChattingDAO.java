package com.uwl.service.chatting;

import java.util.List;

import com.uwl.service.domain.Chatting;

public interface ChattingDAO {
	
	//채팅방 개설 (1:1 채팅)
	public void addChattingRoom(Chatting chatting) throws Exception;
	
	//채팅방 참가 (1:1 채팅)
	public void enterChattingRoom(Chatting chatting) throws Exception;
	
	//채팅방 나가기 (1:1 채팅 방 폭파됨)
	public void outChattingRoom(Chatting chatting) throws Exception;
	
	//해당 회원의 채팅 목록 호출
	public List<Chatting> getChattingRoomList(Chatting chatting) throws Exception;
	
	public void updateChatting(String msg, int RoomNo) throws Exception;
}
