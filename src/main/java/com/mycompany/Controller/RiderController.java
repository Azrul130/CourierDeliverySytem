/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.dao.AccountDAO;
import com.mycompany.courierdeliverysystem.dao.VehicleRiderDAO;
import com.mycompany.courierdeliverysystem.model.Rider;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
 */
@WebServlet("/rider/")
public class RiderController extends HttpServlet {

    private static String INSERT = "/Registration.jsp";
    private static String EDIT = "/vehicleEdit.jsp";
    private static String List_Rider = "/RiderManagement.jsp";
    private VehicleRiderDAO dao;
    private AccountDAO dao2;

    @Override
    public void init() {
        dao = new VehicleRiderDAO();
        dao2 = new AccountDAO();
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
                case "addform":
                    addform(request,response);
                    break;
                case "list":
                    listRider(request, response);
                    break;
                case "add":
                    addRider(request, response);
                    break;
                case "delete":
                    deleteRider(request, response);
                    break;
                case "edit":
                    editRider(request, response);
                    break;
                case "update":
                    updateRider(request, response);
                    break;
                default:
                    listRider(request, response);
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

    public void listRider(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException{
        HttpSession session = request.getSession();
        List<Rider> r = dao.ViewAllRider();
        session.setAttribute("listRider", r);
        RequestDispatcher rd = request.getRequestDispatcher(List_Rider);
        rd.forward(request, response);
    }
    public void addRider(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException{
        Rider r = new Rider();
        r.setEmployeeId(request.getParameter("employeeId"));
        r.setVehicleID(request.getParameter("vehicleId"));
        r.setLicenceExp(request.getParameter("licenceExp"));
        dao.AddRider(r);
        RequestDispatcher rd = request.getRequestDispatcher("list");
        rd.forward(request, response);
    }
    public void deleteRider(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException{
        int id = Integer.parseInt(request.getParameter("riderId"));
        dao.DeleteRider(id);
        response.sendRedirect("http://localhost:8080/courierdeliverysystem/rider/list");
    }
    public void editRider(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException{
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("riderId"));
        session.setAttribute("employeeList", dao2.viewAllEmp());
        session.setAttribute("vehicleList", dao.ViewAllVehicle());
        request.setAttribute("rider", dao.ViewRiderById(id));
        RequestDispatcher rd = request.getRequestDispatcher("/RiderEdit.jsp");
        rd.forward(request, response);
    }
    public void updateRider(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException{
        Rider r = new Rider();
        r.setRiderId(Integer.parseInt(request.getParameter("id")));
        r.setEmployeeId(request.getParameter("employeeId"));
        r.setVehicleID(request.getParameter("vehicleId"));
        r.setLicenceExp(request.getParameter("licenceExp"));
        
        dao.UpdateRider(r);
        RequestDispatcher rd = request.getRequestDispatcher("list");
        rd.forward(request, response);
    }
    public void addform(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException ,SQLException{
        HttpSession session = request.getSession();
        session.setAttribute("employeeList", dao2.viewAllEmp());
        session.setAttribute("vehicleList", dao.ViewAllVehicle());
        RequestDispatcher rd = request.getRequestDispatcher("/RiderForm.jsp");
        rd.forward(request, response);
    }
    
}
