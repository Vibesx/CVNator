<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">


    <%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>CVNator</title>
    <meta name="description" content="website description" />
    <meta name="keywords" content="website keywords, website keywords" />
    <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>

<body>
<div id="main">
    <div id="header">
        <div id="logo">
            <div id="logo_text">
                <!-- class="logo_colour", allows you to change the colour of the text -->
                <h1><a href="/index">CV<span class="logo_colour">Nator</span></a></h1>
                <h2>Simple. Contemporary. Website Template.</h2>
            </div>
        </div>
        <div id="menubar">
            <ul id="menu">
                <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
                <li><a href="/index">Home</a></li>
                <li><a href="/generatecv">Create Your CV</a></li>
                <li class="selected"><a href="/login">Log In</a></li>
                <li><a href="/registration">Sign Up</a></li>
                <li><a href="/contact">Contact Us</a></li>
            </ul>
        </div>
    </div>
    <div id="content_header"></div>
    <div id="site_content">
        <div class="sidebar">
            <!-- insert your sidebar items here -->
            <h3>Latest News</h3>
            <h5>June 21st, 2016</h5>
            <p>We are finally live! Let's hope we pass the exam!<br />
            <h5>June 21st, 2016</h5>
            <p>Pretty please with sugar lumps on top!<br />
        </div>
        <div id="content">
            <div class="form_settings">

                <form method="POST" action="${contextPath}/login" class="form-signin">
                    <h2 class="form-heading">Log in</h2>

                    <div class="form-group ${error != null ? 'has-error' : ''}">
                        <span>${message}</span>
                        <input name="username" type="text" class="form-control" placeholder="Username"
                               autofocus="true"/>
                        <input name="password" type="password" class="form-control" placeholder="Password"/>
                        <span>${error}</span>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                        <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
                        <h4 class="text-center"><a href="${contextPath}/generatecv">Create your CV</a></h4>
                    </div>

                </form>

            </div>
            <!-- /container -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
        <p><a href="/index">Home</a> | <a href="/generatecv">Create Your CV</a> | <a href="/login">Log In</a> | <a href="/registration">Sign Up</a> | <a href="/contact">Contact Us</a></p>
    </div>
</div>
</body>
</html>
