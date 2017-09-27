package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDao;
import entity.Student;

public class StudentServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response){	
		try {
			int nums=2;
			StudentDao StuDao = new StudentDao();
			int total=StuDao.searchCount();
			int maxYe=0;
			maxYe=total%nums==0?total/nums:total/nums+1;
			int ye=1;
			if(null!=request.getParameter("ye")){
				ye=Integer.parseInt(request.getParameter("ye"));
			}
			if(ye<1){
				ye=1;
			}
			int begin=2*(ye-1);			
			List<Student> list = StuDao.searchByBegin(begin, nums);
			request.setAttribute("stus", list);
			request.setAttribute("ye", ye);
			request.setAttribute("maxYe",maxYe);
			request.getRequestDispatcher("WEB-INF/student.jsp").forward(request, response);
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
