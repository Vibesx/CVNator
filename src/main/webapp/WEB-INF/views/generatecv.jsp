<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Leon
  Date: 6/2/2016
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create your CV</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <%--<script src="${pageContext.request.contextPath}/resources/js/generateCV.js"></script>--%>
    <%--<script>
        document.getElementById("addNewFieldButton").addEventListener("click", function() {
            window.open("/addnewfield", null, "height=200, width=400, status=yes");
        });
    </script>--%>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<body>
<div id="container">
    <h4 class="text-center"><a href="${contextPath}/welcome">Back to welcome page</a></h4>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>You are logged in as ${pageContext.request.userPrincipal.name} | <a
                onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>
    <form method="POST" action="${contextPath}/generatecv" class="form-generatecv">
        <h2 class="form-heading">Generate your CV</h2>

        <div class="form-group">
            <label for="cvFirstName">First Name</label>
            <input id="cvFirstName" name="firstName" type="text" class="form-control" autofocus="true"/>
            <label for="cvLastName">Last Name</label>
            <input id="cvLastName" name="lastName" type="text" class="form-control"/>
            <label for="cvGender">Gender</label>
            <div id="cvGender">
                <input name="gender" type="radio" value="Male" checked>Male</input>
                <input name="gender" type="radio" value="Female"/>Female</input>
            </div>
            <label for="cvDOB">Date of birth</label>
            <input id="cvDOB" name="dateOfBirth" type="date" class="form-control"/>
            <label for="cvEmail">Email</label>
            <input id="cvEmail" name="email" type="text" class="form-control"/>
            <label for="cvAddress">Address</label>
            <input id="cvAddress" name="address" type="text" class="form-control"/>
            <label for="cvCountry">Country</label>
            <input id="cvCountry" name="country" type="text" class="form-control"/>
            <label for="cvNationality">Nationality</label>
            <input id="cvNationality" name="nationality" type="text" class="form-control"/>
            <label for="cvPhoneNumber">phoneNumber</label>
            <input id="cvPhoneNumber" name="phoneNumber" type="text" class="form-control"/>
            <label for="cvEducation">Education</label>
            <textarea id="cvEducation" name="education" rows="4" cols="100"></textarea>
            <label for="cvWorkExperience">Work Experience</label>
            <textarea id="cvWorkExperience" name="workExperience" rows="4" cols="100"></textarea>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit CV</button>
        </div>

    </form>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <button class="btn btn-lg btn-primary btn-block" id="addNewFieldButton">Add New Field</button>
    </c:if>
</div>

<script src="${pageContext.request.contextPath}/resources/js/generateCV.js"></script>
<%--<script>
    document.getElementById("addNewFieldButton").addEventListener("click", function () {
        window.open("/addnewfield", null, "height=200, width=400, status=yes");
    });
</script>--%>
</body>
</html>
