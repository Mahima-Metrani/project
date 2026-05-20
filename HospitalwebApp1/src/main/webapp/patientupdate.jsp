<%@ page import="com.dao.HospitalDAO,com.model.Patient" %>

<%
Patient p = null;

String id = request.getParameter("id");

if(id != null){

    HospitalDAO dao = new HospitalDAO();

    p = dao.getPatientById(
            Integer.parseInt(id));
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Update Patient</title>

<style>

body{
    font-family:'Segoe UI';
    background:linear-gradient(to right,#d8a7b1,#f8f8f8);
    margin:0;
}

.header{
    margin:20px auto;
    max-width:500px;
    padding:20px;
    text-align:center;
    background:rgba(255,255,255,0.3);
    border-radius:20px;
}

.form-box{
    width:400px;
    margin:20px auto;
    padding:25px;
    background:white;
    border-radius:20px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

input,select{
    width:90%;
    padding:10px;
    margin:10px;
    border-radius:20px;
    border:1px solid #ccc;
}

button{
    width:90%;
    padding:10px;
    border:none;
    border-radius:25px;
    background:maroon;
    color:white;
    font-weight:bold;
    cursor:pointer;
}

button:hover{
    background:#a00000;
}

</style>

</head>

<body>

<div class="header">

<h2>Update Patient</h2>

</div>

<div class="form-box">

<!-- SEARCH BY ID -->

<form method="get" action="patientupdate.jsp">

<input type="number"
       name="id"
       placeholder="Enter Patient ID"
       required>

<button type="submit">

Search Patient

</button>

</form>

<%
if(p != null){
%>

<hr>

<form action="UpdatePatientServlet"
      method="post">

<input type="hidden"
       name="id"
       value="<%=p.getPatientID()%>">
<label>Name:</label>

<input type="text"
       name="name"
       value="<%=p.getPatientName()%>"
       required>
<label>DOB:</label>

<input type="date"
       name="dob"
       value="<%=p.getDob()%>"
       required>
<label>Gender:</label>

<select name="gender" required>

<option value="Male"
<%=p.getGender().equals("Male")?"selected":""%>>

Male

</option>

<option value="Female"
<%=p.getGender().equals("Female")?"selected":""%>>

Female

</option>

<option value="Other"
<%=p.getGender().equals("Other")?"selected":""%>>

Other

</option>

</select>
<label>Weight:</label>

<input type="number"
       step="0.1"
        min="1"
       name="weight"
       value="<%=p.getWeight()%>"
       required>

<!-- AILMENT -->

<label>Ailment:</label>

<select name="ailment" required>

    <option value="Fever"
        <%= "Fever".equals(p.getAilment()) ? "selected" : "" %>>
        Fever
    </option>

    <option value="Cold & Cough"
        <%= "Cold & Cough".equals(p.getAilment()) ? "selected" : "" %>>
        Cold & Cough
    </option>

    <option value="Diabetes"
        <%= "Diabetes".equals(p.getAilment()) ? "selected" : "" %>>
        Diabetes
    </option>

    <option value="Hypertension"
        <%= "Hypertension".equals(p.getAilment()) ? "selected" : "" %>>
        Hypertension
    </option>

    <option value="Asthma"
        <%= "Asthma".equals(p.getAilment()) ? "selected" : "" %>>
        Asthma
    </option>

    <option value="Heart Disease"
        <%= "Heart Disease".equals(p.getAilment()) ? "selected" : "" %>>
        Heart Disease
    </option>

    <option value="Migraine"
        <%= "Migraine".equals(p.getAilment()) ? "selected" : "" %>>
        Migraine
    </option>

    <option value="Allergy"
        <%= "Allergy".equals(p.getAilment()) ? "selected" : "" %>>
        Allergy
    </option>

    <option value="Typhoid"
        <%= "Typhoid".equals(p.getAilment()) ? "selected" : "" %>>
        Typhoid
    </option>

    <option value="Dengue"
        <%= "Dengue".equals(p.getAilment()) ? "selected" : "" %>>
        Dengue
    </option>

    <option value="Malaria"
        <%= "Malaria".equals(p.getAilment()) ? "selected" : "" %>>
        Malaria
    </option>

    <option value="Fracture"
        <%= "Fracture".equals(p.getAilment()) ? "selected" : "" %>>
        Fracture
    </option>

    <option value="Skin Infection"
        <%= "Skin Infection".equals(p.getAilment()) ? "selected" : "" %>>
        Skin Infection
    </option>

    <option value="COVID-19"
        <%= "COVID-19".equals(p.getAilment()) ? "selected" : "" %>>
        COVID-19
    </option>

    <option value="Other"
        <%= "Other".equals(p.getAilment()) ? "selected" : "" %>>
        Other
    </option>

</select>

<br><br>

<input type="text"
       id="otherDisease"
       name="otherDisease"
       placeholder="Enter Disease Name"
       style="display:none;">
<!-- DOCTOR -->

<label>Assigned Doctor:</label>
<select name="doctor" required>

    <option value="Dr. Smith"
        <%= "Dr. Smith".equals(p.getAssignedDoctor()) ? "selected" : "" %>>
        Dr. Smith
    </option>

    <option value="Dr. John"
        <%= "Dr. John".equals(p.getAssignedDoctor()) ? "selected" : "" %>>
        Dr. John
    </option>

    <option value="Dr. Priya"
        <%= "Dr. Priya".equals(p.getAssignedDoctor()) ? "selected" : "" %>>
        Dr. Priya
    </option>

    <option value="Dr. Raj"
        <%= "Dr. Raj".equals(p.getAssignedDoctor()) ? "selected" : "" %>>
        Dr. Raj
    </option>

    <option value="Dr. Meena"
        <%= "Dr. Meena".equals(p.getAssignedDoctor()) ? "selected" : "" %>>
        Dr. Meena
    </option>

    <option value="Other"
        <%= (!"Dr. Smith".equals(p.getAssignedDoctor()) &&
             !"Dr. John".equals(p.getAssignedDoctor()) &&
             !"Dr. Priya".equals(p.getAssignedDoctor()) &&
             !"Dr. Raj".equals(p.getAssignedDoctor()) &&
             !"Dr. Meena".equals(p.getAssignedDoctor()))
             ? "selected" : "" %>>
        Other
    </option>

</select>

<br><br>

<input type="text"
       id="otherDoctor"
       name="otherDoctor"
       placeholder="Enter Doctor Name"
       style="display:none;">
<input type="hidden"
       name="date"
       value="<%=p.getAdmissionDate()%>">

<button type="submit">

Update Patient

</button>

</form>

<%
}
%>

</div>
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

function showOtherDoctor(){

    var doctor =
        document.getElementById("doctor").value;

    var otherBox =
        document.getElementById("otherDoctor");

    if(doctor === "Other"){

        otherBox.style.display = "block";
        otherBox.required = true;

    }else{

        otherBox.style.display = "none";
        otherBox.required = false;
    }
}

</script>

</body>
</html>