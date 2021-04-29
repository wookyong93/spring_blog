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
				message ="성공";
			}else {
				message ="실패";
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
				message = "성공";
			}else {
				message = "실패";
			}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/addMember.do", method=RequestMethod.PUT )
	public ResponseEntity addMember(@RequestBody MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		//암호화 레코드 
		memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
		int result = memberService.addMember(memberVO);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		HttpSession session = request.getSession();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		String message =null;
		try {
			if(result != 0) {
				message="성공";
			}else {
				message="실패";
			}
		}catch(Exception e) {
			message = "에러발생 관리자에게 문의하세요";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/logout.do", method= {RequestMethod.GET,RequestMethod.POST})
	// /logout.do 로 이동시 session에 저장된 loginId 값 삭제;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		session.removeAttribute("loginId");
		return mav;
	}

	@Override
	@RequestMapping(value={"/mypage.do","/modMemberForm.do"}, method= {RequestMethod.POST,RequestMethod.GET})
	//마이페이지 화면 전달 (리스트 형태로 정보 전달)
	public ModelAndView mypage(@ModelAttribute("loginId")String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
			List<MemberVO> memberInfo = memberService.memberInfo(id);
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("memberInfo",memberInfo);
		return mav;
	}

	@Override
	@RequestMapping(value="/pwdcheck.do", method=RequestMethod.GET)
	//회원정보 변경전 패스워드확인을 위한 페이지  
	public ModelAndView pwdcheckForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/pwdchk.do", method=RequestMethod.POST)
	//페스워드 확인후 회원정보 페이지 이동
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
				message = "성공";
			}else {
				message = "실패";
			}
		}catch(Exception e) {
			message = "오류발생 관리자에게 문의하세요!";
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
				message="성공";
			}
			
		}catch(Exception e) {
			message="회원정보 변경중  오류 발생 관리자에게 문의하세요";
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
			message="성공";
			
		}catch(Exception e) {
			message="오류발생 관리자에게 문의해주세요";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}
	

}
