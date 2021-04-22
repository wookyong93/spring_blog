package com.spring.blog.search.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;

@Repository("searchDAO")
public class SearchDAOImpl implements SearchDAO{

	@Autowired
	SqlSession sqlSession;
	@Autowired
	Criteria cri;
	
	
	@Override
	public List<BoardVO> searchContent(Criteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		List<BoardVO> searchList= new ArrayList<BoardVO>();
		searchList=sqlSession.selectList("mapper.board.searchContent",cri);
		return searchList;
	}


	@Override
	public int pageCount(Criteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.board.searchPageCount",cri);
	}

}
