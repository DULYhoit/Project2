<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="test/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>tttttest ${list}</h2>
<h2>Hello! ${name}</h2> <div>JSP List Test</div>
<c:forEach var="item" items="${list}" varStatus="idx"> ${idx.index}, ${item} <br /> </c:forEach>


</body>
</html>