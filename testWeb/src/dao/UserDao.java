package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import entity.User;

public class UserDao {
	public User searchByUserNameAndUserPassword(User searchUser){
		User user=null;
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/school", "root", "123456");
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select * from users where username= '"+searchUser.getName()+"' and password= '"+searchUser.getPassword()+"'");
			if (rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("username"));
				user.setPassword(rs.getString("password"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return user;
	}
}
