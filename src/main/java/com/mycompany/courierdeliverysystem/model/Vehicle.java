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
public class Vehicle {

    private String VehicleId;
    private String vehicleType;
    private String RoadTaxExp;
    private byte[] picture;

    public Vehicle() {
    }

    public Vehicle(String VehicleId, String vehicleType, String RoadTaxExp) {
        this.VehicleId = VehicleId;
        this.vehicleType = vehicleType;
        this.RoadTaxExp = RoadTaxExp;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }
    
    public String getVehicleId() {
        return VehicleId;
    }

    public void setVehicleId(String VehicleId) {
        this.VehicleId = VehicleId;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getRoadTaxExp() {
        return RoadTaxExp;
    }

    public void setRoadTaxExp(String RoadTaxExp) {
        this.RoadTaxExp = RoadTaxExp;
    }

    // Auto-generate VEHId with prefix "CDS" and check uniqueness
    public String generateVehId() {
        String prefix = "CDS ";
        String generatedId = prefix + generateRandomString(5); // Generate a random 5-character string
        String url = "jdbc:mysql://localhost/courierdeliverysystem";
        String username = "root";
        String password = "admin";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            String query = "SELECT COUNT(*) FROM vehicle WHERE VehicleID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, generatedId);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            while (count > 0) {
                generatedId = prefix + generateRandomString(6); // Regenerate if the id already exists
                statement.setString(1, generatedId);
                resultSet = statement.executeQuery();
                resultSet.next();
                count = resultSet.getInt(1);
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            // Duplicate entry exception occurred, handle it by regenerating the generatedId
            generatedId = generateVehId(); // Recursive call to regenerate the VehId
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
}
