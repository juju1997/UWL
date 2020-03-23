package com.uwl.service.schoolRank;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;

public interface SchoolRankDAO {
	
	//회원가입 했을때 해당학교 no가 없으면 add한다
	public void addSchoolRank(SchoolRank schoolRank) throws Exception;
	
	//회원가입 시 해당 학교no가 테이블에 존재한다면 update
	public void updateSchoolRank(SchoolRank schoolRank) throws Exception;
	
	//회원가입 시 해당학교 가입자가 있다면 토탈유저만 +1 update
	public void updateSchoolTotalUser(SchoolRank schoolRank) throws Exception;
	
	//학교랭킹 리스트를 확인하기 위한 method
	public List<SchoolRank> getSchoolRankingList(Search search) throws Exception;
	
	//개인랭킹 리스트를 확인하기 위한 method
	public List<SchoolRank> getIndividualRankingList(Search search) throws Exception;
	
	//유저가 검색한 학교리스트
	public SchoolRank getSearchRank(int schoolNo) throws Exception;
	
	//내 학교검색
	public SchoolRank getMySchool(String userId) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
	
	public int getTotalCountIndividual(Search search) throws Exception ;

}
