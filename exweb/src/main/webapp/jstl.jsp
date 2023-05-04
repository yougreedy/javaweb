<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--JSTL core 태그라이브러리에서 제공하는 캐그를 c접두어를 붙여서 사용-->     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>
</head>
<body>
<h1>코어태그</h1>
- c:set : pageContext, request, session, servletContext에 속성 저장<br>
   <%-- <% pageContext.setAttribute("score", 80); %> --%>
    <c:set scope="page" var="score" value="${80}" ></c:set> 
     ${pageScope.score}<br>
- c:remove : pageContext, request, session, servletContext에서 속성 삭제<br>
  <%-- <c:remove scope="page" var="score" /> --%>
     ${pageScope.score}<br>
- 조건문 <br>
<c:if test="${score>60}">통과</c:if>
<c:choose>
   <c:when test="${score>=90}">최우수</c:when>
   <c:when test="${score>=80}">우수</c:when>
   <c:otherwise>보통</c:otherwise> 
</c:choose>    
- 반복문 <br>    
<%for(int num=1; num <= 10;num+=2) out.print(num); %>
<c:forEach var="num" begin="1" end="10" step="2">${num}</c:forEach>    
<%
  String[] arr = {"A","B","C"};
  pageContext.setAttribute("pa", arr);
  for(String s : arr) {
	  out.print(s);
  }
%>    
<c:forEach var="s" items="${pa}">${s}</c:forEach>    
<ul>
<c:forEach var="s" items="${pa}" varStatus="stat">
<li>
   ${s} == ${stat.current} 현재값,
   ${state.index} 몇번째반복인지 (0부터), 
   ${state.count} 몇번째반복인지 (1부터),
   ${stat.first}  첫번째반복인지여부, 
   ${stat.last}   마지막반복인지여부, 
   ${stat.begin}  태그의 begin 속성값,
   ${stat.end}    태그의 end 속성값,
   ${stat.step}   태그의 step 속성값,
</li>
</c:forEach> 
</ul> 
<c:forTokens var="tk" items="${'a,b:c,d'}" delims=",:">[${tk}]</c:forTokens><br>
 - 출력 (c:out은 츨력 문자열의 내부의 태그문자를 변환하여 HTML 태그로 해석되지 않도록 출력)
 <% pageContext.setAttribute("str","<h1>제목</h1>"); %>
 ${str}
 <c:out value="${str}"/>
 <br>
 - 주소처리<br>
<a href="menu.jsp">메뉴로이동</a>
<a href="<%=request.getContextPath() %>/menu.jsp">메뉴로이동</a>
<a href="${pageContext.request.contextPath}/menu.jsp">메뉴로이동</a>
<c:set scope="page" var= "cp" value="${pageContext.request.contextPath}"/>
<a href="${cp}/menu.jsp">메뉴로이동</a>
<!-- c:url은 경로가 /로 시작하면, 컨택스트패스를 자동 추가 -->
<a href="<c:url value="/menu.jsp" />">메뉴로이동</a>
<br>
- 다른 JSP 파일을 포함 <br>
다른 jsp파일의 소스코드를 현재 위치에 포함시켜서 하나의 jsp 파일로서 실행
<%@ include file="/menu.jsp" %>
다른 jsp또는 서블릿의 실행결과(출력내용)을 현재 jsp의 출력내용에 포함
<jsp:include page="menu.jsp"/>
jsp:include와 동일하지만, 다른 웹애플리케이션(사이트)의 포함 가능 
<c:import url="menu.jsp"/>
<%--<c:import url="http://google.com"/> --%>
-리다이렉트 : c:redirect 는 컨텍스트패스를 자동추가<br>
<%--<% response.sendRedirect( request.getContextPath() + "/menu.jsp"); --%>
<%--<c:redirect url="/menu.jsp"></c:redirect>--%>
- 주소생성시 파라미터 추가
<c:url value="/hello.jsp">
   <c:param name= "x">abc</c:param>
   <c:param name= "y">abc</c:param>
</c:url>
<br>
- 예외처리
<c:catch var="e">
    <% int a = 5/0; %>
</c:catch>
${e.message}
<h2>국제화/포멧팅 태크</h2>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("d", new Date());%>
${d} <br>
자바Date객체를 원하는 형태의 문자열로 변환 :
<fmt:formatDate value="${d}" pattern="yyyy/MM/dd HH:mm:ss"/> <br>
날짜시간문자열을 자바Date객체로 변환 :
<fmt:parseDate value="2023/05/04 12:34:56" pattern="yyyy/MM/dd HH:mm:ss" var="d2"/>
${d2}<br>
<% pageContext.setAttribute("n", 12345.67);%>
${n} <br>
숫자를 원하는 형태의 문자열로 변환 :
<fmt:formatNumber value="${n}" pattern="###,###.###"/> <br>
<fmt:formatNumber value="${n}" pattern="000,000.000"/> <br>
<fmt:formatNumber value="${n}" pattern="#,###.#"/> <br>
<fmt:formatNumber value="${n}" pattern="0,000.0"/> <br>
숫자문자열을 숫자로 변환 :
<fmt:parseNumber value="12,345.67" pattern="###,###.###" var="n2"/>
${n2}<br>

현재 jsp파일에서 jstl 국제화 태그가 사용할 로케일 강제 지정
지정하지 않으면, Accept-Language
<fmt:setLocale value="en_US"/>
메시지를 저장한 프로퍼티파일이 "클래스패스/폴더명/번들명_언어_국가.properties" 일때,
basename은 "폴더명.번들명" 
<fmt:setBundle basename="msg" var="mb"/>
<fmt:message bundle="${mb}" key="str"/>








</body>
</html>