<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f4f4f4;
}

.header{
    background:#0d6efd;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header a{
    color:white;
    text-decoration:none;
    background:red;
    padding:8px 15px;
    border-radius:5px;
}

.container{
    width:90%;
    margin:30px auto;
}

.cards{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.card{
    flex:1;
    min-width:220px;
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 2px 8px rgba(0,0,0,0.2);
    text-align:center;
}

.card h2{
    color:#0d6efd;
    margin-bottom:10px;
}

.card p{
    color:#555;
}

.footer{
    text-align:center;
    margin-top:50px;
    color:#777;
}
</style>

</head>
<body>

<div class="header">
    <h2>Smart Bank Dashboard</h2>

    <a href="logout">Logout</a>
</div>

<div class="container">

    <h2>Welcome, ${useremail}
     
    </h2>

    <br>

  
</div>

<div class="footer">
    <p>&copy; 2026 Smart Bank Onboarding System</p>
</div>

</body>
</html>