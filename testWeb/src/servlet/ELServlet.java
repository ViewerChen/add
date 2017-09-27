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
		stu.setName("ţţ");
		stu.setSex("Ů");
		stu.setAge(21);
		request.setAttribute("stu", stu);
		
		
		
//		ServletContext application=request.getServletContext();
//		application.setAttribute("name", "С��");
//		HttpSession session=request.getSession();
//		session.setAttribute("sex", "Ů");
//		request.setAttribute("age", 20);
//		request.setAttribute("name", "ţţ");
//		request.setAttribute("sex", "��");
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
