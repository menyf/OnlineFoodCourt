package com.cugb.javaee.onlinefoodcourt.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.onlinefoodcourt.bean.Dish;

public class DishDAOMySqlImpl extends baseDAO implements IDishDAO {

	@Override
	public int addDish(Dish Dish) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeDish(String string) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDish(Dish Dish) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList findDishs() throws SQLException {
		String sql = "select dishid DishID, name Name, price Price, description Description, imgurl ImgURL, discount Discount from Dish";
		return findObjs(sql, Dish.class);
	}

	@Override
	public Dish findDish(String string) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
