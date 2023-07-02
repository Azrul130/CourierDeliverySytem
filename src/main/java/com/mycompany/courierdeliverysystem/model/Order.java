/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.model;
import Courier.com.trackingNumber;

/**
 *
 * @author Azrul Hafizam
 */

public class Order {
    private String orderid;
    private String custId;
    private String recipientName;
    private String recipientAddress;
    private double weight;
    private String Description;
    private String parceltype;

    public Order() {
    }

    public Order(String custId, String recipientName, String recipientAddress, double weight, String Description, String parceltype) {
        super();
        this.custId = custId;
        this.recipientName = recipientName;
        this.recipientAddress = recipientAddress;
        this.weight = weight;
        this.Description = Description;
        this.parceltype = parceltype;
    }

    public String getCustId() {
        return custId;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }    
    
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        orderid = trackingNumber.TrackingNumber() ;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getParceltype() {
        return parceltype;
    }

    public void setParceltype(String parceltype) {
        this.parceltype = parceltype;
    }
}
