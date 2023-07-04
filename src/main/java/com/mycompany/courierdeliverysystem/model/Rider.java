/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.model;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class Rider {
    private int RiderId;
    private String EmployeeId;
    private String VehicleID;
    private String LicenceExp;

    public Rider() {
    }

    public Rider(int RiderId, String EmployeeId, String VehicleID, String LicenceExp) {
        this.RiderId = RiderId;
        this.EmployeeId = EmployeeId;
        this.VehicleID = VehicleID;
        this.LicenceExp = LicenceExp;
    }

    public int getRiderId() {
        return RiderId;
    }

    public void setRiderId(int RiderId) {
        this.RiderId = RiderId;
    }

    public String getEmployeeId() {
        return EmployeeId;
    }

    public void setEmployeeId(String EmployeeId) {
        this.EmployeeId = EmployeeId;
    }

    public String getVehicleID() {
        return VehicleID;
    }

    public void setVehicleID(String VehicleID) {
        this.VehicleID = VehicleID;
    }

    public String getLicenceExp() {
        return LicenceExp;
    }

    public void setLicenceExp(String LicenceExp) {
        this.LicenceExp = LicenceExp;
    }

    
    
}
