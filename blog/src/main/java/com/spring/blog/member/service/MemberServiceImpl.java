package com.spring.blog.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.member.dao.MemberDAO;
import com.spring.blog.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;

	@Override
	public boolean loginCheck(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		boolean result = memberDAO.loginCheck(memberVO);
		return result;
	}

	@Override
	public boolean idCheck(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		boolean result = memberDAO.idCheck(id);
		return result;
	}
}
