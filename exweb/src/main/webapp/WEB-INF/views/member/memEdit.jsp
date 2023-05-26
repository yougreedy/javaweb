<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<!DOCTYPE html>       
	<html>                
    <head>               
	<meta charset='UTF-8'>
   <title>회원관리</title> 
	</head>
	               
	<body>
	<jsp:include page="/WEB-INF/views/menu.jsp"/>                
	<h1>회원정보변경</h1> 	
	<form action='${pageContext.request.contextPath}/member/edit.do' method='post'>   
<%-- 	아이디: <c:out value="${mvo.memId}"/> <br> --%>
<%-- 	      <input type='hidden' name='memId' value='<c:out value="${mvo.memId}"/>'/>    --%>
 	아이디: <input type='text' name='memId' value='<c:out value="${mvo.memId}"/>' readonly="readonly"/><br>  
	<!--  비밀번호: <input type='password' name='memPass' value='' /><br>-->
	이름: <input type='text' name='memName' value='<c:out value="${mvo.memName}"/>'/><br>      
	 포인트: <input type='number' name='memPoint' value='${mvo.memPoint}' /><br>
    <input type='submit' />                                     
	</form>                                                    
    </body>               
    </html> 
     	 
<!--     1.회원정보변경 화면에서 아룸과 포인트를 변경하고 submit 버튼을 클릭하면, -->
<!--     MemEditServlet 클래스의 doPost 메서드가 실행되도록 memEdit.jsp 파일을 변경하세요.. -->
<!--     2.회원정보변경 화면에서 아이디는 키보드로 값을 입력(변경)할 수 없도록  -->
<!--       memEdit.jsp 파일을 변경하세요. -->
<!--     3.MemEditServlet 클래스의 doPost 메서드에서 사용자가 입력한 정보에 따라서  -->
<!--     데이터베이스의 회원 정보(이름과, 폰인트)가 변경되도록 -->
<!--     MemEditServlet.java, MemberDao.java, MemberDaoBatis.java, MemberMapper.xml 파을을 변경하세요      -->