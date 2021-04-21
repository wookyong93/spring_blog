package com.spring.blog.search.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.search.vo.SearchVO;

public interface SearchController {
	public ModelAndView searchContent(@ModelAttribute("search") SearchVO searchVO,HttpServletRequest request,HttpServletResponse response) throws Exception;
}
