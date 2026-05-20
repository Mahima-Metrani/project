<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital Management System</title>

<style>
body {
    font-family: 'Segoe UI', Arial;
    margin: 0;
    background: linear-gradient(to right, #f8f8f8, #f8f8f8);
}
/* Header */
.header {
    margin: 20px auto;
    max-width: 900px;
    padding: 20px;

    background: rgba(255, 255, 255, 0.25);  /* glass effect */
    backdrop-filter: blur(10px);

    border-radius: 20px;
    text-align: center;
    color: #5a0000;   /* maroon text */

    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}
/* Container */
.container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 25px;
    padding: 40px;
    max-width: 900px;
    margin: 50px auto;

    background: rgba(255, 255, 255, 0.3);
    border-radius: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}
/* Cards */
.card {
    background: #ffffff;
    padding: 25px;
    border-radius: 40px;
    text-align: center;
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    transition: 0.3s;
}.card:hover {
    transform: translateY(-5px);
}

/* Buttons */
.card a {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 18px;

    background: linear-gradient(to right, #800000, #a00000);
    color: white;

    text-decoration: none;
    border-radius: 25px;

    font-weight: bold;
    transition: all 0.3s ease;
}

.card a:hover {
    background: linear-gradient(to right, #a00000, #800000);
    transform: scale(1.05);
}
/* Message */
.msg {
    text-align: center;
    margin-top: 15px;
    font-size: 16px;
}
</style>

</head>

<body>

<div class="header">
    <h1>🏥 Hospital Management System</h1>
    <p>Manage Patients, Records & Reports Efficiently</p>
</div>

<!-- MESSAGE DISPLAY -->
<%
String msg = request.getParameter("msg");

if ("success".equals(msg)) {
%>
    <div class="msg" style="color:green;">✔ Patient Added Successfully</div>
<%
} else if ("fail".equals(msg)) {
%>
    <div class="msg" style="color:red;">✖ Insert Failed</div>
<%
} else if ("error".equals(msg)) {
%>
    <div class="msg" style="color:red;">⚠ Something went wrong</div>
<%
}
%>

<div class="container">

    <div class="card">
        <h3>Add Patient</h3>
        <p>Register new patient details</p>
        <a href="patientadd.jsp">Open</a>
    </div>

    <div class="card">
        <h3>Update Patient</h3>
        <p>Modify existing patient data</p>
        <a href="patientupdate.jsp">Open</a>
    </div>

    <div class="card">
        <h3>Delete Patient</h3>
        <p>Remove patient records</p>
        <a href="patientdelete.jsp">Open</a>
    </div>

    <div class="card">
        <h3>View Patients</h3>
        <p>See all patient information</p>
        <a href="DisplayPatientsServlet">Open</a>
    </div>

    <div class="card">
        <h3>Reports</h3>
        <p>Generate reports by date, doctor, or disease</p>
        <a href="reports.jsp">Open</a>
    </div>

</div>

</body>
</html>