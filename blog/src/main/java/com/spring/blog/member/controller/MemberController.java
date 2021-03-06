package com.spring.blog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.member.vo.MemberVO;

public interface MemberController {
	public ResponseEntity loginCheck(@RequestBody MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity idCheck(@RequestParam("id") String id, HttpServletRequest request , HttpServletResponse response) throws Exception;
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity addMember(@RequestBody MemberVO memberVO,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypage(@RequestParam("loginId")String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView pwdcheckForm(HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ResponseEntity pwdcheck(@RequestBody MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modMember(@RequestBody MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity delMember(@RequestParam("id") String id, HttpServletRequest request , HttpServletResponse response) throws Exception;
	
}
