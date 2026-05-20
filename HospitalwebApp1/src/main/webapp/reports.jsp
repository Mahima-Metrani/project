<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>

<style>
body {
    font-family: 'Segoe UI', Arial;
    margin: 0;
    background: linear-gradient(to right, #d8a7b1, #f8f8f8);
}

/* Header */
.header {
    margin: 20px auto;
    max-width: 500px;
    padding: 20px;
    text-align: center;

    background: rgba(255, 255, 255, 0.25);
    backdrop-filter: blur(10px);
    border-radius: 20px;

    color: #5a0000;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

/* Container */
.container {
    max-width: 500px;
    margin: 30px auto;
    padding: 25px;

    background: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);

    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    text-align: center;
}

/* Buttons */
button {
    width: 90%;
    padding: 12px;
    margin: 10px;

    background: linear-gradient(to right, #800000, #a00000);
    color: white;

    border: none;
    border-radius: 25px;
    font-size: 15px;
    font-weight: bold;

    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: linear-gradient(to right, #a00000, #800000);
    transform: scale(1.05);
}

/* Back link */
a {
    display: block;
    text-align: center;
    margin-top: 20px;
    text-decoration: none;
    color: #800000;
    font-weight: bold;
}
</style>

</head>

<body>

<div class="header">
    <h2>📊 Reports</h2>
    <p>Select report type</p>
</div>

<div class="container">

<form action="ReportCriteriaServlet" method="post">
    <input type="hidden" name="type" value="date">
    <button type="submit">📅 Patients by Date</button>
</form>

<form action="ReportCriteriaServlet" method="post">
    <input type="hidden" name="type" value="ailment">
   
    <button type="submit">🩺 Patients by Ailment</button>
</form>

<form action="ReportCriteriaServlet" method="post">
    <input type="hidden" name="type" value="doctor">
    <button type="submit">👨‍⚕️ Patients by Doctor</button>
</form>

</div>

<a href="index.jsp">⬅ Back to Home</a>

</body>
</html>