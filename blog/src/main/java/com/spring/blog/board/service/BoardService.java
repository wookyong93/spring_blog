package com.spring.blog.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardMain(String id) throws DataAccessException;
}
