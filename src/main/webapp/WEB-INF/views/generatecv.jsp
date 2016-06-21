<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Leon
  Date: 6/2/2016
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

    <spring:url value="/getAllCustomFields" var="getAllCustomFieldsURL"/>

    <%--<script type="text/javascript">
        var customFields = "${getAllCustomFieldsURL}";
        console.log(customFields);
    </script>--%>
    <title>CVNator</title>
    <meta name="description" content="website description"/>
    <meta name="keywords" content="website keywords, website keywords"/>
    <meta http-equiv="content-type" content="text/html; charset=windows-1252"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/view.css" />--%>
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
                <li class="selected"><a href="/generatecv">Create Your CV</a></li>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="/login">Log In</a></li>
                    <li><a href="/signup">Sign Up</a></li>
                </c:if>
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
            <div id="container">
                <h4 class="text-center"><a href="${contextPath}/index">Back to welcome page</a></h4>

                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>

                    <h2>You are logged in as ${pageContext.request.userPrincipal.name} | <a
                            onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
                </c:if>
                <%--<form:form modelAttribute="selectedCv" method="POST" action="${contextPath}/loadcv"
                           class="form-generatecv">
                    <label for="cvSelect"/>
                    <form:select id="cvSelect" path="selectedCv">
                        <form:options items="${cvList}"/>
                    </form:select>
                </form:form>
                <c:if test="cvId != null"--%>

            <%--<c:set var="customFields" value="${customFields}"/>--%>
            <%--<input type="hidden" id="customFields" value="${customFields}"/>--%>

            <form:form modelAttribute="newCVForm" method="POST" action="${contextPath}/generatecv"
                       class="form-generatecv">
            <h2 class="form-heading">Generate your CV</h2>

                <%--< class="form_container">--%>
                <%--<label for="cvPhoto">Photo</label>
                <form:input id="cvPhoto" path="photoString" name="photoString" type="file"/>--%>
            <div>
                <label for="cvName">CV Name</label>
                <br/>
                <form:input id="cvName" path="cvName" name="cvName" type="text"
                            class="form-control"
                            autofocus="true"/>
            </div>
            <br/>
            <div>
                <label for="cvFirstName">First Name</label>
                <br/>
                <form:input id="cvFirstName" path="firstName" name="firstName" type="text"
                            class="form-control"
                            autofocus="true"/>
            </div>
            <br/>
            <div>
                <label for="cvLastName">Last Name</label>
                <br/>
                <form:input id="cvLastName" path="lastName" name="lastName" type="text" class="form-control"/>
            </div>
            <br/>
            <div><label for="cvGender">Gender</label>
                <div id="cvGender">
                    <form:radiobutton path="gender" name="gender" value="Male"/>Male</input>
                    <form:radiobutton path="gender" name="gender" value="Female"/>Female</input>
                </div>
            </div>
            <br/>
            <div>
                <label for="cvDOB">Date of birth</label>
                <br/>
                <form:input id="cvDOB" path="dateOfBirth" name="dateOfBirth" type="date" class="form-control"/>
            </div>
            <br/>
            <div>
                <label for="cvEmail">Email</label>
                <br/>
                <form:input id="cvEmail" path="email" name="email" type="text" class="form-control"/>
            </div>
            <br/>
            <div>
                <label for="cvAddress">Address</label>
                <br/>
                <form:input id="cvAddress" path="address" name="address" type="text" class="form-control"/>
            </div>
            <br/>
            <div>
                <label for="cvCountry">Country</label>
                <br/>
                <form:input id="cvCountry" path="country" name="country" type="text" class="form-control"/>
            </div>
            <br/>
            <div>
                <label for="cvNationality">Nationality</label>
                <br/>
                <form:input id="cvNationality" path="nationality" name="nationality" type="text"
                            class="form-control"/>
            </div>
            <br/>
            <div>
                <label for="cvPhoneNumber">Phone Number</label>
                <br/>
                <form:input id="cvPhoneNumber" path="phoneNumber" name="phoneNumber" type="text"
                            class="form-control"/>
            </div>
            <br/>
            <div style="max-width: 100px">
                <label for="cvEducation">Education</label>
                <form:textarea id="cvEducation" path="education" name="education" rows="4"
                               cols="80"></form:textarea>
            </div>
            <br/>
            <div>
                <label for="cvWorkExperience">Work Experience</label>
                <form:textarea id="cvWorkExperience" path="workExperience" name="workExperience" rows="4"
                               cols="80"></form:textarea>
            </div>
            <br/>
            <div id="additionalFields">
                <c:forEach items="${customFields}" var="cf">
                    <c:if test="${cf.type == \"textinput\"}">
                        <div>
                            <label for="${cf.name}">${cf.name}</label>
                            <br/>
                            <input id="${cf.name}" name="customField" type="text" class="form-control"
                                   value="${cf.value}"/>
                            <br/>
                        </div>
                        <br/>
                    </c:if>
                    <c:if test="${cf.type == \"textfield\"}">
                        <div>
                            <label for="${cf.name}">${cf.name}</label>
                            <br/>
                        <textarea id="${cf.name}" name="customField" rows="4" cols="80"
                                  value="${cf.value}">${cf.value}</textarea>
                            <br/>
                        </div>
                        <br/>
                    </c:if>
                    <c:if test="${cf.type == \"radio\"}">
                        <div>
                            <label for="${cf.name}">${cf.name}</label>
                            <br/>
                            <div id="${cf.name}">
                                <c:if test="${cf.option1 != null}">
                                    <input name="customField${cf.name}" id="${cf.option1}" value="${cf.option1}"
                                           type="radio"
                                           class="form-control"/>${cf.option1}
                                </c:if>
                                <c:if test="${cf.option2 != null}">
                                    <input name="customField${cf.name}" value="${cf.option2}" type="radio"
                                           class="form-control"/>${cf.option2}
                                </c:if>
                                <c:if test="${cf.option3 != null}">
                                    <input name="customField${cf.name}" value="${cf.option3}" type="radio"
                                           class="form-control"/>${cf.option3}
                                </c:if>
                                <c:if test="${cf.option4 != null}">
                                    <input name="customField${cf.name}" value="${cf.option4}" type="radio"
                                           class="form-control"/>${cf.option4}
                                </c:if>
                                <c:if test="${cf.option5 != null}">
                                    <input name="customField${cf.name}" value="${cf.option5}" type="radio"
                                           class="form-control"/>${cf.option5}
                                </c:if>
                                <c:if test="${cf.option6 != null}">
                                    <input name="customField${cf.name}" value="${cf.option6}" type="radio"
                                           class="form-control"/>${cf.option6}
                                </c:if>
                                <input id="hidden${cf.name}" name="customField" type="hidden" value=""/>
                                <script>
                                    var optionsList = document.getElementById("${cf.name}").children;
                                    var hiddenInput = document.getElementById("hidden${cf.name}");
                                    var found = false;
                                    function changeHandler(event) {
                                        hiddenInput = document.getElementById("hidden${cf.name}");
                                        hiddenInput.value = this.value;
                                    }
                                    for (var i = 0; i < optionsList.length - 2; i++) {
                                        optionsList[i].addEventListener("change", changeHandler)
                                        if (optionsList[i].value == "${cf.value}" && optionsList[i].parentElement.id == "${cf.name}") {
                                            optionsList[i].checked = true;
                                            found = true;
                                            hiddenInput.value = optionsList[i].value;
                                        }
                                    }
                                    if (found == false && optionsList.length > 0) {
                                        optionsList[0].checked = true;
                                        hiddenInput.value = optionsList[0].value;
                                    }
                                </script>
                            </div>
                        </div>
                        <br/>
                    </c:if>
                    <c:if test="${cf.type == \"dropdown\"}">
                        <div>
                            <label for="${cf.name}">${cf.name}</label>
                            <br/>
                            <select id="${cf.name}" name="customField">
                                <c:if test="${cf.option1 != null}">
                                    <option value="${cf.option1}">${cf.option1}</option>
                                </c:if>
                                <c:if test="${cf.option2 != null}">
                                    <option value="${cf.option2}">${cf.option2}</option>
                                </c:if>
                                <c:if test="${cf.option3 != null}">
                                    <option value="${cf.option3}">${cf.option3}</option>
                                </c:if>
                                <c:if test="${cf.option4 != null}">
                                    <option value="${cf.option4}">${cf.option4}</option>
                                </c:if>
                                <c:if test="${cf.option5 != null}">
                                    <option value="${cf.option5}">${cf.option5}</option>
                                </c:if>
                                <c:if test="${cf.option6 != null}">
                                    <option value="${cf.option6}">${cf.option6}</option>
                                </c:if>
                            </select>
                            <script>
                                var optionsList = document.getElementById("${cf.name}").children;
                                for (var i = 0; i < optionsList.length; i++) {
                                    optionsList[i].addEventListener("change", changeHandler)
                                    if (optionsList[i].value == "${cf.value}" && optionsList[i].parentElement.id == "${cf.name}") {
                                        optionsList[i].selected = true;
                                    }
                                }
                            </script>
                        </div>
                        <br/>
                    </c:if>
                </c:forEach>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button id="cvSubmitButton" name="submitButton1"
                    class="btn btn-lg btn-primary btn-block" type="submit">Submit CV
            </button>
            <br/>
        </div>

        <div>
            </form:form>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <br/>
                <button class="btn btn-lg btn-primary btn-block" id="addNewFieldButton">Add New Field</button>
            </c:if>
            <br/><br/>
            <a href="/export">Export CV</a>
        </div>
    </div>

    <%--<button class="btn btn-lg btn-primary btn-block" id="parentButton">Submit CV</button>--%>

    <script src="${pageContext.request.contextPath}/resources/js/generateCV.js"></script>
</div>
</div>
<div id="content_footer"></div>
<div id="footer">
    <p><a href="/index">Home</a> | <a href="/generatecv">Create Your CV</a> | <a href="/login">Log In</a> | <a
            href="/registration">Sign Up</a> | <a href="/contact">Contact Us</a></p>
</div>
</div>
</body>
</html>
