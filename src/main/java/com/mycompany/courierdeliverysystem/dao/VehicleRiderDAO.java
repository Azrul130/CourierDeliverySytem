/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.dao;

import com.mycompany.courierdeliverysystem.model.Rider;
import com.mycompany.courierdeliverysystem.model.Vehicle;
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
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class VehicleRiderDAO {

    //Database Connection Info
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/courierdeliverysystem";
    private static final String user = "root";
    private static final String pass = "admin";

    //SQL Query
    //vehicle
    private static final String AddVehicle = "INSERT INTO vehicle ( VehicleID, vehicleType, RoadTaxExp, Picture) VALUES (?,?,?,?)";
    private static final String DeleteVehicle = "DELETE FROM vehicle WHERE VehicleID=?";
    private static final String UpdateVehicle = "UPDATE vehicle SET vehicleType=?, RoadTaxExp=?, Picture=? WHERE VehicleID=?";
    private static final String ViewVehicleByID = "SELECT * FROM vehicle WHERE VehicleID=?";
    private static final String ViewAllVehicle = "SELECT * FROM vehicle";
    //Rider
    private static final String AddRider = "INSERT INTO rider ( EmployeeId, VehicleID, LicenceExp ) VALUES (?,?,?)";
    private static final String DeleteRider = "DELETE FROM rider WHERE RiderId=?";
    private static final String UpdateRider = "UPDATE rider SET EmployeeId=?, VehicleID=?, LicenceExp=? WHERE RiderId=?";
    private static final String ViewAllRider = "SELECT * FROM rider";
    private static final String ViewRiderById = "SELECT * FROM rider WHERE RiderId=?";

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

    //Add Vehicle
    public void AddVehicle(Vehicle v) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(AddVehicle)) {
            ps.setString(1, v.generateVehId());
            ps.setString(2, v.getVehicleType());
            ps.setString(3, v.getRoadTaxExp());
            ps.setBytes(4, v.getPicture());
            if (ps.executeUpdate() > 0) {
                System.out.println("Vehicle addition Success!");
            } else {
                System.out.println("Unsuccessful Vehicle Addition!");
            }
        }
    }

    //Delete Vehicle
    public void DeleteVehicle(String id) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(DeleteVehicle)) {
            ps.setString(1, id);
            ps.executeUpdate();
        }
    }

    //Update Vehicle
    public void UpdateVehicle(Vehicle v) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(UpdateVehicle)) {
            ps.setString(1, v.getVehicleType());
            ps.setString(2, v.getRoadTaxExp());
            ps.setBytes(3, v.getPicture());
            ps.setString(4, v.getVehicleId());
            ps.executeUpdate();
        }
    }

    //View All Vehicle
    public List<Vehicle> ViewAllVehicle() throws SQLException {
        List<Vehicle> List = new ArrayList<>();

        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery(ViewAllVehicle);
            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setVehicleId(rs.getString("VehicleID"));
                v.setVehicleType(rs.getString("vehicleType"));
                v.setRoadTaxExp(rs.getString("RoadTaxExp"));
                v.setPicture(rs.getBytes("Picture"));
                List.add(v);
            }
        }

        return List;
    }

    //View Vehicle by Id
    public Vehicle ViewVehicleById(String id) throws SQLException {
        Vehicle v = new Vehicle();
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(ViewVehicleByID)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                v.setVehicleId(rs.getString("VehicleID"));
                v.setVehicleType(rs.getString("vehicleType"));
                v.setRoadTaxExp(rs.getString("RoadTaxExp"));
                v.setPicture(rs.getBytes("Picture"));
            }
        }
        return v;
    }

    //Add Rider
    public void AddRider(Rider r) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(AddRider)) {
            ps.setString(1, r.getEmployeeId());
            ps.setString(2, r.getVehicleID());
            ps.setString(3, r.getLicenceExp());
            ps.executeUpdate();
        }
    }

    //Delete Rider
    public void DeleteRider(int id) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(DeleteRider)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    //Update Rider
    public void UpdateRider(Rider r) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(UpdateRider)) {
            ps.setString(1, r.getEmployeeId());
            ps.setString(2, r.getVehicleID());
            ps.setString(3, r.getLicenceExp());
            ps.setInt(4, r.getRiderId());
            ps.executeUpdate();
        }
    }

    //view All Rider
    public List<Rider> ViewAllRider() throws SQLException {
        List<Rider> list = new ArrayList<>();

        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery(ViewAllRider);
            while (rs.next()) {
                Rider r = new Rider();
                r.setRiderId(rs.getInt("RiderId"));
                r.setEmployeeId(rs.getString("EmployeeId"));
                r.setVehicleID(rs.getString("VehicleID"));
                r.setLicenceExp(rs.getString("LicenceExp"));
                list.add(r);
            }
        }

        return list;
    }

    //View ALl Rider By Id
    public Rider ViewRiderById(int id) throws SQLException {
        Rider r = new Rider();
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(ViewRiderById)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                r.setRiderId(rs.getInt("RiderId"));
                r.setEmployeeId(rs.getString("EmployeeId"));
                r.setVehicleID(rs.getString("VehicleID"));
                r.setLicenceExp(rs.getString("LicenceExp"));
            }
        }
        return r;
    }
}
