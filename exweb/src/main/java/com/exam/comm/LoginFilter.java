package com.exam.comm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.member.MemberVo;

//필터 : 서블릿의 실행 전후에 끼어들어가서 실행
//      다수의 서블릿들이 수행하는 공통작업을 실행할때 사용
//      Filter 인터페이스를 구현하여 필터 클래스 정의
//web.xml 에 <filter> 태그로 등록하거나, 클래스에 @WebFilter 적용


public class LoginFilter implements Filter {
	// 로그인 없이 사용가능한 요청결로들을 저장한 목록
   private List<String> whiteList = new ArrayList<>();
   
	@Override
 public void init(FilterConfig filterConfig) throws ServletException {
       whiteList.add("/member/login.do");
       whiteList.add("/member/add.do");
 }	 
   
   
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		       //필터의 경로에 맞는 요청이 올때마다 한번씩 실행
		       HttpServletRequest req = (HttpServletRequest) request;
		       HttpServletResponse resp = (HttpServletResponse) response;
		       
		        System.out.println("URI" + req.getRequestURI());
		        System.out.println("URL" + req.getRequestURL());
		        String reqPath = req.getRequestURI().substring(req.getContextPath().length());
		        System.out.println("reqPath: " + reqPath);
		        
		        
		        if(whiteList.contains(reqPath) == false) {
		        	//요청보낸 사용자의 세션을 가져와서
		        	HttpSession session = req.getSession();
		        	//세션에 로그인정보를 꺼내와서
		        	MemberVo vo = (MemberVo) session.getAttribute("loginUser");
		        	//로그인 정보가 없다면,
		        	if(vo == null) {//로그인 실패시, 로그인 화면으로 이동
		        		//로그인페이지로 이동	
		        		resp.sendRedirect(req.getContextPath() + "/member/login.do");  
		        		return;    
		        	}
		         }
		        
			    
		//이후 실행될 필터 또는 서블릿들을 실행
		chain.doFilter(request, response); // 실제 서블릿 실행시키는 부분
		
	}
	
	
}

   
	
//	@Override
//	public void destroy() {
//		//필터 객체가 소멸(삭제)되기 전에 1번 실행
//		 System.out.println("CharEncFilter destroy() 실행");   
//	}


