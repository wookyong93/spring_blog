package com.spring.blog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity loginCheck(@ModelAttribute("member") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity idCheck(@RequestParam("id") String id, HttpServletRequest request , HttpServletResponse response) throws Exception;
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity addMember(@ModelAttribute("member")MemberVO memberVO,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
