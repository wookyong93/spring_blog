package com.spring.blog.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;

public interface BoardService {
	public List<BoardVO> boardMain(String id) throws DataAccessException;

	public List<BoardVO> boardList(String id) throws DataAccessException;
	
	public List<Map<String, Object>> pageList(Criteria cri) throws DataAccessException;
	
	public int boardCount(String id) throws DataAccessException;

	public int insertContent(BoardVO boardVO) throws DataAccessException;

	public List<BoardVO> viewBoard(int contentNO) throws DataAccessException;

	public int modContent(BoardVO boardVO)throws DataAccessException;

	public int delContent(int contentNO)throws DataAccessException;

}
