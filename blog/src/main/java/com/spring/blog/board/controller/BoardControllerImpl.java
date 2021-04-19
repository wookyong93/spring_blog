package com.spring.blog.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value="/boardmain.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView boardMain(@RequestParam("loginId")String id,Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.boardCount(id));
		cri.setId(id);
		System.out.println(request.getParameter("page"));
		System.out.println(cri.getPage());
		System.out.println(cri.getPerPageNum());
		System.out.println(cri.getPageStart());
		System.out.println(cri.getId());
		System.out.println(pageMaker.getEndPage());
		List<Map<String,Object>> bList = boardService.pageList(cri);
		List<BoardVO> boardMain = new ArrayList<BoardVO>();
		boardMain = boardService.boardMain(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("bList",bList);
		mav.addObject("pageMaker",pageMaker);
		mav.addObject("boardMain",boardMain);
		return mav;
	}

}
