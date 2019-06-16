<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<h3 align="center">
	<c:forEach items="${totalpage }" var="total" varStatus="status">
		<a href="/imag/imagpage.do?start=${status.current }&end=${status.current }">${status.current }</a>
	</c:forEach>
	<c:if test="${page ne start }">
	</c:if>
	</h3>
</body>
</html>