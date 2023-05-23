/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Courier.com;
import Courier.com.trackingNumber;
import java.math.BigDecimal;

/**
 *
 * @author Azrul Hafizam
 */

public class Order {
    private String ParcelId;
    private String recipientName;
    private String recipientAddress;
    private BigDecimal weight;
    private String Description;

    public String getParcelId() {
        return ParcelId;
    }

    public void ParcelId() {
        ParcelId = trackingNumber.TrackingNumber() ;
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

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
    
    

}
