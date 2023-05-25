/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 * Author : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 * s62903
 */
package com.mycompany.courierdeliverysystem.model;

import java.sql.*;
import java.util.Random;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class Customer {

    private String custId;
    private String username;
    private String name;
    private String password;
    private String email;
    private String phone;
    private String Account_Type;

    public Customer(String un, String name, String pass, String email, String phone, String type) {
        super();
        this.custId = generateCustId();
        this.username = un;
        this.Account_Type = type;
        this.email = email;
        this.name = name;
        this.password = pass;
        this.phone = phone;

    }

    public Customer(String id, String un, String name, String pass, String email, String phone, String type) {
        super();
    }

    public Customer() {
    }

    ;

    /**
     * @return the custId
     */
    public String getCustId() {
        return custId;
    }

    /**
     * @param custId the custId to set
     */
    public void setCustId(String custId) {
        this.custId = custId;
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
     * @return the Account_Type
     */
    public String getAccount_Type() {
        return Account_Type;
    }

    /**
     * @param Account_Type the Account_Type to set
     */
    public void setAccount_Type(String Account_Type) {
        this.Account_Type = Account_Type;
    }

    // Auto-generate CustId with prefix "C" and check uniqueness
    public String generateCustId() {
        String prefix = "C";
        String generatedId = prefix + generateRandomString(5); // Generate a random 5-character string
        String url = "jdbc:mysql://localhost:3306/courierdeliverysystem";
        String username = "root";
        String password = "admin";

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            String query = "SELECT COUNT(*) FROM Customer WHERE CustId = ?";
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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    // Generate a random alphanumeric string of specified length
    public String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb.toString();
    }

}
