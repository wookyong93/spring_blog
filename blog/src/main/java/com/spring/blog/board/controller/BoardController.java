package com.spring.blog.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.board.vo.BoardVO;
import com.spring.blog.board.vo.Criteria;

public interface BoardController {
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView boardMain( @RequestParam("loginId") String id, Criteria cri,HttpServletRequest request, HttpServletResponse response ) throws Exception;
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity insertContent(@ModelAttribute("board") BoardVO boardVO ,HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView viewForm(@RequestParam("contentNO") int contentNO,HttpServletRequest request , HttpServletResponse response) throws Exception;
	public ResponseEntity modContent(@ModelAttribute("board")BoardVO boardVO, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ResponseEntity delContent(@RequestParam("contentNO")int contentNO,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView hitboard(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
