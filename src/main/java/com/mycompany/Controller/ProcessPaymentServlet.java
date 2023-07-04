/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.model.MyPaymentGateway;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Collect payment information from the request
        String cardholderName = request.getParameter("cardholderName");
        String cardNumber = request.getParameter("cardNumber");
        String expirationDate = request.getParameter("expirationDate");
        String cvv = request.getParameter("cvv");

        // Process the payment using MyPaymentGateway
        MyPaymentGateway paymentGateway = new MyPaymentGateway();
        boolean paymentSuccess = paymentGateway.processPayment(cardholderName, cardNumber, expirationDate, cvv);

        // Handle the payment result
        if (paymentSuccess) {
            response.sendRedirect("paymentSuccess.jsp");
        } else {
            response.sendRedirect("paymentFail.jsp");
        }
    }
}
