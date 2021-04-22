package com.spring.blog.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.board.dao.BoardDAO;
import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;


@Service("boardService")
//dataAccessExceotion 에러 발생시 롤백 처리
@Transactional(rollbackFor = DataAccessException.class)
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	@Override
	public List<BoardVO> boardMain(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> boardMain =new ArrayList<BoardVO>();
		boardMain = boardDAO.boardMain(id);
		return boardMain;
	}
	@Override
	public List<BoardVO> boardList(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> boardList =new ArrayList<BoardVO>();
		boardList = boardDAO.boardList(id);
		return boardList;
	}
	@Override
	public List<Map<String, Object>> pageList(Criteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.pageList(cri);
	}
	@Override
	public int boardCount(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.pageCount(id);
	}
	@Override
	public int insertContent(BoardVO boardVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.insertContent(boardVO);
	}
	@Override
	public List<BoardVO> viewBoard(int contentNO) throws DataAccessException {
		// TODO Auto-generated method stub
			boardDAO.hitCount(contentNO);
		return boardDAO.boardView(contentNO);
	}
	@Override
	public int modContent(BoardVO boardVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.modContent(boardVO);
	}
	@Override
	public int delContent(int contentNO) throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.delContent(contentNO);
	}
	@Override
	public List<BoardVO> allLately() throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.allLately();
	}
	@Override
	public List<BoardVO> hitList() throws DataAccessException {
		// TODO Auto-generated method stub
		return boardDAO.hitList();
	}

}
