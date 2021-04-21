package com.spring.blog.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;

public interface BoardDAO {
	public List<BoardVO> boardMain(String id) throws DataAccessException;

	public List<BoardVO> boardList(String id) throws DataAccessException;
	
	public List<Map<String,Object>> pageList(Criteria cri) throws DataAccessException;
	
	public int pageCount(String id) throws DataAccessException;

	public int insertContent(BoardVO boardVO) throws DataAccessException;

	public List<BoardVO> boardView(int contentNO) throws DataAccessException;

	public int modContent(BoardVO boardVO) throws DataAccessException;

	public int delContent(int contentNO) throws DataAccessException;
}
