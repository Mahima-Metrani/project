<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Patient</title>

<style>
body {
    font-family: 'Segoe UI', Arial;
    margin: 0;
    background: linear-gradient(to right,rgb(128, 255, 128), #f8f8f8);
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
    width: 350px;
    margin: 30px auto;

    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    text-align: center;
}

/* Input */
input {
    width: 90%;
    padding: 10px;
    margin: 10px;
    border-radius: 20px;
    border: 1px solid #ccc;
    outline: none;
}

/* Delete Button */
button {
    width: 90%;
    padding: 10px;
    margin-top: 10px;

    background: linear-gradient(to right, #800000, #a00000);
    color: white;

    border: none;
    border-radius: 25px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: linear-gradient(to right, #a00000, #800000);
    transform: scale(1.05);
}

/* Warning text */
.warning {
    color: #800000;
    font-size: 14px;
    margin-bottom: 10px;
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
    <h2>⚠ Delete Patient</h2>
    <p>Remove patient record permanently</p>
</div>

<div class="form-box">

<div class="warning">
⚠ This action cannot be undone
</div>

<form action="DeletePatientServlet" method="post">
    <input type="number" name="id" placeholder="Enter Patient ID" required>
    <button type="submit">Delete Patient</button>
</form>

</div>

<a href="index.jsp">⬅ Back to Home</a>

</body>
</html>