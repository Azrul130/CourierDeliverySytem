/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.dao;

import com.mycompany.courierdeliverysystem.model.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class AccountDAO {
    //Database Connection Info
    private static final String jdbcURL= "jdbc:mysql://localhost:3306/courierdeliverysystem";
    private static final String user = "root";
    private static final String pass = "admin";
    
    //SQL Query
    private static final String Add_New_Customer = "INSERT INTO customer (CustId, username, CustName, Password, CustPhoneNo, email) values (?,?,?,?,?);";
    private static final String Add_New_Employee = "INSERT INTO employe (EmployeeId, username, password, Name, phoneNo, email, Occupation) values (?,?,?,?,?,?,?)";
    private static final String View_All_Customer = "SELECT * FROM customer";
    private static final String View_Customer_By_Id = "SELECT * FROM customer WHERE CustId = ?";
    private static final String Edit_Customer = "UPDATE customer SET username=?, CustName=?, Password=?, CustPhoneNo=?, email=? WHERE CustId=?";
    private static final String Delete_Customer = "DELETE FROM customer WHERE CustId=?";
    private static final String View_All_Employee = "SELECT * FROM employee";
    private static final String View_Employee_By_Id = "SELECT * FROM employee WHERE EmployeeId = ?";
    private static final String Edit_Employee = "UPDATE employee SET username=?, password=?, Name=?, phoneNo=?, email=?, Occupation=? WHERE EmployeeId=?";
    private static final String Delete_Employee = "DELETE FROM employee WHERE EmployeeId=?";
   
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
    //Add new Customer
    public static int addCust(Customer cust){
        int status = 0;
        try {
            Connection con = AccountDAO.getConnection();
            PreparedStatement ps = con.prepareStatement(Add_New_Customer);
            ps.setString(1, cust.getCustId() );
            ps.setString(2, cust.getUsername() );
            ps.setString(3, cust.getName() );
            ps.setString(4, cust.getPassword() );
            ps.setString(5, cust.getPhone() );
            ps.setString(6, cust.getEmail() );
            
            status = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    //View all Customer
    public static List<Customer> viewAllCust(){
        List<Customer> list = new ArrayList<>();
        try {
            Connection con = AccountDAO.getConnection();
            PreparedStatement ps = con.prepareStatement(View_All_Customer);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustId(rs.getString(1));
                c.setUsername(rs.getString(2));
                c.setName(rs.getString(3));
                c.setPassword(rs.getString(4));
                c.setPhone(rs.getString(5));
                c.setEmail(rs.getString(6));
                
                list.add(c);
            }
            con.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
