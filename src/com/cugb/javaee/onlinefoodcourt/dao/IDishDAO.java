package com.cugb.javaee.onlinefoodcourt.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.cugb.javaee.onlinefoodcourt.bean.Dish;

/**
 * 菜品信息处理接口，主要功能包括：
 * 1.增加菜品信息。
 * 2.修改菜品信息。
 * 3.删除菜品信息。
 * 4.查询所有菜品信息。
 *
 */
public interface IDishDAO
{
    /**
     * 增加菜品信息。 
     * @param Dish 包含菜品信息的对象。
     * @return 增加的菜品的数量。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public int addDish(Dish Dish) throws SQLException;
    
    /**
     * 删除指定的菜品信息。
     * @param string 要删除的菜品的ID。
     * @return 已经删除的菜品的数量。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public int removeDish(String string) throws SQLException;
    
    /**
     * 修改指定的菜品信息，可以修改的信息包括：
     * 菜品id 菜品名 密码。
     * @param Dish 包含菜品信息的对象。
     * @return 被修改的菜品的数量。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public int modifyDish(Dish Dish) throws SQLException;
    
    /**
     * 查询所有的菜品信息。
     * @return 包含菜品信息的数据结构，如果没有返回NULL。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public ArrayList findDishs() throws SQLException;
    
    /**
     * 查询单一的菜品信息。
     * @param Dish 的id
     * @return 该菜品的所有信息
     * @throws SQLException 执行操作发生任何异常时。
     */
    public Dish findDish(String string) throws SQLException;
}

