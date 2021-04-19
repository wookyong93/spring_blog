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
@Transactional
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

}
