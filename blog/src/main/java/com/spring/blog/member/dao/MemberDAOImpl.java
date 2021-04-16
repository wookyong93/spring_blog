package com.spring.blog.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.blog.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private MemberVO membervo;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		boolean result = Boolean.parseBoolean((String)sqlSession.selectOne("mapper.member.loginCheck",memberVO));
		return result;
	}

	@Override
	public boolean idCheck(String id) throws DataAccessException {
		
		boolean result  = Boolean.parseBoolean((String)sqlSession.selectOne("mapper.member.idCheck",id));
		return result;
	}

	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {

		int result = sqlSession.insert("mapper.member.addMember",memberVO);
		return result;
	}

}
