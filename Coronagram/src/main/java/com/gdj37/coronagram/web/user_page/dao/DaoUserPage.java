package com.gdj37.coronagram.web.user_page.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoUserPage implements IDaoUserPage {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> getMPostList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getMPostList",params);
	}

	@Override
	public List<HashMap<String, String>> getMDtlList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getMDtlList",params);
	}

	@Override
	public List<HashMap<String, String>> getModalCmt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getModalCmt",params);
	}
	
	@Override
	public HashMap<String, String> getIntroM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getIntroM",params);
	}	

	@Override
	public HashMap<String, String> getModalM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getModalM",params);
	}
	
	@Override
	public int getfollowEx2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getfollowEx2",params);
	}
	
	@Override
	public int getfollowEx(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getfollowEx",params);
	}
	
	@Override
	public int getHeartCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getHeartCnt",params);
	}
	
	@Override
	public int delModalCmt(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("userPage.delModalCmt",params);
	}
	
	@Override
	public int delFollow(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("userPage.delFollow",params);
	}
	
	@Override
	public int addFollow(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.addFollow",params);
	}
	
	@Override
	public int addHeart(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.addHeart",params);
	}

	@Override
	public int delHeart(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("userPage.delHeart",params);
	}

	@Override
	public int getLkCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getLkCnt",params);
	}

	@Override
	public int addMCmt(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.addMCmt",params);
	}

	@Override
	public int delPost(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("userPage.delPost",params);
	}

	@Override
	public List<HashMap<String, String>> getVideoList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getVideoList",params);
	}

	@Override
	public List<HashMap<String, String>> getEmojiList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getEmojiList",params);
	}

	@Override
	public HashMap<String, String> getLastSAcctNum(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getLastSAcctNum",params);
	}

	@Override
	public int storyAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.storyAdd",params);
	}

	@Override
	public int storyAcctAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.storyAcctAdd",params);
	}

	@Override
	public List<HashMap<String, String>> getStoryList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getStoryList",params);
	}

	@Override
	public HashMap<String, String> getStoryMList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getStoryMList",params);
	}

	@Override
	public List<HashMap<String, String>> getfollowEvent(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getfollowEvent",params);
	}

	@Override
	public List<HashMap<String, String>> getfollowerEvent(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getfollowerEvent",params);
	}

	@Override
	public int FollowMAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.FollowMAdd",params);
	}

	@Override
	public int FollowMDel(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("userPage.FollowMDel",params);
	}

	@Override
	public List<HashMap<String, String>> SearchUser(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.SearchUser",params);
	}

	@Override
	public List<HashMap<String, String>> getReelsList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("userPage.getReelsList",params);
	}

	@Override
	public HashMap<String, String> getLastRAcctNum(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getLastRAcctNum",params);
	}

	@Override
	public int reelsAdds(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.reelsAdds",params);
	}

	@Override
	public int reelsAcctAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.reelsAcctAdd",params);
	}

	@Override
	public HashMap<String, String> reelsModal(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.reelsModal",params);
	}

	@Override
	public int reelsViewCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("userPage.reelsViewCnt",params);
	}

	@Override
	public int ReelsHeartChk(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.ReelsHeartChk",params);
	}

	@Override
	public int addReelsHeart(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("userPage.addReelsHeart",params);
	}

	@Override
	public int delReelsHeart(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("userPage.delReelsHeart",params);
	}

	@Override
	public int getReelsLk(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("userPage.getReelsLk",params);
	}
}
