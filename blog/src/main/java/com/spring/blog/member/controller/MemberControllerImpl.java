package com.spring.blog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.member.service.MemberService;
import com.spring.blog.member.vo.MemberVO;


@Controller("memberController")
public class MemberControllerImpl implements MemberController{
	
	@Autowired
	MemberService memberService;
	
	@Override
	@RequestMapping(value="/main.do",method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName=(String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
		
	}
	@Override
	@RequestMapping(value="/loginCheck.do" ,method=RequestMethod.POST)
	public ResponseEntity loginCheck(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		ResponseEntity resEnt =null;
		String message = null;
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html;charset=utf-8");
		HttpSession session = request.getSession();
		try {
			boolean result = memberService.loginCheck(memberVO);
			if(result) {
				session.setAttribute("loginId", memberVO.getId());
				message ="<script>alert('로그인 성공');location.href='"+request.getContextPath()+"/main.do';</script>";
			}else {
				message ="<script>alert('로그인 실패');location.href='"+request.getContextPath()+"/login.do';</script>";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		resEnt = new ResponseEntity(message, httpHeaders, HttpStatus.OK);
		return resEnt;
	}
	@RequestMapping(value="/joinForm.do",method= {RequestMethod.POST ,RequestMethod.GET})
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST )
	public ResponseEntity idCheck(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEnt =null;
		HttpHeaders responseHeaders =new HttpHeaders();
		String message=null;
		HttpSession session = request.getSession();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		
		boolean result = memberService.idCheck(id);
		
		if(result) {
			session.setAttribute("okId", id);
			message = "<script>alert('사용가능한 아이디입니다.');location.href='"+request.getContextPath()+"/joinForm.do';</script>";
		}else {
			message = "<script>alert('중복된 아이디 입니다.');location.href='"+request.getContextPath()+"/joinForm.do';</script>";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("member")MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		int result = memberService.addMember(memberVO);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		HttpSession session = request.getSession();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		String message =null;
		try {
		if(result != 0) {
			message="<script>alert('회원가입 성공!! "+memberVO.getId()+"님 가입을 환영합니다.');location.href='"+request.getContextPath()+"/login.do';</script>";
		}
		}catch(Exception e) {
			message = "<script>alert('오류가 발생했습니다 관리자에게 문의해주세요');location.href='"+request.getContextPath()+"/main.do';</script>";
		}
		session.removeAttribute("okId");
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		return resEnt;
	}
	

}
