/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.courierdeliverysystem.model;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class Customer {
    private String id;
    private String name;
    private String phoneNo;
    private String Ic;

    public Customer(String id, String name , String phoneNo, String Ic){
        super();
        this.id = id;
        this.name = name;
        this.phoneNo = phoneNo;
        this.Ic = Ic;
    }
    public Customer(String name , String phoneNo, String Ic){
        super();
        this.name = name;
        this.phoneNo = phoneNo;
        this.Ic = Ic;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
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
     * @return the phoneNo
     */
    public String getPhoneNo() {
        return phoneNo;
    }

    /**
     * @param phoneNo the phoneNo to set
     */
    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    /**
     * @return the Ic
     */
    public String getIc() {
        return Ic;
    }

    /**
     * @param Ic the Ic to set
     */
    public void setIc(String Ic) {
        this.Ic = Ic;
    }
    
    
}
