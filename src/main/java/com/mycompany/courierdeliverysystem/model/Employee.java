/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Random;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class Employee {
    private String EmployeeId;
    private String username;
    private String name;
    private String password;
    private String email;
    private String phone;
    private String Occupation;
    private String Account_type;

    
    public Employee(String un, String name, String pass, String email, String phone,String type ,String occ) {
        super();
        this.username = un;
        this.Occupation = occ;
        this.email = email;
        this.name = name;
        this.password = pass;
        this.phone = phone;
        this.EmployeeId = generateEmpId();
    }
    
    
    public Employee(String id, String un, String name, String pass, String email, String phone,String type, String occ) {
        super();
    }
    public Employee(){}
    /**
     * @return the EmployeeId
     */
    
    
    public String getEmployeeId() {
        return EmployeeId;
    }

    /**
     * @param EmployeeId the EmployeeId to set
     */
    public void setEmployeeId(String EmployeeId) {
        this.EmployeeId = EmployeeId;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }


    /**
     * @return the Occupation
     */
    public String getOccupation() {
        return Occupation;
    }

    /**
     * @param Occupation the Occupation to set
     */
    public void setOccupation(String Occupation) {
        this.Occupation = Occupation;
    }
    
    // Auto-generate CustId with prefix "C" and check uniqueness
public String generateEmpId() {
    String prefix = "E";
    String generatedId = prefix + generateRandomString(5); // Generate a random 5-character string
    String url = "jdbc:mysql://localhost/courierdeliverysystem";
    String username = "root";
    String password = "admin";

    try  {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);
        String query = "SELECT COUNT(*) FROM employee WHERE EmployeeId = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, generatedId);
        ResultSet resultSet = statement.executeQuery();
        resultSet.next();
        int count = resultSet.getInt(1);
        while (count > 0) {
            generatedId = prefix + generateRandomString(5); // Regenerate if the id already exists
            statement.setString(1, generatedId);
            resultSet = statement.executeQuery();
            resultSet.next();
            count = resultSet.getInt(1);
        }
    } catch (SQLIntegrityConstraintViolationException e) {
        // Duplicate entry exception occurred, handle it by regenerating the generatedId
        generatedId = generateEmpId(); // Recursive call to regenerate the CustId
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    return generatedId;
}


    // Generate a random alphanumeric string of specified length
    public String generateRandomString(int length) {
        String characters = "0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb.toString();
    }

    /**
     * @return the Account_type
     */
    public String getAccount_type() {
        return Account_type;
    }

    /**
     * @param Account_type the Account_type to set
     */
    public void setAccount_type(String Account_type) {
        this.Account_type = Account_type;
    }

}
