<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.dao.HospitalDAO" %>

<%
HospitalDAO dao = new HospitalDAO();

int nextId = dao.getNextPatientId();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Add Patient</title>

<style>

body {

    font-family:'Segoe UI', Arial;
    margin:0;
    background:linear-gradient(to right,#f8f8f8, #f8f8f8);
}

/* HEADER */

.header {

    margin:20px auto;
    max-width:500px;
    padding:20px;
    text-align:center;

    background:rgba(255,255,255,0.25);

    backdrop-filter:blur(10px);

    border-radius:20px;

    color:#5a0000;

    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

/* FORM BOX */

.form-box {

    background:rgba(255,255,255,0.3);

    backdrop-filter:blur(10px);

    padding:25px;

    width:400px;

    margin:30px auto;

    border-radius:20px;

    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

/* INPUTS */

input, select {

    width:90%;

    padding:10px;

    margin:10px;

    border-radius:20px;

    border:1px solid #ccc;

    outline:none;
}

/* BUTTON */

input[type="submit"] {

    background:#800000;

    color:white;

    border:none;

    cursor:pointer;

    border-radius:25px;

    font-weight:bold;
}

input[type="submit"]:hover {

    background:#a00000;
}

/* LABELS */

label {

    margin-left:10px;

    font-weight:bold;

    color:#5a0000;
}

/* BACK LINK */

a {

    display:block;

    text-align:center;

    margin-top:20px;

    text-decoration:none;

    color:#800000;

    font-weight:bold;
}


</style>

</head>

<body>

<div class="header">

    <h2>➕ Add Patient</h2>

    <p>Enter patient details below</p>

</div>

<div class="form-box">

<form action="AddPatientServlet" method="post">

    <!-- AUTO ID -->

    <label>Patient ID:</label>

    <input type="text" value="<%=nextId%>" readonly>

    <!-- NAME -->

    <label>Patient Name:</label>

    <input type="text"
           name="name"
           placeholder="Patient Name"
           required>

    <!-- GENDER -->

    <label>Gender:</label>

    <select name="gender" required>

        <option value="">Select Gender</option>

        <option value="Male">Male</option>

        <option value="Female">Female</option>

        <option value="Other">Other</option>

    </select>

    <!-- WEIGHT -->

    <label>Weight (kg):</label>

    <input type="number"
       step="0.1"
       min="1"
       name="weight"
       placeholder="Weight"
       required>

    <!-- DOB -->

    <label>Date of Birth:</label>

    <input type="date"
           name="dob"
           required>

    <!-- AILMENT -->

   <label>Ailment:</label>

<select name="ailment"
        id="ailment"
        onchange="showOtherDisease()"
        required>

    <option value="">Select Ailment</option>

    <option value="Fever">Fever</option>

    <option value="Cold & Cough">Cold & Cough</option>

    <option value="Diabetes">Diabetes</option>

    <option value="Hypertension">Hypertension</option>

    <option value="Asthma">Asthma</option>

    <option value="Heart Disease">Heart Disease</option>

    <option value="Migraine">Migraine</option>

    <option value="Allergy">Allergy</option>

    <option value="Typhoid">Typhoid</option>

    <option value="Dengue">Dengue</option>

    <option value="Malaria">Malaria</option>

    <option value="Fracture">Fracture</option>

    <option value="Skin Infection">Skin Infection</option>

    <option value="COVID-19">COVID-19</option>

    <option value="Other">Other</option>

</select>

<!-- Hidden textbox -->

<input type="text"
       id="otherDisease"
       name="otherDisease"
       placeholder="Enter Disease Name"
       style="display:none;">
    <!-- DOCTOR -->

    <label>Assigned Doctor:</label>

   <select name="doctor" onchange="showOtherDoctor()" required>

    <option value="">Select Doctor</option>

    <option>Dr. Smith</option>
    <option>Dr. John</option>
    <option>Dr. Priya</option>
    <option>Dr. Raj</option>
    <option>Dr. Meena</option>

    <option value="Other">Other</option>

</select>

<input type="text"
       id="otherDoctor"
       name="otherDoctor"
       placeholder="Enter Doctor Name"
       style="display:none; margin-top:10px;">
    <!-- SUBMIT -->

    <input type="submit"
           value="Add Patient">

</form>

</div>

<a href="index.jsp">⬅ Back to Home</a>

<!-- JAVASCRIPT HERE -->

<script>

function showOtherDisease(){

    var ailment =
        document.getElementById("ailment").value;

    var otherBox =
        document.getElementById("otherDisease");

    if(ailment === "Other"){

        otherBox.style.display = "block";

        otherBox.required = true;

    }else{

        otherBox.style.display = "none";

        otherBox.required = false;
    }
}

</script>
<script>
function showOtherDoctor() {

    var doctor =
        document.getElementsByName("doctor")[0].value;

    var otherBox =
        document.getElementById("otherDoctor");

    if(doctor === "Other") {

        otherBox.style.display = "block";
        otherBox.required = true;

    } else {

        otherBox.style.display = "none";
        otherBox.required = false;
    }
}
</script>

</body>
</html>

</body>

</html>