package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ReportCriteriaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String type = req.getParameter("type");

        // Forward based on type
        if ("date".equals(type)) {
            req.getRequestDispatcher("report_form.jsp?type=date").forward(req, res);
        } 
        else if ("ailment".equals(type)) {
            req.getRequestDispatcher("report_form.jsp?type=ailment").forward(req, res);
        } 
        else if ("doctor".equals(type)) {
            req.getRequestDispatcher("report_form.jsp?type=doctor").forward(req, res);
        }
    }
}