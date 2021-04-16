package com.spring.blog.member.service;

import org.springframework.dao.DataAccessException;

import com.spring.blog.member.vo.MemberVO;

public interface MemberService {
	public boolean loginCheck(MemberVO memberVO)throws DataAccessException;

	public boolean idCheck(String id)throws DataAccessException;
}
