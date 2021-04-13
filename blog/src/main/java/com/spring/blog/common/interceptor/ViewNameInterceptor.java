package com.spring.blog.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		try {
			String viewName = getViewName(request);
			request.setAttribute("viewName", viewName);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	private String getViewName(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String contextPath = request.getContextPath();
		
		String uri=(String) request.getAttribute("javax.servlet.include.request_uri");
		
		if(uri==null || uri.trim().equals("")) {
			uri=request.getRequestURI();
		}
		int begin =0;
		if(!((contextPath == null) || contextPath.equals(""))) {
			begin = contextPath.length();
		}
		int end;
		if(uri.indexOf(";")!=-1) {
			end = uri.indexOf(";");
		}else if(uri.indexOf("?")!=-1) {
			end = uri.indexOf("?");
		}else {
			end=uri.length();
		}
		
		String fileName = uri.substring(begin,end);
		if(fileName.indexOf(".")!=-1) {
			fileName=fileName.substring(0,fileName.lastIndexOf("."));
		}
		if(fileName.lastIndexOf("/")!=-1) {
			fileName = fileName.substring(fileName.lastIndexOf("/",1),fileName.length()); 
		}
		
		return fileName;
	}

}
