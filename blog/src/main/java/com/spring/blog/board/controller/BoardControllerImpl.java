package com.spring.blog.board.controller;

import java.util.ArrayList;
import java.util.List;

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

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	@Autowired
	BoardService boardService;
	
	@Override
	@RequestMapping(value="/boardmain.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView boardMain(@RequestParam("loginId")String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<BoardVO> boardMain = new ArrayList<BoardVO>();
		boardMain = boardService.boardMain(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("boardMain",boardMain);
		return mav;
	}

}
