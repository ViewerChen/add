<%@page import="dao.StudentDao"%>
<%@page import="entity.Student"%>
<%@page import="java.io.Closeable"%>
<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">

<style>
#box {
	width: 600px;
	margin: 20px auto;
}

.fenye {
	margin: 0px;
	padding: 0px;
	margin-left: 270px;
}

.fenye li {
	list-style: none;
	float: left;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 140%;
	border: 1px solid #ddd;
	text-align: center;
	margin-left: -1px;
	color: #337ab7;
}

.fenye li:first-child {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px
}

.fenye li:last-child {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.fenye li:hover {
	background: #eee;
	cursor: pointer;
}

.fenye .active {
	color: #fff;
	background: #337ab7;
	border-color: #337ab7;
}

.fenye .active:hover {
	color: #fff;
	background: #337ab7;
	border-color: #337ab7;
}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var ye = ${ye};
		var maxYe = ${maxYe};
		$(".fenye li:first").click(function() {
			if (ye > 1) {
				location.href = "student?ye=" + (ye - 1);
			}
		});
		$(".fenye li:first").mouseover(function() {
			if (ye <= 1) {
				$(this).css("cursor", "not-allowed");
			}
		});
		$(".fenye li:last").click(function() {
			if (ye < maxYe) {
				location.href = "student?ye=" + (ye + 1);
			}
		});
		$(".fenye li:last").mouseover(function() {
			if (ye >=maxYe) {
				$(this).css("cursor", "not-allowed");
			}
		});
		$("[name=namePage]").click(function() {
			ye = $(this).html();
			location.href = "student?ye=" + ye;
		});
		//$("[name=namePage]").removeClass("active");
		//$("[name=namePage]").eq(0).addClass("active");
	});
</script>
</head>

<body>
	<div id="box">
		<table class='table table-striped table-bordered table-hover'>
			<thead>
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
				</tr>
			</thead>
			<c:forEach items="${stus}" var="stu">
				<tr>
					<td>${stu.id}</td>
					<td>${stu.name}</td>
					<td>${stu.sex}</td>
					<td>${stu.age}</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="fenye">
			<li>上一页</li>
			<%
				int ye = (Integer) request.getAttribute("ye");
				int begin = 1;
				if(ye>=4){
					begin=ye-2;
				}
				int end = begin + 4;
				int maxYe = (Integer) request.getAttribute("maxYe");
				if (end >= maxYe) {
					end = maxYe;
					begin = end - 4;
				}
				for (int i = begin; i <= end; i++) {
			%>
			<li name="namePage" <%if (ye == i) { out.print("class='active'");}%> ><%=i %></li>
			<%
				}
			%>
			<li>下一页</li>
		</ul>
	</div>
</body>
</html>
