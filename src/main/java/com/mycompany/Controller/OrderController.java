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
import java.util.List;

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
                case "/addorder":
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
                    break;*/
                case "/listOrder":
                    listOrder(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void AddOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String ParcelId = request.getParameter("ParcelId");
        String custId = request.getParameter("CustId");
        String recipientName = request.getParameter("recipientName");
        String recipientAddress = request.getParameter("recipientAddress");
        String desc = request.getParameter("description");
        double weigth = Double.parseDouble(request.getParameter("weight"));
        String parcelType = request.getParameter("parcelType");
        Order order = new Order(ParcelId, custId, recipientName, recipientAddress, weigth, desc, parcelType);
        dao.addOrder(order);
        response.sendRedirect("payment.jsp");
    }

    protected void listOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String CustId = request.getParameter("CustId");
        List<Order> listOrder = dao.viewAllOrder(CustId);
        request.setAttribute("listOrder", listOrder);
        RequestDispatcher dp = request.getRequestDispatcher("viewOrder.jsp");
        dp.forward(request, response);
    }

    protected void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String ParcelId = request.getParameter("ParcelId");
        dao.deleteOrder(ParcelId);
        response.sendRedirect("");
    }

    protected void orderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String CustId = request.getParameter("CustId");
        Order order = dao.viewOrder(CustId);
        RequestDispatcher dp = request.getRequestDispatcher("");
        request.setAttribute("order", order);
        dp.forward(request, response);
    }
}
