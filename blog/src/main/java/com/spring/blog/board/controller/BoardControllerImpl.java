package com.spring.blog.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.board.service.BoardService;
import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;
import com.spring.blog.board.vo.PageMaker;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	@Autowired
	BoardService boardService;
	
	@Override
	@RequestMapping(value={"/main.do","/latelyBoard.do"},method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewName=(String) request.getAttribute("viewName");
		HttpSession session =request.getSession();
		session.removeAttribute("okId");
		List<BoardVO> latelyList = boardService.allLately();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("latelyList",latelyList);
		return mav;
	}
	@Override
	@RequestMapping(value="/boardmain.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView boardMain(@RequestParam("loginId")String id,Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.boardCount(id));
		cri.setId(id);
		List<Map<String,Object>> bList = boardService.pageList(cri);
		List<BoardVO> boardMain = new ArrayList<BoardVO>();
		boardMain = boardService.boardMain(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("bList",bList);
		mav.addObject("pageMaker",pageMaker);
		mav.addObject("boardMain",boardMain);
		return mav;
	}

	@Override
	@RequestMapping(value="/writeForm.do")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String viewname = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewname);
		return mav;
	}

	@Override
	@RequestMapping(value="/insertContent.do" ,method=RequestMethod.POST)
	public ResponseEntity insertContent(@ModelAttribute("board")BoardVO boardVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		String message = null;
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		boardVO.setId((String)session.getAttribute("loginId"));
		int result = boardService.insertContent(boardVO);
		try {
			if(result != 0)
			message="<script>alert('글 저장 성공');location.href='"+request.getContextPath()+"/boardmain.do?loginId="+boardVO.getId()+"';</script>";
		}catch(Exception e) {
			message="<script>alert('오류 발생 관리자에게 문의하세요');location.href='"+request.getContextPath()+"/main.do';</script>";
		}
			resEnt = new ResponseEntity(message, responseHeaders,HttpStatus.CREATED);
		return resEnt;
	}

	@Override
	@RequestMapping(value={"/viewForm.do","/modForm.do"} , method=RequestMethod.GET)
	public ModelAndView viewForm(@RequestParam("contentNO")int contentNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<BoardVO> boardView = boardService.viewBoard(contentNO);
		mav.addObject("boardView",boardView);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modContent.do", method=RequestMethod.POST)
	public ResponseEntity modContent(@ModelAttribute("board")BoardVO boardVO, HttpServletRequest request,HttpServletResponse response) throws Exception{
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		String message=null;
		int result = boardService.modContent(boardVO);
		try {
			
			message="<script>alert('수정되었습니다.');location.href='"+request.getContextPath()+"/viewForm.do?contentNO="+boardVO.getContentNO()+"';</script>";
			
		}catch(Exception e) {
			message="<script>alert('오류 발생 관리자에게 문의하세요');location.href='"+request.getContextPath()+"/main.do';</script>";
		}
		resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}

	@Override
	@RequestMapping(value="/delContent.do")
	public ResponseEntity delContent(@RequestParam("contentNO")int contentNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String message=null;
		int reuslt = boardService.delContent(contentNO);
		try {
			message="<script>alert('삭제 완료되었습니다.');location.href='"+request.getContextPath()+"/boardmain.do?loginId="+session.getAttribute("loginId")+"';</script>";
		}
		catch(Exception e) {
			message="<script>alert('오류 발생 관리자에게 문의하세요');location.href='"+request.getContextPath()+"/main.do';</script>";
		}
		resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/hitBoard.do")
	public ModelAndView hitboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName=(String) request.getAttribute("viewName");
		List<BoardVO> hitList = boardService.hitList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hitList",hitList);
		return mav;
	}

	
}
