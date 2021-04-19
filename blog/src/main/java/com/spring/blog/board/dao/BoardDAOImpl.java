package com.spring.blog.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.blog.board.vo.BoardVO;

@Repository("boardRepository")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	SqlSession sqlSession;
	@Autowired
	BoardVO boardVO;
	@Override
	public List<BoardVO> boardMain(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> boardMain =new ArrayList<BoardVO>();
		boardMain = sqlSession.selectList("mapper.board.latelycontent",id);
		return boardMain;
	}
}
