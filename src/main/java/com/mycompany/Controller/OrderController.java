/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.dao.OrderDAO;
import com.mycompany.courierdeliverysystem.model.Order;
import com.mycompany.courierdeliverysystem.function.CustIdGenerate;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author Azrul Hafizam
 */
@WebServlet("/")
public class OrderController extends HttpServlet {

    private OrderDAO dao;

    public void init() {
        dao = new OrderDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {

                //        case "/neworder":
                //            showNewForm(request, response);
                //            break;
                case "/addtorder":
                    AddOrder(request, response);
                    break;
                case "/deleteorder":
                    deleteOrder(request, response);
                    break;
                /*   case "/editorder":
                    showEditForm(request, response);
                    break;
                case "/updateorder":
                    updateCustomer(request, response);
                    break;
                case "/listorder":
                    listCustomer(request, response);
                    break;
                 */
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void AddOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String orderId = CustIdGenerate.generateOrderId(5);
        String custId = request.getParameter("custId");
        String recipientName = request.getParameter("recipientName");
        String recipientAddress = request.getParameter("recipientAddress");
        String desc = request.getParameter("description");
        double weigth = Double.parseDouble(request.getParameter("weight"));
        String parcelType = request.getParameter("parcelType");
        response.sendRedirect("orderdetail");
    }

    protected void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String orderId = request.getParameter("OrderId");
        dao.deleteOrder(orderId);
        response.sendRedirect("");
    }

    protected void orderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String orderId = request.getParameter("orderId");
        Order order = dao.viewOrder(orderId);
        RequestDispatcher dp = request.getRequestDispatcher("");
        request.setAttribute("order", order);
        dp.forward(request, response);
    }
}
