/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.dao.OrderDAO;
import com.mycompany.courierdeliverysystem.model.Order;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Azrul Hafizam
 */
public class OrderController extends HttpServlet {

    private static String INSERT = "/order.jsp";
    private static String EDIT = "/order.jsp";
    private static String List_Order = "/viewOrder.jsp";
    private OrderDAO dao;

    public OrderController() throws ClassNotFoundException {
        super();
        dao = new OrderDAO();
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
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            String orderid = request.getParameter("orderid");
            dao.deleteOrder(orderid);
            forward = List_Order;
            request.setAttribute("order", dao.viewAllOrder());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;
            String orderid = request.getParameter("orderid");
            Order order = dao.viewOrder(orderid);
            request.setAttribute("order", order);
        } else if (action.equalsIgnoreCase("listOrder")) {
            forward = List_Order;
            request.setAttribute("order", dao.viewAllOrder());
        } else if (action.equalsIgnoreCase("insert")) {
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

        Order order = new Order();
        order.setOrderid(request.getParameter("orderid"));
        order.setRecipientName(request.getParameter("recipientname"));
        order.setRecipientAddress(request.getParameter("recipientaddress"));
        order.setWeight(Double.parseDouble(request.getParameter("weight")));
        order.setDescription(request.getParameter("description"));
         order.setParceltype(request.getParameter("parceltype"));

        if (action.equalsIgnoreCase("edit")) {
            dao.updateOrder(order);
        } else {
            dao.addOrder(order);

        }
        RequestDispatcher rd = request.getRequestDispatcher("/viewOrder.jsp");
        request.setAttribute("order", dao.viewAllOrder());
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
