package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Student;

public class ELServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){	
		
		Student stu=new Student();
		stu.setName("牛牛");
		stu.setSex("女");
		stu.setAge(21);
		request.setAttribute("stu", stu);
		
		
		
//		ServletContext application=request.getServletContext();
//		application.setAttribute("name", "小明");
//		HttpSession session=request.getSession();
//		session.setAttribute("sex", "女");
//		request.setAttribute("age", 20);
//		request.setAttribute("name", "牛牛");
//		request.setAttribute("sex", "男");
		try {
			request.getRequestDispatcher("WEB-INF/testEL.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response){
		doGet(request, response);
	}
}
