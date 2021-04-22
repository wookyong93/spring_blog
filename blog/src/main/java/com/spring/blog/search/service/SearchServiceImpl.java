package com.spring.blog.search.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;
import com.spring.blog.search.dao.SearchDAO;

@Service("searchService")
@Transactional
public class SearchServiceImpl implements SearchService{
	@Autowired
	SearchDAO searchDAO;
	@Override
	public List<BoardVO> searchContent(Criteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> searchList = new ArrayList<BoardVO>();
		searchList=searchDAO.searchContent(cri);
		return searchList;
	}
	@Override
	public int pageCount(Criteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		return searchDAO.pageCount(cri);
	}

}
