package com.spring.blog.member.dao;

import org.springframework.dao.DataAccessException;

import com.spring.blog.member.vo.MemberVO;

public interface MemberDAO {
	public boolean loginCheck(MemberVO memberVO)throws DataAccessException;

	public boolean idCheck(String id) throws DataAccessException;
}
