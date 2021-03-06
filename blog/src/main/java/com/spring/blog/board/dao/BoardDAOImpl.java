package com.spring.blog.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;

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
	@Override
	public List<BoardVO> boardList(String id) throws DataAccessException {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		boardList = sqlSession.selectList("mapper.board.boardList",id);
		return boardList;
	}
	@Override
	public List<Map<String, Object>> pageList(Criteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.board.pageList",cri);
	}
	@Override
	public int pageCount(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.board.pageCount",id);
	}
	@Override
	public int insertContent(BoardVO boardVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.board.insertContent",boardVO);
	}
	@Override
	public List<BoardVO> boardView(int contentNO) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.board.viewBoard",contentNO);
	}
	@Override
	public int modContent(BoardVO boardVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.board.modContent",boardVO);
	}
	@Override
	public int delContent(int contentNO) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.delete("mapper.board.delContent",contentNO);
	}
	
	public void hitCount(int contentNO) throws DataAccessException{
		sqlSession.update("mapper.board.hitCount",contentNO);
	}
	@Override
	public List<BoardVO> allLately() throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.board.allLately");
	}
	@Override
	public List<BoardVO> hitList() throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.board.hitList");
	}
}
