<%@page import="dao.StudentDao"%>
<%@page import="entity.Student"%>
<%@page import="java.io.Closeable"%>
<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>千度两下，也不知道</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<style>
</style>
</head>

<body>
	<a href="student.jsp">查看学生</a>
	<%
		Cookie[] cookies = request.getCookies();
		boolean flag = false;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("userName")) {
					flag = true;
					break;
				}
			}
		}
		if (flag) {
	%>
	已登录
	<%
		} else {
	%>
	<a href="login.jsp">请登录</a>
	<%
		}
	%>
</body>
</html>
