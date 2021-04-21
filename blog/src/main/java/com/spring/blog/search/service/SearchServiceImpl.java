package com.spring.blog.search.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.search.dao.SearchDAO;
import com.spring.blog.search.vo.SearchVO;

@Service("searchService")
@Transactional
public class SearchServiceImpl implements SearchService{
	@Autowired
	SearchDAO searchDAO;
	@Override
	public List<BoardVO> searchContent(SearchVO searchVO) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> searchList = new ArrayList<BoardVO>();
		searchList=searchDAO.searchContent(searchVO);
		return searchList;
	}

}
