package com.cugb.javaee.onlinefoodcourt.test;


import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

public abstract class BaseService extends HttpServlet {
	/**
	 * 日志工具
	 */
	protected Logger logger = Logger.getLogger(getClass());
}
