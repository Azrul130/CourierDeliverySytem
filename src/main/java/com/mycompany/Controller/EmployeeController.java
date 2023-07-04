/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.Controller;

import com.mycompany.courierdeliverysystem.dao.AccountDAO;
import com.mycompany.courierdeliverysystem.model.Employee;
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
@WebServlet("/emp/")
public class EmployeeController extends HttpServlet {

    private static String INSERT = "/Registration.jsp";
    private static String EDIT = "/UpdateEmpInfo.jsp";
    private static String List_Employee = "/EmployeeManagement.jsp";
    private AccountDAO dao;

    @Override
    public void init() {
        dao = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String action = request.getServletPath();
        String pathInfo = request.getPathInfo(); // Get the path info from the request URL
        System.out.println(pathInfo);
        String actionPath = pathInfo.substring(1);

        /*System.out.println(actionPath);
        System.out.println("tes");
        System.out.println(request.getServletPath());*/
        try {
            switch (actionPath) {
                case "list":
                    employeeList(request, response);
                    break;
                case "edit":
                    editEmp(request, response);
                    break;
                case "update":
                    updateEmp(request,response);
                    break;
                case "add":
                    addEmp(request,response);
                    break;
                default:
                    employeeList(request, response);
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
    
    //list of Employee
    public void employeeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        List<Employee> employee = dao.viewAllEmp();
        session.setAttribute("listEmp", employee);
        RequestDispatcher rd = request.getRequestDispatcher(List_Employee);
        rd.forward(request, response);
    }
    //edit Form for Employee
    public void editEmp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String empId = request.getParameter("empId");
        Employee e = dao.viewEmpByID(empId);
        request.setAttribute("existingEmp", e);
        RequestDispatcher rd = request.getRequestDispatcher(EDIT);
        rd.forward(request, response);
    }
    //update Employee
    public void updateEmp(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException{
        
        Employee updateEmp = new Employee();
        
        String id = request.getParameter("empId");
        String name = request.getParameter("empName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String occ = request.getParameter("occupation");

        updateEmp.setEmployeeId(id);
        updateEmp.setName(name);
        updateEmp.setUsername(username);
        updateEmp.setPassword(password);
        updateEmp.setPhone(phone);
        updateEmp.setEmail(email);
        updateEmp.setOccupation(occ);
        
        dao.UpdateEmployee(updateEmp);
        response.sendRedirect("http://localhost:8080/courierdeliverysystem/emp/list");
    }
    //add new employee
    public void addEmp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
        
        Employee e = new Employee();
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String occ = request.getParameter("occupation");
        
        e.setName(name);
        e.setUsername(username);
        e.setPassword(password);
        e.setPhone(phone);
        e.setEmail(email);
        e.setOccupation(occ);
        
        boolean success = dao.addEmp(e) > 0;
        
        if (success == true){
            System.out.println("Registration Success!");
        }else{
            System.out.println("Registration Failed!");
        }
        
    }
    
}
