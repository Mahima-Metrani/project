package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

public class DeletePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        int id = Integer.parseInt(req.getParameter("id"));

        try {

            HospitalDAO dao = new HospitalDAO();
            Patient p = dao.getPatientById(id);

            if (p == null) {
                out.println("<h2 style='color:red;text-align:center;'>Patient Not Found</h2>");
                return;
            }

            out.println("<html><body style='font-family:Segoe UI;text-align:center;background:#e6b8c2;'>");

            out.println("<h2>Confirm Delete</h2>");

            out.println("<div style='background:white;width:400px;margin:auto;padding:20px;border-radius:10px;'>");

            out.println("<p><b>ID:</b> " + p.getPatientID() + "</p>");
            out.println("<p><b>Name:</b> " + p.getPatientName() + "</p>");
            out.println("<p><b>Gender:</b> " + p.getGender() + "</p>");
            out.println("<p><b>Ailment:</b> " + p.getAilment() + "</p>");
            out.println("<p><b>Doctor:</b> " + p.getAssignedDoctor() + "</p>");

            out.println("<form action='ConfirmDeleteServlet' method='post'>");
            out.println("<input type='hidden' name='id' value='" + p.getPatientID() + "'>");
            out.println("<button style='background:red;color:white;padding:10px;border:none;border-radius:10px;'>DELETE</button>");
            out.println("</form>");

            out.println("<br><a href='patientdelete.jsp'>Cancel</a>");

            out.println("</div></body></html>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}