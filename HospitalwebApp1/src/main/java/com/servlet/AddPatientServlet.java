package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

public class AddPatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String ailment = request.getParameter("ailment");

            if(ailment.equals("Other")){

                ailment = request.getParameter("otherDisease");
            }
            String doctor = request.getParameter("doctor");

            if(doctor.equals("Other")) {
                doctor = request.getParameter("otherDoctor");
            }
            double weight = Double.parseDouble(request.getParameter("weight"));

            String dob = request.getParameter("dob");

            // Admission date is automatic
            String admissionDate = java.time.LocalDate.now().toString();

            Patient p = new Patient(

                name,

                dob,

                gender,

                weight,

                admissionDate,

                ailment,

                doctor
            );
            HospitalDAO dao = new HospitalDAO();

            boolean result = dao.addPatient(p);

            if (result) {
                response.sendRedirect("patientadd.jsp");
            } else {
                response.sendRedirect("index.jsp?msg=fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?msg=error");
        }
    }
}