package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DisplayPatientsServlet")
public class DisplayPatientsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        // HTML START
        out.println("<html><head><title>Patient Records</title>");

        // CSS
        out.println("<style>");

        out.println("body { "
                + "font-family:Segoe UI; "
                + "margin:0; "
                + "background:#e6b8c2; "
                + "}");

        out.println(".header { "
                + "text-align:center; "
                + "padding:20px; "
                + "color:#5a0000; "
                + "}");

        out.println(".table-box { "
                + "width:95%; "
                + "margin:auto; "
                + "background:white; "
                + "padding:20px; "
                + "border-radius:15px; "
                + "box-shadow:0 0 10px gray; "
                + "}");

        out.println("table { "
                + "width:100%; "
                + "border-collapse:collapse; "
                + "}");

        out.println("th { "
                + "background:#800000; "
                + "color:white; "
                + "padding:12px; "
                + "}");

        out.println("td { "
                + "padding:10px; "
                + "text-align:center; "
                + "border-bottom:1px solid #ddd; "
                + "}");

        out.println("tr:nth-child(even){ "
                + "background:#f9f9f9; "
                + "}");

        out.println("tr:hover { "
                + "background:#f1d5db; "
                + "}");

        out.println(".back-btn { "
                + "display:block; "
                + "width:180px; "
                + "margin:20px auto; "
                + "padding:10px; "
                + "background:#800000; "
                + "color:white; "
                + "text-align:center; "
                + "text-decoration:none; "
                + "border-radius:5px; "
                + "}");

        out.println(".back-btn:hover { "
                + "background:#5a0000; "
                + "}");

        out.println("</style>");

        out.println("</head><body>");

        // HEADER
        out.println("<div class='header'>");
        out.println("<h2>🏥 Patient Records</h2>");
        out.println("</div>");

        // TABLE
        out.println("<div class='table-box'>");

        out.println("<table>");

        out.println("<tr>");

        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Gender</th>");
        out.println("<th>Admission Date</th>");
        out.println("<th>Weight</th>");
        out.println("<th>DOB</th>");
        out.println("<th>Ailment</th>");
        out.println("<th>Doctor</th>");

        out.println("</tr>");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hospitaldb",
                    "root",
                    "root123"
            );

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM Patients");

            boolean hasData = false;

            while (rs.next()) {

                hasData = true;

                out.println("<tr>");

                out.println("<td>" + rs.getInt("PatientID") + "</td>");

                out.println("<td>" + rs.getString("PatientName") + "</td>");

                out.println("<td>" + rs.getString("Gender") + "</td>");

                out.println("<td>" + rs.getDate("AdmissionDate") + "</td>");

                out.println("<td>" + rs.getDouble("Weight") + " kg</td>");

                out.println("<td>" + rs.getDate("DOB") + "</td>");

                out.println("<td>" + rs.getString("Ailment") + "</td>");

                out.println("<td>" + rs.getString("AssignedDoctor") + "</td>");

                out.println("</tr>");
            }

            if (!hasData) {

                out.println(
                        "<tr><td colspan='8' style='color:red;'>"
                                + "No Records Found"
                                + "</td></tr>"
                );
            }

            con.close();

        } catch (Exception e) {

            out.println(
                    "<tr><td colspan='8'>Error: "
                            + e.getMessage()
                            + "</td></tr>"
            );
        }

        out.println("</table>");

        out.println("</div>");

        // BACK BUTTON
        out.println("<a href='index.jsp' class='back-btn'>⬅ Back Home</a>");

        out.println("</body></html>");
    }
}