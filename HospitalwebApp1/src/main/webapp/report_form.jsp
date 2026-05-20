<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String type = request.getParameter("type");
%>

<!DOCTYPE html>
<html>
<head>
<title>Report Form</title>

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

/* Form Box */
.form-box {
    background: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);
    padding: 25px;
    width: 420px;
    margin: 30px auto;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    text-align: center;
}

/* Inputs */
input, select {
    width: 90%;
    padding: 10px;
    margin: 10px;
    border-radius: 20px;
    border: 1px solid #ccc;
    outline: none;
}

/* Labels */
label {
    font-weight: bold;
    color: #5a0000;
}

/* Button */
button {
    width: 90%;
    padding: 10px;
    margin-top: 15px;
    background: linear-gradient(to right, #800000, #a00000);
    color: white;
    border: none;
    border-radius: 25px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
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
    <h2>📊 Generate Report</h2>
    <p>Enter report criteria</p>
</div>

<div class="form-box">

<form action="ReportServlet" method="post">
<input type="hidden" name="type" value="<%=type%>">

<% if("date".equals(type)) { %>

<label>From Date</label>
<input type="date" name="from" required>

<label>To Date</label>
<input type="date" name="to" required>

<% } else if("ailment".equals(type)) { %>

<label>Ailment</label>
<select name="value" id="ailment" onchange="showOtherAilment()" required>

    <option value="">Select Ailment</option>
    <option>Fever</option>
    <option>Cold & Cough</option>
    <option>Diabetes</option>
    <option>Hypertension</option>
    <option>Asthma</option>
    <option>Heart Disease</option>
    <option>COVID-19</option>
    <option value="Other">Other</option>

</select>

<input type="text" id="otherAilment" name="otherAilment"
       placeholder="Enter Ailment" style="display:none;">

<% } else if("doctor".equals(type)) { %>

<label>Assigned Doctor</label>
<select name="value" id="doctor" onchange="showOtherDoctor()" required>

    <option value="">Select Doctor</option>
    <option>Dr. Smith</option>
    <option>Dr. John</option>
    <option>Dr. Priya</option>
    <option>Dr. Raj</option>
    <option>Dr. Meena</option>
    <option value="Other">Other</option>

</select>

<input type="text" id="otherDoctor" name="otherDoctor"
       placeholder="Enter Doctor Name" style="display:none;">

<% } %>

<button type="submit">Generate Report</button>

</form>

</div>

<a href="reports.jsp">⬅ Back</a>

<script>
function showOtherAilment(){
    var val = document.getElementById("ailment").value;
    var box = document.getElementById("otherAilment");

    if(val === "Other"){
        box.style.display = "block";
        box.required = true;
    } else {
        box.style.display = "none";
        box.required = false;
    }
}

function showOtherDoctor(){
    var val = document.getElementById("doctor").value;
    var box = document.getElementById("otherDoctor");

    if(val === "Other"){
        box.style.display = "block";
        box.required = true;
    } else {
        box.style.display = "none";
        box.required = false;
    }
}
</script>

</body>
</html>