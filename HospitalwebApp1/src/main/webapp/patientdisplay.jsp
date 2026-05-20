<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.dao.HospitalDAO,com.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient List</title>

<style>
body {
    font-family: 'Segoe UI', Arial;
    margin: 0;
    background: linear-gradient(to right, #d8a7b1 , #f8f8f8);
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

/* Table header */
th {
    background: #800000;
    color: white;
    padding: 12px;
}

/* Table data */
td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

/* Row hover */
tr:hover {
    background: rgba(128, 0, 0, 0.1);
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
    <h2>📋 Patient Records</h2>
    <p>View all registered patients</p>
</div>

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
HospitalDAO dao = new HospitalDAO();
List<Patient> list = dao.getAllPatients();

if(list == null || list.isEmpty()){
%>

<tr>
<td colspan="8" style="color:red;">No Records Found</td>
</tr>

<%
} else {
for(Patient p : list){
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
}
%>

</table>
</div>

<a href="index.jsp">⬅ Back to Home</a>

</body>
</html>