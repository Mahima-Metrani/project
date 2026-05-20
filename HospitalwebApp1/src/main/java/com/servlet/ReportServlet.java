package com.servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {  

        String type = req.getParameter("type");

        HospitalDAO dao = new HospitalDAO();
        List<Patient> list = new ArrayList<>();

        // 🔍 Debug (optional - remove later)
        System.out.println("TYPE = " + type);

        if ("doctor".equals(type)) {

            String value = req.getParameter("value");
            System.out.println("Doctor = " + value);

            list = dao.getByDoctor(value);

        } else if ("ailment".equals(type)) {

            String value = req.getParameter("value");
            System.out.println("Ailment = " + value);

            list = dao.getByAilment(value);

        } else if ("date".equals(type)) {

            String from = req.getParameter("from");
            String to = req.getParameter("to");

            System.out.println("FROM = " + from);
            System.out.println("TO = " + to);

            // 🚨 Safety check
            if (from != null && to != null && !from.isEmpty() && !to.isEmpty()) {
                list = dao.getByDateRange(from, to);
            }
        }

        // Send result to JSP
        req.setAttribute("data", list);

        RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
        rd.forward(req, res);
    }
}