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
//	public void testAddDish() throws SQLException {
//		Dish dish = new Dish();
//		dish.setName("test");
//		dish.setPrice(25.50f);
//		dish.setDescription("miaoshu");
//		dish.setDiscount(1.00f);
//		dish.setImgURL("hahaha");
//		assertEquals(1, disDAO.addDish(dish));;
//	}

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
		System.out.println(arr.size());
		assertNotNull(arr);
	}

	@Test
	public void testFindMaxDish() throws SQLException {
		Dish dish = disDAO.findMaxDish();
		assertNotNull(null, dish);
	}
	
//	@Test
//	public void testFindDish() {
//		fail("Not yet implemented");
//	}

}
