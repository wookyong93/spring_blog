package com.spring.blog.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonEncoding;
import com.spring.blog.board.service.BoardService;
import com.spring.blog.member.service.MemberService;
import com.spring.blog.member.vo.MemberVO;


@RestController("memberController")
public class MemberControllerImpl implements MemberController{
	
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/login.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
		
	}
	@Override
	@RequestMapping(value="/loginCheck.do" ,method=RequestMethod.POST)
	public ResponseEntity loginCheck(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
		ResponseEntity resEnt =null;
		String message = null;
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String pwd = memberVO.getPwd();
		String encodepwd = memberService.pwdCheck(memberVO);
		
		boolean result = passwordEncoder.matches(pwd,encodepwd);
		
		try {
			
			if(result) {
				session.setAttribute("loginId", memberVO.getId());
				message ="??????";
			}else {
				message ="??????";
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
	public ResponseEntity idCheck(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEnt =null;
		HttpHeaders responseHeaders =new HttpHeaders();
		String message=null;
		HttpSession session = request.getSession();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		boolean result = memberService.idCheck(id);
		
			if(result) {
				message = "??????";
			}else {
				message = "??????";
			}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/addMember.do", method=RequestMethod.PUT )
	public ResponseEntity addMember(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		//????????? ????????? 
		memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
		int result = memberService.addMember(memberVO);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		HttpSession session = request.getSession();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		String message =null;
		try {
			if(result != 0) {
				message="??????";
			}else {
				message="??????";
			}
		}catch(Exception e) {
			message = "???????????? ??????????????? ???????????????";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/logout.do", method= {RequestMethod.GET,RequestMethod.POST})
	// /logout.do ??? ????????? session??? ????????? loginId ??? ??????;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		session.removeAttribute("loginId");
		return mav;
	}

	@Override
	@RequestMapping(value={"/mypage.do","/modMemberForm.do"}, method= {RequestMethod.POST,RequestMethod.GET})
	//??????????????? ?????? ?????? (????????? ????????? ?????? ??????)
	public ModelAndView mypage(@ModelAttribute("loginId")String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
			List<MemberVO> memberInfo = memberService.memberInfo(id);
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("memberInfo",memberInfo);
		return mav;
	}

	@Override
	@RequestMapping(value="/pwdcheck.do", method=RequestMethod.GET)
	//???????????? ????????? ????????????????????? ?????? ?????????  
	public ModelAndView pwdcheckForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/pwdchk.do", method=RequestMethod.POST)
	//???????????? ????????? ???????????? ????????? ??????
	public ResponseEntity pwdcheck(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String pwd = memberVO.getPwd();
		String encodepwd = memberService.pwdCheck(memberVO);
		boolean result = passwordEncoder.matches(pwd,encodepwd);
		
		HttpSession session = request.getSession();
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		String message = null;
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		try {
			if(result) {
				message = "??????";
			}else {
				message = "??????";
			}
		}catch(Exception e) {
			message = "???????????? ??????????????? ???????????????!";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/modMember.do", method=RequestMethod.PUT)
	public ResponseEntity modMember(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		String message = null;;
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
		int result= memberService.modMember(memberVO);
		try {
			if(result ==1) {
				message="??????";
			}
			
		}catch(Exception e) {
			message="???????????? ?????????  ?????? ?????? ??????????????? ???????????????";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/delMember.do", method=RequestMethod.DELETE)
	public ResponseEntity delMember(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		String message = null;;
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		memberService.delMember(id);
		try {	
			
			session.removeAttribute("loginId");
			message="??????";
			
		}catch(Exception e) {
			message="???????????? ??????????????? ??????????????????";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}
	

}
