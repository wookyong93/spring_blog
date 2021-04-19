package com.spring.blog.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.blog.member.vo.MemberVO;

public interface MemberService {
	public boolean loginCheck(MemberVO memberVO)throws DataAccessException;

	public boolean idCheck(String id)throws DataAccessException;

	public int addMember(MemberVO memberVO)throws DataAccessException;

	public List<MemberVO> memberInfo(String id)throws DataAccessException;

	public int pwdCheck(MemberVO memberVO)throws DataAccessException;

	public int modMember(MemberVO memberVO)throws DataAccessException;
}
