package com.servlet;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

public class UpdatePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        try {

            // Doctor dropdown handling
            String doctor = req.getParameter("doctor");

            if(doctor.equals("Other")) {

                doctor = req.getParameter("otherDoctor");
            }

            // Disease dropdown handling
            String ailment = req.getParameter("ailment");

            if(ailment.equals("Other")) {

                ailment = req.getParameter("otherDisease");
            }

            Patient p = new Patient(

                Integer.parseInt(req.getParameter("id")),

                req.getParameter("name"),

                req.getParameter("dob"),

                req.getParameter("gender"),

                Double.parseDouble(req.getParameter("weight")),

                req.getParameter("date"),

                ailment,

                doctor
            );

            HospitalDAO dao = new HospitalDAO();

            if(dao.updatePatient(p)) {

                res.sendRedirect("patientdisplay.jsp");

            } else {

                res.getWriter().println("Update Failed!");

            }

        } catch (Exception e) {

            e.printStackTrace();

            res.getWriter().println("Error Occurred!");

        }
    }
}