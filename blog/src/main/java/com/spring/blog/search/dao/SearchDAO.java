package com.spring.blog.search.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;


public interface SearchDAO {

	List<BoardVO> searchContent(Criteria cri)throws DataAccessException;

	int pageCount(Criteria cri) throws DataAccessException;

}
