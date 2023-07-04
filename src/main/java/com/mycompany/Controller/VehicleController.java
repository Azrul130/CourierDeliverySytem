/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.dao.VehicleRiderDAO;
import com.mycompany.courierdeliverysystem.model.Vehicle;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
@WebServlet("/vehicle/")
public class VehicleController extends HttpServlet {

    private static String INSERT = "/Registration.jsp";
    private static String EDIT = "/vehicleEdit.jsp";
    private static String List_Vehicle = "/VehicleManagement.jsp";
    private VehicleRiderDAO dao;

    @Override
    public void init() {
        dao = new VehicleRiderDAO();
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
        String pathInfo = request.getPathInfo(); // Get the path info from the request URL
        System.out.println(pathInfo);
        String actionPath = pathInfo.substring(1);

        try {
            switch (actionPath) {
                case "list":
                    listVehicle(request, response);
                    break;
                case "add":
                    addVehicle(request, response);
                    break;
                case "delete":
                    deleteVehicle(request, response);
                    break;
                case "edit":
                    editVehicle(request, response);
                    break;
                case "update":
                    updateVehicle(request, response);
                    break;
                default:
                    listVehicle(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
        doGet(request, response);
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

    public void listVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        List<Vehicle> vehicle = dao.ViewAllVehicle();
        session.setAttribute("listVeh", vehicle);
        RequestDispatcher rd = request.getRequestDispatcher(List_Vehicle);
        rd.forward(request, response);
    }

    public void addVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Vehicle v = new Vehicle();
        v.setVehicleType(request.getParameter("vehicleType"));
        v.setRoadTaxExp("RoadTaxExp");
        Part filePart = request.getPart("Picture");
        InputStream fileContent = filePart.getInputStream();
        byte[] fileData = fileContent.readAllBytes();
        v.setPicture(fileData);
        
        dao.AddVehicle(v);
        RequestDispatcher rd = request.getRequestDispatcher(List_Vehicle);
        rd.forward(request, response);
    }

    public void deleteVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("vehId");
        dao.DeleteVehicle(id);
        response.sendRedirect("http://localhost:8080/courierdeliverysystem/vehicle/list");
    }

    public void editVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("vehId");
        Vehicle v = dao.ViewVehicleById(id);
        request.setAttribute("existingVeh", v);
        RequestDispatcher rd = request.getRequestDispatcher(EDIT);
        rd.forward(request, response);
    }

    public void updateVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

    }

}
