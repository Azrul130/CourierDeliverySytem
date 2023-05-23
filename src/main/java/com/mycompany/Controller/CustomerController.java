/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
Author : Muhammad Fauzul Azim Bin Imran Hayat
S62903
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.dao.AccountDAO;
import com.mycompany.courierdeliverysystem.model.Customer;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
public class CustomerController extends HttpServlet {

    private static String INSERT = "/Registration.jsp";
    private static String EDIT = "#";
    private static String List_Customer = "/CustomerManagement.jsp";
    private AccountDAO dao;
    
    public CustomerController () throws ClassNotFoundException {
        super();
        dao = new AccountDAO();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward ="";
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")) {
            String custId = request.getParameter("custId");
            dao.deleteCust(custId);
            forward = List_Customer;
            request.setAttribute("cust",dao.viewAllCust());
        }else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;
            String custId = request.getParameter("custId");
            Customer cust = dao.viewCust(custId);
            request.setAttribute("cust", cust);
        }else if (action.equalsIgnoreCase("listCust")) {
            forward = List_Customer;
            request.setAttribute("cust", dao.viewAllCust());
        }else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT;
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(forward);
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        Customer cust = new Customer();
        cust.setCustId(cust.generateCustId());
        cust.setName(request.getParameter("name"));
        cust.setUsername(request.getParameter("username"));
        cust.setPassword(request.getParameter("password"));
        cust.setPhone(request.getParameter("phone"));
        cust.setEmail(request.getParameter("email"));
        
        if (action.equalsIgnoreCase("edit")) {
            dao.updateCust(cust);
        }else {
            dao.addCust(cust);
            
        }
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("users", dao.viewAllCust() );
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
