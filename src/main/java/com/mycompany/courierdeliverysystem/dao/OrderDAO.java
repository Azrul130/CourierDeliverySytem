
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
    private static final String Add_New_Order = "INSERT INTO `courierdeliverysystem`.`order` (`ParcelId`, `CustId`, `recipientName`, `recipientAddress`, `weight`, `description`, `parcelType`) VALUES (?,?,?,?,?,?,?)";
    private static final String View_All_Order = "SELECT * FROM courierdeliverysystem.order;";
    private static final String View_Order_By_Id = "SELECT * FROM order WHERE orderId = ?";
    private static final String Edit_Order = "UPDATE order SET recipientname=?, recipientaddress=?, description=?, weight=?, parceltype=? WHERE orderId=?";
    private static final String Delete_Order = "DELETE FROM courierdeliverysystem.order WHERE ParcelId=?";

    public OrderDAO() {

    }

    //Connection method
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    //Add new order
    public void addOrder(Order order) {
        System.out.println(Add_New_Order);
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(Add_New_Order)) {
            ps.setString(1, order.getParcelId());
            ps.setString(2, order.getCustId());
            ps.setString(3, order.getRecipientName());
            ps.setString(4, order.getRecipientAddress());
            ps.setDouble(5, order.getWeight());
            ps.setString(6, order.getDescription());
            ps.setString(7, order.getParcelType());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //View all order
    public List<Order> viewAllOrder() {
        List<Order> order = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(View_All_Order)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String ParcelId = rs.getString("ParcelId");
                String CustId = rs.getString("CustId");
                String recipientName = rs.getString("recipientName");
                String recipientAddress = rs.getString("recipientAddress");
                double weight = rs.getDouble("weight");
                String description = rs.getString("description");
                String parcelType = rs.getString("parcelType");
                order.add(new Order(ParcelId, CustId, recipientName, recipientAddress, weight, description, parcelType));
            }
        } catch (SQLException e) {
        }
        return order;
    }

    //View order By Id
    public Order viewOrder(String CustId) {
        Order order = new Order();
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(View_Order_By_Id)) {
            ps.setString(1, CustId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String ParcelId = rs.getString("ParcelId");
                String recipientname = rs.getString("recipientName");
                String recipientaddr = rs.getString("recipientAddress");
                double weight = rs.getDouble("weight");
                String desc = rs.getString("description");
                String parceltype = rs.getString("parcelType");
                order = new Order(CustId, ParcelId, recipientname, recipientaddr, weight, desc, parceltype);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    //update order
    public boolean updateOrder(Order order) {
        boolean rowUpdate = false;
        try (
                Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(Edit_Order)) {
            ps.setString(1, order.getRecipientName());
            ps.setString(2, order.getRecipientAddress());
            ps.setDouble(3, order.getWeight());
            ps.setString(4, order.getDescription());
            ps.setString(5, order.getParcelType());
            ps.setString(6, order.getParcelId());
            rowUpdate = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    //Delete order
    public boolean deleteOrder(String ParcelId) throws SQLException {
        boolean rowDeleted = false;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(Delete_Order)) {
            ps.setString(1, ParcelId);
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
