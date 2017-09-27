package listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import entity.User;

public class CountListener implements ServletContextListener,
		HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext application = se.getSession().getServletContext();
		int num = 0;
		if (application.getAttribute("num") != null) {
			num = (Integer) application.getAttribute("num");
		}
		num++;

		application.setAttribute("num", num);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		int num = (Integer) sce.getServletContext().getAttribute("num");
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/school", "root", "123456");
			Statement stat = conn.createStatement();
			int rs = stat.executeUpdate("update count set num= " + num
					+ " where id = 1");
//			if (rs > 0) {
//				System.out.println("保存成功");
//			} else {
//				System.out.println("保存失败");
//			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		int num = 0;
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/school", "root", "123456");
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select num from count where id = 1");
			while (rs.next()) {
				num=rs.getInt("num");
			}
			sce.getServletContext().setAttribute("num", num);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
