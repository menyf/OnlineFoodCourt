package com.cugb.javaee.onlinefoodcourt.utils;


import java.sql.*;
import java.util.Properties;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.cugb.javaee.onlinefoodcourt.test.*;
//import org.apache.tomcat.dbcp.dbcp2.BasicDataSourceFactory;

import java.io.*;

public class JDBCUtils {
	private static String drivername;
	private static String url;
	private static String username;
	private static String password;

	private JDBCUtils(){}
	
	/*  ===== JNDI开始 =====
	private static DataSource myds = null;
	static{
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			myds = (DataSource)envCtx.lookup("jndi/OnlineFoodCourt");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException{
		Connection conn = null;
		conn = myds.getConnection();
		return conn;
	}
	===== JNDI结束 ===== */
	
	
	// ===== JDCP开始 =====
	// 依赖MyConnection和MyDataSource
	private static MyDataSource myds = new MyDataSource();
	
	public static Connection getConnection(){
		Connection conn = null;
		conn = myds.getConnection(); 
		return conn;
	}
	// ===== JDCP结束 =====
	
	public static void free(ResultSet rs, PreparedStatement ps, Connection conn){
        
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
