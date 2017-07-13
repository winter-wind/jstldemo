<%@page import="cc.biibi.customers.Customers"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 产生一个url 可以cookie是否可用来智能进行url重写，对get请求的参数进行编码 -->
	<c:url  value="/index.jsp" var="indexurl">
	<c:param name="name" value="hello"></c:param>
	</c:url>
	url:${indexurl }
	<br>
	
	<%--  
	<c:redirect url="/index.jsp"></c:redirect> 
	--%>
	<!-- 重定向到一个页面 -->
	<c:import url="http://www.baidu.com"></c:import>
	<!-- 可以包含页面到当前页面 -->
	<br>
	遍历：<c:forEach begin="0" end="9" step="2" var="i" varStatus="xxx">
		${xxx }--${i }<br>
	</c:forEach>
	<!-- begin：开始     end:结束  step:遍历条件   var:名字 -->
	<br>

	<c:choose>
		<c:when test="${param.age >60 }">老年</c:when>
		<c:when test="${param.age >40 }">中年</c:when>
		<c:when test="${param.age >20 }">青年</c:when>
		<c:otherwise>少年</c:otherwise>
	</c:choose>
	<!-- 以上为if...else when和otherwise必须在choose内，when一个满足后面不执行，没有满足的执行otherwise -->
	
	<br>
	<c:set value="19" var="age" scope="request"></c:set>
	<h3>c:if :</h3>
	<c:if test="${requestScope.age >18 }">成年了</c:if>
	<!-- 判断语句  没有else 但可以把数据存起来，以备后用 --><br>
	<c:if test="${param.age >18 }" var="isage" scope="request"></c:if>
				<!-- 这个要在网址后面添加age -->
	<c:out value="${requestScope.isage }"></c:out>
	<!-- ------------------------------------------------------------------------------------------- -->

	<% request.setAttribute("jstl", "<<javaweb>>"); %><!-- 这个设置不能在%后用"=" -->
	<h4>EL：</h4>
	${requestScope.jstl }<!-- 这个无法显示，因为有<> -->
	<br>
	<h4>JSTL:</h4>
	<c:out value="${requestScope.jstl }" default="null"></c:out><!-- 用jstl可以显示  default为默认值当value没有数据时用到-->
	<br>
	<!-- 以上为显示 -->
	<!-- ----------------------------------------------------------------------------------------------- -->
	
	<c:set var="name" value="biibi.cc" scope="page"></c:set>
	<%-- 相当于
		pageContext.setAttribute("name", "biibi.cc");
	--%>
	EL-name:${pageScope.name }<br>
	JSTL-name:<c:out value="${pageScope.name }"></c:out>
	
	<c:set var="name1" value="${param.name1 }" scope="session"></c:set>
	<br>
	name1:<c:out value="${sessionScope.name1 }"></c:out>
	<br>
	
	<br>
	<c:set value="2017-07-11" var="data" scope="session"></c:set>
	data:<c:out value="${sessionScope.data }"></c:out>
	
	<c:remove var="data" scope="session"/><!-- 移除 -->
	data:--<c:out value="${sessionScope.data }"></c:out>--
	<!-- ------------------------------------------------------------------------------------------------------- -->
	<br>
	
	<%
	 	Customers cc = new Customers();
		cc.setId(10086);
		request.setAttribute("cc", cc);
	%>
	old_customers:<c:out value="${requestScope.cc.id }"></c:out><br>
	<c:set target="${requestScope.cc }" property="id" value="${param.id }"></c:set>
	<!--     目标值							属性				在网址后面的值 -->
	new_customers:<c:out value="${requestScope.cc.id }"></c:out>
	<!-- 以上程序需要在网址后添加？id=100 -->
</body>
</html>