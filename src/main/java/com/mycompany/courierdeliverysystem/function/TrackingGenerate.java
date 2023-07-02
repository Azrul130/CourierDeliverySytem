/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.function;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

/**
 *
 * @author Azrul Hafizam
 */
public class TrackingGenerate {

    private static final String PREFIX = "EM";
    private static final int NUM_CHARS = 6;
    private static final String CHARACTERS = "0123456789";
    private static final Random RANDOM = new Random();
    private static final String URL = "jdbc:mysql://localhost:3306/courierdeliverysystem";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "admin";

    private static String generateRandomTracking() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String ParcelId = null;

        try {
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            stmt = conn.prepareStatement("SELECT * FROM order WHERE ParcelId = ?");
            do {
                StringBuilder sb = new StringBuilder();
                sb.append(PREFIX);
                for (int i = 0; i < NUM_CHARS; i++) {
                    sb.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
                }
                ParcelId = sb.toString();
                stmt.setString(1, ParcelId);
                rs = stmt.executeQuery();
            } while (rs.next()); // Check if ID already exists in database
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return ParcelId;
    }
}
