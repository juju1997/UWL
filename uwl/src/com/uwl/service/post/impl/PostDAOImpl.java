package com.uwl.service.post.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Post;
import com.uwl.service.post.PostDAO;

@Repository("postDAOImpl")
public class PostDAOImpl implements PostDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//Constructor
	public PostDAOImpl() {
		super();
	}
	
	@Override
	public Post getBoard(int postNo) throws Exception {		//게시글 가져오기, 조회수 증가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", postNo);
		map.put("change", +1);
		sqlSession.update("PostMapper.updateHitStatus",map);
		return sqlSession.selectOne("PostMapper.getBoard", postNo);
	}

	@Override
	public void addBoard(Post post) throws Exception {	//게시글 추가
		sqlSession.insert("PostMapper.addBoard", post);
	}

	@Override
	public void updateBoard(Post post) throws Exception {	//게시글 내용 업데이트
		sqlSession.update("PostMapper.updateBoard", post);
	}

	@Override
	public void deleteBoard(int postNo) throws Exception {	//게시글 삭제
		sqlSession.update("PostMapper.deleteBoard", postNo);
	}

	@Override
	public List<Post> getBoardList(Search search, String gatherCategoryNo) throws Exception {	//게시글 목록 가져오기
			//gatherCategory
			//	101 : 매칭
			//	102 : 아이템
			//	103 : 도전과제
			//	104 : 결제
			//	105 : 친구
			//	106 : 타임라인
			//	107 : ASK
			//	108 : 계정
			//	109 : 알림
			//	110 : 위치
			//	111 : 기타
			//	201 : 명예의전당
			//	202 : 진학상담
			//	203 : 사랑
			//	204 : 남자끼리
			//	205 : 여자끼리
			//	206 : 데이트
			//	207 : 대나무숲
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("gatherCategoryNo", gatherCategoryNo);
		System.out.println("DAO 임쁠탄다");
		return sqlSession.selectList("PostMapper.getBoardList", map);
	}

	
	@Override
	public Post getNotice(int postNo) throws Exception {	//공지사항 불러오기, 조회수 1 증가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", postNo);
		map.put("change", +1);
		sqlSession.update("PostMapper.updateHitStatus",map);
		return sqlSession.selectOne("PostMapper.getNotice", postNo);
	}

	@Override
	public void addNotice(Post post) throws Exception {	//공지사항 추가
		sqlSession.insert("PostMapper.addNotice", post);
	}

	@Override
	public void updateNotice(Post post) throws Exception {	//공지사항 내용 수정
		sqlSession.update("PostMapper.updateNotice", post);
	}

	@Override
	public void deleteNotice(int postNo) throws Exception {
		sqlSession.update("PostMapper.deleteNotice", postNo);
	}

	@Override
	public List<Post> getNoticeList(Search search) throws Exception {
		return sqlSession.selectList("PostMapper.getNoticeList", search);
	}

	
	
	
	@Override // 공지사항
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("PostMapper.getTotalCount",search);
	}
	
	@Override // 각각 게시판
	public int getTotalCount2(String gatherCategoryNo) throws Exception {
		Post post = new Post();
		post.setGatherCategoryNo(gatherCategoryNo);
		return sqlSession.selectOne("PostMapper.getTotalCount2", post);
	}


	@Override // 추가
	public Post getNextOrPrePost(int postNo) throws Exception {
		return sqlSession.selectOne("PostMapper.getNextOrPrePost", postNo);
	}

	
	
	
}
