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

/**
 *
 * @author Azrul Hafizam
 */
public class OrderDAO {
     private static final String jdbcURL= "jdbc:mysql://localhost:3306/courierdeliverysystem";
    private static final String user = "root";
    private static final String pass = "admin";
    
    //SQL Query
    private static final String Add_New_Order = "INSERT INTO order (orderid, recipientname, recipientaddress, description, weight, parceltype) values (?,?,?,?,?,?)";
    private static final String View_All_Order = "SELECT * FROM order";
    private static final String View_Order_By_Id = "SELECT * FROM order WHERE orderid = ?";
    private static final String Edit_Order = "UPDATE order SET recipientname=?, recipientaddress=?, description=?, weight=?, parceltype=? WHERE orderid=?";
    private static final String Delete_Order = "DELETE FROM order WHERE orderid=?";

   
    //Connection method
    public static Connection getConnection() {
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
    public static int addOrder(Order order){
        int status = 0;
        try {
            Connection con = AccountDAO.getConnection();
            PreparedStatement ps = con.prepareStatement(Add_New_Order);
            ps.setString(1, order.getOrderid() );
            ps.setString(2, order.getRecipientName() );
            ps.setString(3,  order.getRecipientAddress());
            ps.setString(4,  order.getDescription());
            ps.setDouble(5, order.getWeight());
            ps.setString(6,  order.getParceltype());
            
            status = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    //View all order
    public static List<Order> viewAllOrder(){
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
    public static Order viewOrder(String orderid){
        Order order = new Order();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(View_Order_By_Id);
            ps.setString(1, orderid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                order.setOrderid(rs.getString(1));
                order.setRecipientName(rs.getString(2));
                order.setRecipientAddress(rs.getString(3));
                order.setWeight(rs.getDouble(4));
                order.setDescription(rs.getString(5));
                order.setParceltype(rs.getString(6));
                con.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return order;
    }
    //Edit order
    public static void updateOrder(Order order){
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(Edit_Order);
            ps.setString(1, order.getRecipientName());
            ps.setString(2, order.getRecipientAddress());
            ps.setDouble(3, order.getWeight());
            ps.setString(4, order.getDescription());
            ps.setString(5, order.getParceltype());
            ps.setString(6, order.getOrderid());
            ps.executeUpdate();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    //Delete order
    public static void deleteOrder(String orderid) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(Delete_Order);
            ps.setString(1, orderid);
            ps.executeUpdate();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    
    
}
