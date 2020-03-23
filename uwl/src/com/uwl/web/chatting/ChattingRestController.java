package com.uwl.web.chatting;

import java.text.DateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.service.chatting.ChattingService;
import com.uwl.service.domain.Chatting;


@RestController
@RequestMapping("/chatting")
public class ChattingRestController {
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	public ChattingRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/rest/addChattingRoom", method=RequestMethod.POST)		//1:1채팅 방 개설
	public boolean addChattingRoom(@RequestBody Chatting chatting) throws Exception{
		try{
			chattingService.addChattingRoom(chatting);
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@RequestMapping(value="/rest/enterChattingRoom", method=RequestMethod.POST)	//1:1 채팅방 참가
	public boolean enterChattingRoom(@RequestBody Chatting chatting) throws Exception{
		try {
			chattingService.enterChattingRoom(chatting);
		}catch (Exception e) {
			return false;
		}
		return true;
	}
	
	@RequestMapping(value="/rest/outChattingRoom", method=RequestMethod.POST)	//1:1 채팅방 나가기
	public boolean outChattingRoom(@RequestBody Chatting chatting) throws Exception{
		try {
			chattingService.outChattingRoom(chatting);
		}catch (Exception e) {
			return false;
		}
		return true;
	}	
	
	@RequestMapping(value="/rest/getChattingRoomList", method=RequestMethod.POST)	//유저 채팅목록 호출
	public List<Chatting> getChattingRoomList(@RequestBody Chatting chatting) throws Exception{
		return chattingService.getChattingRoomList(chatting);
	}
	
	@RequestMapping(value="/rest/updateChatting", method=RequestMethod.POST)
	public void updateChatting(@RequestBody Chatting chatting) throws Exception{
		chattingService.updateChatting(chatting.getLastChat(), chatting.getRoomNo());
	}
}
