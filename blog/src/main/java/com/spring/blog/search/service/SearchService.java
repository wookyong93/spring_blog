package com.spring.blog.search.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.search.vo.SearchVO;

public interface SearchService {
	public List<BoardVO> searchContent(SearchVO searchVO)throws DataAccessException;
}
