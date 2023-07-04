/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import com.itextpdf.
import jakarta.servlet.annotation.WebServlet;
import java.io.OutputStream;
/**
 *
 * @author Azrul Hafizam
 */

@WebServlet("/pdfGenerator")
public class PDFGeneratorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        try (OutputStream outputStream = response.getOutputStream()) {
            // Read the JSP-generated HTML content
            String jspContent = getJSPContent(request); // Implement this method to get the JSP-generated content
            
            // Convert HTML content to PDF and write it to the output stream
 //           HtmlConverter.convertToPdf(jspContent, outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Implement this method to read the JSP-generated content
    private String getJSPContent(HttpServletRequest request) {
        String data = request.getParameter("data");
        return "<html><body><h1>" + data + "</h1></body></html>";
    }
}





