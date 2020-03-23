package com.uwl.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.service.chatting.ChattingDAO;
import com.uwl.service.domain.Chatting;

@Repository("chattingDAOImpl")
public class ChattingDAOImpl implements ChattingDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ChattingDAOImpl() {
		super();
	}
	
	@Override
	public void addChattingRoom(Chatting chatting) throws Exception {	//채팅방 개설
		sqlSession.insert("CommunityMapper.addChattingRoom", chatting);
	}
	
	@Override
	public void enterChattingRoom(Chatting chatting) throws Exception {	//채팅방 참가함
		sqlSession.update("CommunityMapper.enterChattingRoom", chatting);
	}

	@Override
	public void outChattingRoom(Chatting chatting) throws Exception {	//채팅방 폭파
		sqlSession.update("CommunityMapper.outChattingRoom", chatting);
	}

	@Override
	public List<Chatting> getChattingRoomList(Chatting chatting) throws Exception {
		return sqlSession.selectList("CommunityMapper.getChattingRoomList", chatting);
	}

	@Override
	public void updateChatting(String msg, int roomNo) throws Exception {
		Map map = new HashMap<Object, Object>();
		map.put("msg", msg);
		map.put("roomNo", roomNo);
		sqlSession.update("CommunityMapper.updateChatting", map);
		
	}


}
