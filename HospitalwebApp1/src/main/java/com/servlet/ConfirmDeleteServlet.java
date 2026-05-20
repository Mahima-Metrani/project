package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.HospitalDAO;

public class ConfirmDeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        HospitalDAO dao = new HospitalDAO();
        dao.deletePatient(id);

        res.sendRedirect("patientdisplay.jsp");
    }
}