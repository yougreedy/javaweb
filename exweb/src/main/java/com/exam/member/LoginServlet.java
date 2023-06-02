package com.exam.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 1.브라우저에 주소창에
// http://localhost:8000/exweb/member/login.do
// 를 입력하면 접소하면, LoginServlet 클래스와 login.jsp 파일이 순차적으로 실행되어
// 브라우저에 로그인 화면이 출력되도록 구현
// 2. 로그인 화면에서 submint 버튼을 클릭하면,
// LoginServlet 클래스의 doPost가 실행되도록 구현
@WebServlet("/member/login.do")
public class LoginServlet extends HttpServlet {
	private MemberService memberService = MemberServiceImpl.getInstacne();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// String memId = req.getParameter("memId");
   	// MemberVo vo = memberDao.selectMemberList(memId);
	// req.setAttribute("mvo", vo);	
       
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//req.setCharacterEncoding("UTF-8"); 필터로 이동
		MemberVo vo = new MemberVo();
		vo.setMemId(req.getParameter("memId"));
	    vo.setMemPass(req.getParameter("memPass"));
	     
		
	    MemberVo mvo = memberService.selectLogin(vo);
		
	    if(mvo == null) {//로그인 실패시, 로그인 화면으로 이동
	      resp.sendRedirect(req.getContextPath() + "/member/login.do"); 
	    } else { //로그인 성공
//	       요청객체, 세션객체(사용),서블릿컨텍스트객체
	      HttpSession session = req.getSession();
	      session.setAttribute("loginUser", mvo);//세션에 로그인한 사용자정보 저장
	      resp.sendRedirect(req.getContextPath() + "/member/list.do");// 회원목록화면으로 이동 
	    	
	    }
	    
	    
	}
	

}
		// 이시점에서 추가된 목록을 보여주고 싶다면?
		// 회원목록 출력
		// MemListServlet 실행! 3가지 방법
		// forward : 요청객체와 응답객체를 전달하면서, 지정한 주소의 서블릿을 실행
		// req.getRequestDispatcher("/member/list.do").forward(req, resp); 
		// forward와 include 차이 : forward ->현재 서블릿에서는 더 이상 응답을 출력하지 않는다. 
//		   				          include ->현재 서블릿의 출력 내용 중간에 지정한 서블릿의 출력 내용을 포함. 
 		// include : 요청객체와 응답객체를 전달하면서, 지정한 주소의 서블릿을 실행
		// req.getRequestDispatcher("/member/list.do").include(req, resp); // 모든화면에서 공통적인것을 보여줘야될때, 메뉴바 같은거... 이럴때 사용함.
			
		// redirect : 지정한 주소로 이동하라는 명령을 담은 응답을 웹브라우저에게 전송
		
		
//			resp.setCharacterEncoding("UTF-8");
//			resp.setContentType("text/html");
//			PrintWriter out = resp.getWriter();
//			out.println("<!DOCTYPE html>       ");
//			out.println("<html>                ");
//			out.println("<head>                ");
//			out.println("<meta charset='UTF-8'>");
//			out.println("<title>회원 추가 성공</title>  ");
//			out.println("</head>               ");
//			out.println("<body>                ");
//			out.println("<h1>" + n + "명의 회원 추가 성공</h1>");
//			out.println("<a href='" + req.getContextPath() + "/member/list.do' >회원목록</a>");
//			out.println("<button onclick=\"location.href='" + req.getContextPath() + "/member/list.do'\">회원목록</button >");
//			out.println("</body>               ");
//			out.println("</html>               ");
		
	
	

