package com.cugb.javaee.onlinefoodcourt.test;

import com.cugb.javaee.onlinefoodcourt.test.Log4JTestServlet;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.onlinefoodcourt.bean.Dish;
import com.cugb.javaee.onlinefoodcourt.dao.IDishDAO;
import com.cugb.javaee.onlinefoodcourt.utils.DAOFactory;

public class DishDAOMySqlImplTest {

	IDishDAO disDAO = null;
	
	@Before
	public void setUp() throws Exception {
		disDAO = (IDishDAO) DAOFactory.newInstance("com.cugb.javaee.onlinefoodcourt.dao.IDishDAO");
	}

//	@Test
//	public void testAddDish() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testRemoveDish() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testModifyDish() {
//		fail("Not yet implemented");
//	}

	@Test
	public void testFindDishs() throws SQLException {
		ArrayList<Dish> arr = disDAO.findDishs();
		assertNotNull(arr);
	}

//	@Test
//	public void testFindDish() {
//		fail("Not yet implemented");
//	}

}
