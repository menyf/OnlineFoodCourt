package com.cugb.javaee.onlinefoodcourt.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.onlinefoodcourt.bean.Dish;

public class DishDAOMySqlImpl extends baseDAO implements IDishDAO {

	@Override
	public int addDish(Dish dish) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into Dish(name, price, description, imgurl, discount) values ( ?, ?, ?, ?, ?);";
		Object[] params = {dish.getName(), dish.getPrice(), dish.getDescription(), dish.getImgURL(), dish.getDiscount()};
		return modifyObj(sql, params);
	}

	@Override
	public int removeDish(int dishid) throws SQLException {
		String sql = "delete from Dish where dishid = ?";
		Object[] params = {dishid};
		return modifyObj(sql, params);
	}

	@Override
	public int modifyDish(Dish dish) throws SQLException {
		String sql = "update Dish set name = ?, price = ?, description = ?, imgurl = ?, discount = ? where dishid = ?";
		Object[] params = {dish.getName(),dish.getName(), dish.getDescription(), dish.getImgURL(), dish.getDiscount(), dish.getDishID()};
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findDishs() throws SQLException {
		String sql = "select dishid DishID, name Name, price Price, description Description, imgurl ImgURL, discount Discount from Dish";
		return findObjs(sql, Dish.class);
	}

	@Override
	public Dish findDish(int dishid) throws SQLException {
		String sql = "select dishid DishID, name Name, price Price, description Description, imgurl ImgURL, discount Discount from Dish where dishid = ?";
		Object[] params = {dishid};
		return (Dish) findObj(sql, params,  Dish.class);
	}

}
