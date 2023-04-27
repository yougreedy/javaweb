<%@page import="com.exam.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jsp</title>
</head>
<body>
       <h1>HELLO JSP</h1>
<!-- html 주석  -->
<%-- jsp 주석 --%>
 <%--  
jsp 구성 요서
- 디렉티브 : page(현재 jsp 파일전체에대한설정), include(다른 jap파일포함), taglib(태그라이브러리사용)
  <%@ 디렉티브명 속성명+"속성값" %>
- 스크립트요소
  -스프립트릿 : <% 서블릿의service 메서드내부에들어갈자바코드 %>
  -표현식 : <%= 현재위치에결과값을출력할자바코드 %>
  -선언부 :  <%! 서블릿service메서드외부에들어갈자바코드 %>
  -주석
-액션태그 : 자주 사용하는 자바코드를 대체할 수 있는 태크
- EL : 
-커스텀태그
  --%>  
  <%
 //  변수 선언없이 사용가능한 내장객체(기본객체) :
 //  request(요청객체) ,response(응답객체), session(세션객체), application(서블릿컨택스트객체)  
 //  out(응답출력스트림),config(서블릿설정), pageContext(현재jsp파일에대한모든정보를담은객체)  
 //  page(현재jsp서블릿겍체), exception(반생한예외, 에러페이지에서만사용가능)  
  out.println("출력할내용");
  out.println(session == request.getSession());
  out.println(application == getServletContext());
  out.println(config == getServletConfig());
 // pageContext 객체에 현재 jsp 파일에서만 사용가능한 데이터를 속성으로 저장 가능 
    pageContext.setAttribute("pa", "pv");
    out.println(pageContext.getAttribute("pa"));
 // pageContext 객체에는 다른 내장객체들이 모두 저정되어 있다.
 out.println(request == pageContext.getRequest()); 
 out.println(response == pageContext.getResponse()); 
 out.println(session == pageContext.getSession()); 
 out.println(application == pageContext.getServletContext()); 
  %>
  <%! // jsp파일이 최초 실행될 때 한번만 실해알 자바 코드
    int global = 0; 
  %> 
  <%  //jsp파일이 실행될 때마다 헌번씩 반복 실행할 자바 코드
     int local = 0;
     out.println("local:" + ++local);
     out.println("global:" + ++global);    
  %>
  <hr>
  표현식 : <% out.print(local); %> <%= local %>
 <hr>
  액션태그 : 
 <%
   MemberVo v = (MemberVo)pageContext.getAttribute("m");
   if(v==null){
	   v = new MemberVo();
	   pageContext.setAttribute("m", v);
   }
   v.setMemId("a001");
   out.print(v.getMemId());
 %>
 
 <jsp:useBean id="m" class="com.exam.member.MemberVo" scope="page"></jsp:useBean>
 <jsp:setProperty name="m" property="memId" value="a001"/>
 <jap:getProperty name="m" property="memId"  />
 <% 
  //request.getRequestDispatcher("/menu.jsp").forward(request, response);
  request.getRequestDispatcher("/menu.jsp").include(request, response);
 %>
 <%-- <jsp:forward page=""></jsp:forward>--%>
 <jsp:include page="/menu.jsp"></jsp:include>
</body>
</html>