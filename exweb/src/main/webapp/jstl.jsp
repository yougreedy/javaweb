<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--JSTL core �±׶��̺귯������ �����ϴ� ĳ�׸� c���ξ �ٿ��� ���-->     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>
</head>
<body>
<h1>�ھ��±�</h1>
- c:set : pageContext, request, session, servletContext�� �Ӽ� ����<br>
   <%-- <% pageContext.setAttribute("score", 80); %> --%>
    <c:set scope="page" var="score" value="${80}" ></c:set> 
     ${pageScope.score}<br>
- c:remove : pageContext, request, session, servletContext���� �Ӽ� ����<br>
  <%-- <c:remove scope="page" var="score" /> --%>
     ${pageScope.score}<br>
- ���ǹ� <br>
<c:if test="${score>60}">���</c:if>
<c:choose>
   <c:when test="${score>=90}">�ֿ��</c:when>
   <c:when test="${score>=80}">���</c:when>
   <c:otherwise>����</c:otherwise> 
</c:choose>    
- �ݺ��� <br>    
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
   ${s} == ${stat.current} ���簪,
   ${state.index} ���°�ݺ����� (0����), 
   ${state.count} ���°�ݺ����� (1����),
   ${stat.first}  ù��°�ݺ���������, 
   ${stat.last}   �������ݺ���������, 
   ${stat.begin}  �±��� begin �Ӽ���,
   ${stat.end}    �±��� end �Ӽ���,
   ${stat.step}   �±��� step �Ӽ���,
</li>
</c:forEach> 
</ul> 
<c:forTokens var="tk" items="${'a,b:c,d'}" delims=",:">[${tk}]</c:forTokens><br>
 - ��� (c:out�� ���� ���ڿ��� ������ �±׹��ڸ� ��ȯ�Ͽ� HTML �±׷� �ؼ����� �ʵ��� ���)
 <% pageContext.setAttribute("str","<h1>����</h1>"); %>
 ${str}
 <c:out value="${str}"/>
 <br>
 - �ּ�ó��<br>
<a href="menu.jsp">�޴����̵�</a>
<a href="<%=request.getContextPath() %>/menu.jsp">�޴����̵�</a>
<a href="${pageContext.request.contextPath}/menu.jsp">�޴����̵�</a>
<c:set scope="page" var= "cp" value="${pageContext.request.contextPath}"/>
<a href="${cp}/menu.jsp">�޴����̵�</a>
<!-- c:url�� ��ΰ� /�� �����ϸ�, ���ý�Ʈ�н��� �ڵ� �߰� -->
<a href="<c:url value="/menu.jsp" />">�޴����̵�</a>
<br>
- �ٸ� JSP ������ ���� <br>
�ٸ� jsp������ �ҽ��ڵ带 ���� ��ġ�� ���Խ��Ѽ� �ϳ��� jsp ���Ϸμ� ����
<%@ include file="/menu.jsp" %>
�ٸ� jsp�Ǵ� ������ ������(��³���)�� ���� jsp�� ��³��뿡 ����
<jsp:include page="menu.jsp"/>
jsp:include�� ����������, �ٸ� �����ø����̼�(����Ʈ)�� ���� ���� 
<c:import url="menu.jsp"/>
<%--<c:import url="http://google.com"/> --%>
-�����̷�Ʈ : c:redirect �� ���ؽ�Ʈ�н��� �ڵ��߰�<br>
<%--<% response.sendRedirect( request.getContextPath() + "/menu.jsp"); --%>
<%--<c:redirect url="/menu.jsp"></c:redirect>--%>
- �ּһ����� �Ķ���� �߰�
<c:url value="/hello.jsp">
   <c:param name= "x">abc</c:param>
   <c:param name= "y">abc</c:param>
</c:url>
<br>
- ����ó��
<c:catch var="e">
    <% int a = 5/0; %>
</c:catch>
${e.message}
<h2>����ȭ/������ ��ũ</h2>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("d", new Date());%>
${d} <br>
�ڹ�Date��ü�� ���ϴ� ������ ���ڿ��� ��ȯ :
<fmt:formatDate value="${d}" pattern="yyyy/MM/dd HH:mm:ss"/> <br>
��¥�ð����ڿ��� �ڹ�Date��ü�� ��ȯ :
<fmt:parseDate value="2023/05/04 12:34:56" pattern="yyyy/MM/dd HH:mm:ss" var="d2"/>
${d2}<br>
<% pageContext.setAttribute("n", 12345.67);%>
${n} <br>
���ڸ� ���ϴ� ������ ���ڿ��� ��ȯ :
<fmt:formatNumber value="${n}" pattern="###,###.###"/> <br>
<fmt:formatNumber value="${n}" pattern="000,000.000"/> <br>
<fmt:formatNumber value="${n}" pattern="#,###.#"/> <br>
<fmt:formatNumber value="${n}" pattern="0,000.0"/> <br>
���ڹ��ڿ��� ���ڷ� ��ȯ :
<fmt:parseNumber value="12,345.67" pattern="###,###.###" var="n2"/>
${n2}<br>

���� jsp���Ͽ��� jstl ����ȭ �±װ� ����� ������ ���� ����
�������� ������, Accept-Language
<fmt:setLocale value="en_US"/>
�޽����� ������ ������Ƽ������ "Ŭ�����н�/������/�����_���_����.properties" �϶�,
basename�� "������.�����" 
<fmt:setBundle basename="msg" var="mb"/>
<fmt:message bundle="${mb}" key="str"/>








</body>
</html>