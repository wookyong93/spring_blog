package com.spring.blog.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ModelAndView boardMain( @RequestParam("loginId") String id,HttpServletRequest request, HttpServletResponse response ) throws Exception;
}
