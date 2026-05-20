<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Patient" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Result</title>

<style>
body {
    font-family: 'Segoe UI', Arial;
    margin: 0;
    background: linear-gradient(to right, #d8a7b1, #f8f8f8);
}

/* Header */
.header {
    margin: 20px auto;
    max-width: 900px;
    padding: 20px;
    text-align: center;

    background: rgba(255, 255, 255, 0.25);
    backdrop-filter: blur(10px);
    border-radius: 20px;

    color: #5a0000;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

/* Table container */
.table-box {
    max-width: 1000px;
    margin: 30px auto;
    padding: 20px;

    background: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);
    border-radius: 20px;

    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

/* Header cells */
th {
    background: #800000;
    color: white;
    padding: 12px;
}

/* Data cells */
td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

/* Hover effect */
tr:hover {
    background: rgba(128, 0, 0, 0.1);
}

/* No data message */
.no-data {
    text-align: center;
    color: red;
    font-size: 18px;
    margin-top: 30px;
}

/* Back link */
a {
    display: block;
    text-align: center;
    margin: 20px;
    text-decoration: none;
    color: #800000;
    font-weight: bold;
}
</style>

</head>

<body>

<div class="header">
    <h2>📊 Report Result</h2>
    <p>Filtered patient data</p>
</div>

<%
List<Patient> list = (List<Patient>) request.getAttribute("data");

if(list == null || list.isEmpty()) {
%>

<div class="no-data">No Records Found</div>

<%
} else {
%>

<div class="table-box">
<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>DOB</th>
<th>Gender</th>
<th>Weight</th>
<th>Admission Date</th>
<th>Ailment</th>
<th>Doctor</th>
</tr>

<%
for(Patient p : list) {
%>

<tr>
<td><%=p.getPatientID()%></td>
<td><%=p.getPatientName()%></td>
<td><%=p.getDob()%></td>
<td><%=p.getGender()%></td>
<td><%=p.getWeight()%></td>
<td><%=p.getAdmissionDate()%></td>
<td><%=p.getAilment()%></td>
<td><%=p.getAssignedDoctor()%></td>
</tr>



<%
}
%>

</table>
</div>

<%
}
%>

<a href="reports.jsp">⬅ Back to Reports</a>

</body>
</html>