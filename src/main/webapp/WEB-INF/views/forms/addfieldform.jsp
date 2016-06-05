<%--
  Created by IntelliJ IDEA.
  User: Leon
  Date: 6/4/2016
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new field</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
    <form method="POST" action="${contextPath}/addnewfield" class="form-signin">
        <h2 class="form-heading">Create New Field</h2>

        <div class="form-group">

            <input name="name" type="text" class="form-control"
                   autofocus="true"/>
            <select name="type" id="typeSelect">
                <option value="textinput">Text Input</option>
                <option value="textfield">Text Field</option>
                <option value="radio">Radio Button</option>
                <option value="dropdown">Drop Down</option>
                <option value="checkbox">Checkbox</option>
            </select>
            <div id="options" style="display: none">
                <p>Options:</p>
            </div>
            <button type="button" id="addnewoption" style="display: none">Add new option</button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="window.close()">Create Field</button>
        </div>

    </form>
    <script src="${pageContext.request.contextPath}/resources/js/addcustomfield.js"></script>
</body>
</html>
