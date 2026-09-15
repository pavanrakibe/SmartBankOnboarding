<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Update User</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .container {
            width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #007bff;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            background: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .success {
            padding: 10px;
            margin-bottom: 15px;
            background: #d4edda;
            color: #155724;
            border-radius: 5px;
        }

        .error {
            padding: 10px;
            margin-bottom: 15px;
            background: #f8d7da;
            color: #721c24;
            border-radius: 5px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Update User</h2>


    <!-- SUCCESS MESSAGE -->

    <c:if test="${not empty successMessage}">

        <div class="success">
            ${successMessage}
        </div>

    </c:if>


    <!-- ERROR MESSAGE -->

    <c:if test="${not empty errorMessage}">

        <div class="error">
            ${errorMessage}
        </div>

    </c:if>


    <!-- UPDATE FORM -->

    <form action="${pageContext.request.contextPath}/auth/updateUser_Logic"
          method="post">

		  <input type="hidden"
		                  name="user_id"
		                  value="${userData.user_id}">

        <!-- NAME -->

        <div class="form-group">

            <label>Name</label>

            <input type="text"
                   name="name"                 
                   value="${userData.name}"     
                   required>

        </div>


        <!-- EMAIL -->

        <div class="form-group">

            <label>Email</label>

            <input type="email"
                   name="email"
                   value="${userData.email}"
                   required>

        </div>


        <!-- MOBILE -->

        <div class="form-group">

            <label>Mobile</label>

            <input type="text"
                   name="mobile"
                   value="${userData.mobile}"
                   required>

        </div>



        <!-- UPDATE BUTTON -->

        <button type="submit">
            Update User
        </button>

    </form>

</div>

</body>

</html>