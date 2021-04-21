package com.spring.blog.search.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.search.vo.SearchVO;

@Repository("searchDAO")
public class SearchDAOImpl implements SearchDAO{

	@Autowired
	SqlSession sqlsession;
	@Autowired
	SearchVO searchVO;
	
	
	@Override
	public List<BoardVO> searchContent(SearchVO searchVO) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> searchList= new ArrayList<BoardVO>();
		System.out.println(searchVO.getWho());
		System.out.println(searchVO.getSelector());
		searchList=sqlsession.selectList("mapper.board.searchContent",searchVO);
		return searchList;
	}

}
