package com.spring.blog.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.board.dao.BoardDAO;
import com.spring.blog.board.vo.BoardVO;


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

}
