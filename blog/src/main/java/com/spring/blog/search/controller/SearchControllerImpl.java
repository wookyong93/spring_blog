package com.spring.blog.search.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.search.service.SearchService;
import com.spring.blog.search.vo.SearchVO;

@Controller("searchController")
public class SearchControllerImpl implements SearchController{
	@Autowired
	SearchService searchService;
	@Autowired
	BoardVO boardVO;
	@Override
	@RequestMapping(value="/searchContent.do")
	public ModelAndView searchContent(@ModelAttribute("search")SearchVO searchVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<BoardVO> searchList = new ArrayList<BoardVO>();
		searchList=searchService.searchContent(searchVO);
		mav.addObject("selector",searchVO.getSelector());
		mav.addObject("who", searchVO.getWho());		
		mav.addObject("searchList",searchList);
		return mav;
	}

}
