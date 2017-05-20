package com.cugb.javaee.onlinefoodcourt.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.LinkedList;
import java.util.Properties;
import java.util.Vector;
import java.util.logging.Logger;

import javax.sql.DataSource;

public class MyDataSource implements DataSource {
	private LinkedList<Connection> connPool = new LinkedList();
	private static String url ;
	private static String username ;
	private static String password ;
	
	private Connection createConnection(){
		Properties prop = new Properties();
		InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("dbconfig.properties");
		try {
			prop.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url = prop.getProperty("url");
		username = prop.getProperty("username");
		password = prop.getProperty("password");
		try {
			Class.forName(prop.getProperty("drivername"));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection realConn = null;
		try {
			realConn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection myConn = new MyConnection(realConn, this.connPool);
		return myConn;
	}

	@Override
	public Connection getConnection(){
		if(this.connPool.size()>0){
			Connection conn = (Connection)this.connPool.removeFirst();
//			System.out.println(conn.toString());
			return  conn;
		}else{
			return createConnection();
		}
	}

	@Override
	public Connection getConnection(String arg0, String arg1)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PrintWriter getLogWriter() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getLoginTimeout() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void setLogWriter(PrintWriter arg0) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void setLoginTimeout(int arg0) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		// TODO Auto-generated method stub
		return null;
	}

}
