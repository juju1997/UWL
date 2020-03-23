package com.uwl.service.chatting.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.service.chatting.ChattingDAO;
import com.uwl.service.chatting.ChattingService;
import com.uwl.service.domain.Chatting;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	@Qualifier("chattingDAOImpl")
	private ChattingDAO chattingDAO;
	public void setchattingDAO(ChattingDAO chattingDAO) {
		this.chattingDAO = chattingDAO;
	}
	
	@Override
	public void addChattingRoom(Chatting chatting) throws Exception {	//채팅방 개설
		chattingDAO.addChattingRoom(chatting);
	}

	
	@Override
	public void enterChattingRoom(Chatting chatting) throws Exception {	//채팅방 창가
		chattingDAO.enterChattingRoom(chatting);
	}

	@Override
	public void outChattingRoom(Chatting chatting) throws Exception { //채팅방 폭파
		chattingDAO.outChattingRoom(chatting);
	}

	@Override
	public List<Chatting> getChattingRoomList(Chatting chatting) throws Exception {
		return chattingDAO.getChattingRoomList(chatting);
	}

	@Override
	public void updateChatting(String msg, int roomNo) throws Exception {
		chattingDAO.updateChatting(msg, roomNo);
		
	}

}
