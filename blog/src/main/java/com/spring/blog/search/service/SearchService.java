package com.spring.blog.search.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;

public interface SearchService {
	public List<BoardVO> searchContent(Criteria cri)throws DataAccessException;

	public int pageCount(Criteria cri) throws DataAccessException;
}
