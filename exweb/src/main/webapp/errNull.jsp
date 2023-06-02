<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body>
<!--         오류 발생시 실행되는 jsp 파일에서  -->
<!--         pag 디렉티브의 isErrorPage 속성값을 true로 설정하면,  -->
<!--         발생한 예외 객체를 저장학로 있는 exception 내장겍체를 사용 가능 -->
     <h2>발생한 예외 객체 : <%=exception %></h2>
     <h2>발생한 예외 객체 : <%=exception.getMessage() %></h2>
     <h2>발생한 예외 객체 : ${pageContext.exception}</h2>
     <h2>발생한 예외 객체 : ${pageContext.exception.message}</h2>
      
     <h1>넌 내개 null을 줬어??</h1>       
    <img alt="" src="${pageContext.request.contextPath}/img/null.jpg"/>
 
</body>
</html>