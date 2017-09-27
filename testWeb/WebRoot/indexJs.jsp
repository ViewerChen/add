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

<title>My JSP 'indexJs.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
table {
	width: 600px;
	margin: 30px auto;
	border: 1px solid #666;
	border-collapse: collapse;
	border: 1px solid #666;
}

td {
	border: 1px solid #666;
}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script>
	$(document).ready(function() {
		$("tbody tr:odd").css("background", "white");
		$("tbody tr:even").css("background", "#F1F1F1");
		var old;
		$("tbody tr").hover(function() {
			old = $(this).css("background");
			$(this).css("background", "#F1F1F1");
		}, function() {
			$(this).css("background", old);
		})
	})
</script>
</head>

<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/school", "root", "123456");
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery("select * from student");
		out.println("<table class='table'>");
		out.println("<thead>");
		out.println("<tr>");
		out.println("<td>");
		out.println("ID");
		out.println("</td>");
		out.println("<td>");
		out.println("姓名");
		out.println("</td>");
		out.println("<td>");
		out.println("性别");
		out.println("</td>");
		out.println("<td>");
		out.println("年龄");
		out.println("</td>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getInt("id"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("sex"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getInt("age"));
			out.println("</td>");
			out.println("</tr>");
		}
	%>
	<%
		out.println("</tbody>");
		out.println("</table>");
		conn.close();
	%>
</body>
</html>
