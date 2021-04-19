package com.spring.blog.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> boardMain(String id) throws DataAccessException;
}
