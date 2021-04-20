package com.spring.blog.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CommonController {
	public ModelAndView viewMap(HttpServletRequest request, HttpServletResponse response) throws Exception;  
}
