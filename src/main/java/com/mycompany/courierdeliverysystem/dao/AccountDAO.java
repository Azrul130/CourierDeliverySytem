/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.dao;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class AccountDAO {
    private static final String jdbcURL= "jdbc:mysql://localhost:3306/courierdeliverysystem";
    private static final String user = "root";
    private static final String pass = "admin";
    
    private static final String Add_New_Customer = "INSERT INTO customer (CustId,CustName,Password,CustPhoneNo,email) values (?,?,?,?,?);";
    private static final String Add_New_Employee = "INSERT INTO employe (EmployeeId,username,password,Name,phoneNo,email,Occupation) values (?,?,?,?,?,?,?)";
    private static final String View_All_Customer = "SELECT * FROM customer";
    private static final String View_Customer_By_Id = "SELECT * FROM customer WHERE CustId = ?";
    private static final String Edit_Customer = "UPDATE customer SET CustName=?, Password=?, CustPhoneNo=?, email=? WHERE CustId=?";
    private static final String Delete_Customer = "DELETE FROM customer WHERE CustId=?";
            
}
