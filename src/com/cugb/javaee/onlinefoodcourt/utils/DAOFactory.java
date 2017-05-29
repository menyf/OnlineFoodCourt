package com.cugb.javaee.onlinefoodcourt.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import sun.rmi.runtime.Log;
import sun.util.logging.resources.logging;


public class DAOFactory {
	private static Properties prop = null;
	
	private DAOFactory() {
		// TODO Auto-generated constructor stub
	}
	
	static{
		InputStream in = DAOFactory.class.getClassLoader().getResourceAsStream("dao.properties");
		prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static Object newInstance(String interfaceClassName) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		String classname = prop.getProperty(interfaceClassName);
		return Class.forName(classname).newInstance();
	}
}
