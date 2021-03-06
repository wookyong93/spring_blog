package com.spring.blog.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.member.dao.MemberDAO;
import com.spring.blog.member.vo.MemberVO;

@Service("memberService")
@Transactional(rollbackFor = DataAccessException.class)
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

	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.addMember(memberVO);
		return result;
	}

	@Override
	public List<MemberVO> memberInfo(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		List<MemberVO> memberInfo = memberDAO.memberInfo(id);
		return memberInfo;
	}

	@Override
	public String pwdCheck(MemberVO memberVO) throws DataAccessException {
		String result = memberDAO.pwdCheck(memberVO);
		return result;
	}

	@Override
	public int modMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.modMember(memberVO);
		return result;
	}

	@Override
	public void delMember(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		memberDAO.delMember(id);
		
	}
}
