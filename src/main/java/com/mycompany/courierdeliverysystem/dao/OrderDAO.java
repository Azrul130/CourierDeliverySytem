/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.dao;

import com.mycompany.courierdeliverysystem.model.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Azrul Hafizam
 */
public class OrderDAO {

    private static final String jdbcURL = "jdbc:mysql://localhost:3306/courierdeliverysystem";
    private static final String user = "root";
    private static final String pass = "admin";

    //SQL Query
    private static final String Add_New_Order = "INSERT INTO order(orderId, custId, recipientName, recipientAddress, description, weight, parcelType) values (?,?,?,?,?,?)";
    private static final String View_All_Order = "SELECT * FROM order where custId=?";//
    private static final String View_Order_By_Id = "SELECT * FROM order WHERE orderId = ?";
    private static final String Edit_Order = "UPDATE order SET recipientname=?, recipientaddress=?, description=?, weight=?, parceltype=? WHERE orderId=?";
    private static final String Delete_Order = "DELETE FROM order WHERE orderId=?";

       public OrderDAO() {

    }
    
    //Connection method
    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    //Add new order
    public void addOrder(Order order) {
        System.out.println(Add_New_Order);
        try (
                Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(Add_New_Order)) {
            ps.setString(1, order.getOrderId());
            ps.setString(2, order.getCustId());
            ps.setString(3, order.getRecipientName());
            ps.setString(4, order.getRecipientAddress());
            ps.setString(5, order.getDescription());
            ps.setDouble(6, order.getWeight());
            ps.setString(7, order.getParcelType());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
    //View all order
    public static List<Order> viewAllOrder() {
        List<Order> list = new ArrayList<>();
        try {
            Connection con = OrderDAO.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(View_All_Order);
            while (rs.next()) {
                Order order = new Order();
                order.setOrderid(rs.getString(1));
                order.setRecipientName(rs.getString(2));
                order.setRecipientAddress(rs.getString(3));
                order.setWeight(rs.getDouble(4));
                order.setDescription(rs.getString(5));
                order.setParceltype(rs.getString(6));

                list.add(order);
            }
            con.close();
        } catch (SQLException e) {
        }
        return list;
    }

    //View order By Id
    public static Order viewOrder(String orderid) {
        Order order = new Order();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(View_Order_By_Id);
            ps.setString(1, orderid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order.setOrderid(rs.getString(1));
                order.setRecipientName(rs.getString(2));
                order.setRecipientAddress(rs.getString(3));
                order.setWeight(rs.getDouble(4));
                order.setDescription(rs.getString(5));
                order.setParceltype(rs.getString(6));
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
 */
    //update order
    public boolean updateOrder(Order order) {
        boolean rowUpdate = false;
        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(Edit_Order)){
            ps.setString(1, order.getRecipientName());
            ps.setString(2, order.getRecipientAddress());
            ps.setDouble(3, order.getWeight());
            ps.setString(4, order.getDescription());
            ps.setString(5, order.getParcelType());
            ps.setString(6, order.getOrderId());
            rowUpdate = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }
    
    //Delete order
    public boolean deleteOrder(String orderId) throws SQLException {
        boolean rowDeleted = false;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(Delete_Order)) {
            ps.setString(1, orderId);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState  : " + ((SQLException) e).getSQLState());
                System.err.println("Error Coe : " + ((SQLException) e).getErrorCode());
                System.err.println("Message   : " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause : " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
