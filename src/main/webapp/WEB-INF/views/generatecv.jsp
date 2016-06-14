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

    <spring:url value="/getAllCustomFields" var="getAllCustomFieldsURL"/>

    <%--<script type="text/javascript">
        var customFields = "${getAllCustomFieldsURL}";
        console.log(customFields);
    </script>--%>
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

    <%--<c:set var="customFields" value="${customFields}"/>--%>
    <%--<input type="hidden" id="customFields" value="${customFields}"/>--%>

    <form:form modelAttribute="newCVForm" method="POST" action="${contextPath}/generatecv" class="form-generatecv">
        <h2 class="form-heading">Generate your CV</h2>

        <div class="form-group">
            <label for="cvFirstName">First Name</label>
            <form:input id="cvFirstName" path="firstName" name="firstName" type="text" class="form-control"
                        autofocus="true"/>
            <label for="cvLastName">Last Name</label>
            <form:input id="cvLastName" path="lastName" name="lastName" type="text" class="form-control"/>
            <label for="cvGender">Gender</label>
            <div id="cvGender">
                <form:radiobutton path="gender" name="gender" value="Male"/>Male</input>
                <form:radiobutton path="gender" name="gender" value="Female"/>Female</input>
            </div>
            <label for="cvDOB">Date of birth</label>
            <form:input id="cvDOB" path="dateOfBirth" name="dateOfBirth" type="date" class="form-control"/>
            <label for="cvEmail">Email</label>
            <form:input id="cvEmail" path="email" name="email" type="text" class="form-control"/>
            <label for="cvAddress">Address</label>
            <form:input id="cvAddress" path="address" name="address" type="text" class="form-control"/>
            <label for="cvCountry">Country</label>
            <form:input id="cvCountry" path="country" name="country" type="text" class="form-control"/>
            <label for="cvNationality">Nationality</label>
            <form:input id="cvNationality" path="nationality" name="nationality" type="text" class="form-control"/>
            <label for="cvPhoneNumber">Phone Number</label>
            <form:input id="cvPhoneNumber" path="phoneNumber" name="phoneNumber" type="text" class="form-control"/>
            <label for="cvEducation">Education</label>
            <form:textarea id="cvEducation" path="education" name="education" rows="4" cols="100"></form:textarea>
            <label for="cvWorkExperience">Work Experience</label>
            <form:textarea id="cvWorkExperience" path="workExperience" name="workExperience" rows="4"
                           cols="100"></form:textarea>
            <div id="additionalFields">
                <c:forEach items="${customFields}" var="cf">
                    <c:if test="${cf.type == \"textinput\"}">
                        <label for="${cf.name}">${cf.name}</label>
                        <input id="${cf.name}" name="customField" type="text" class="form-control" value="${cf.value}"/>
                    </c:if>
                    <c:if test="${cf.type == \"textfield\"}">
                        <label for="${cf.name}">${cf.name}</label>
                        <textarea id="${cf.name}" name="customField" rows="4" cols="100"
                                  value="${cf.value}">${cf.value}</textarea>
                    </c:if>
                    <c:if test="${cf.type == \"radio\"}">
                        <label for="${cf.name}">${cf.name}</label>
                        <div id="${cf.name}">
                            <c:if test="${cf.option1 != null}">
                                <input name="customField${cf.name}" id="${cf.option1}" value="${cf.option1}" type="radio"
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
                    </c:if>
                    <c:if test="${cf.type == \"dropdown\"}">
                        <label for="${cf.name}">${cf.name}</label>
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
                    </c:if>
                </c:forEach>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button style="display: none" id="cvSubmitButton" name="submitButton1" class="btn btn-lg btn-primary btn-block" type="submit">Submit CV
            </button>
        </div>

    </form:form>


    <%--<c:forEach items="${customFields}" var="cf">
        <form method="POST" action="${contextPath}/saveadditionalfields" class="form-generatecv">
            <c:if test="${cf.type == \"textinput\"}">
                <label for="${cf.name}">${cf.name}</label>
                <input id="${cf.name}" name="value" type="text" class="form-control"/>
            </c:if>
            <c:if test="${cf.type == \"textfield\"}">
                <label for="${cf.name}">${cf.name}</label>
                <textarea id="${cf.name}" name="value" rows="4" cols="100"></textarea>
            </c:if>
            <c:if test="${cf.type == \"radio\"}">
                <label for="${cf.name}">${cf.name}</label>
                <div id="${cf.name}">
                    <c:if test="${cf.option1 != null}">
                        <input name="value" value="${cf.option1}" type="radio" class="form-control"/>${cf.option1}
                    </c:if>
                    <c:if test="${cf.option2 != null}">
                        <input name="value" value="${cf.option2}" type="radio" class="form-control"/>${cf.option2}
                    </c:if>
                    <c:if test="${cf.option3 != null}">
                        <input name="value" value="${cf.option3}" type="radio" class="form-control"/>${cf.option3}
                    </c:if>
                    <c:if test="${cf.option4 != null}">
                        <input name="value" value="${cf.option4}" type="radio" class="form-control"/>${cf.option4}
                    </c:if>
                    <c:if test="${cf.option5 != null}">
                        <input name="value" value="${cf.option5}" type="radio" class="form-control"/>${cf.option5}
                    </c:if>
                    <c:if test="${cf.option6 != null}">
                        <input name="value" value="${cf.option6}" type="radio" class="form-control"/>${cf.option6}
                    </c:if>
                </div>
            </c:if>
            <c:if test="${cf.type == \"dropdown\"}">
                <label for="${cf.name}">${cf.name}</label>
                <select id="${cf.name}" name="value">
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
                <input id="${cf.name}" name="value" type="text" class="form-control"/>
            </c:if>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button style="display: none" name="submitButton" class="btn btn-lg btn-primary btn-block" type="submit">Submit CV</button>
        </form>
    </c:forEach>--%>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <button class="btn btn-lg btn-primary btn-block" id="addNewFieldButton">Add New Field</button>
    </c:if>
</div>

<button class="btn btn-lg btn-primary btn-block" id="parentButton">Submit CV</button>

<script src="${pageContext.request.contextPath}/resources/js/generateCV.js"></script>
<%--<script>
    document.getElementById("addNewFieldButton").addEventListener("click", function () {
        window.open("/addnewfield", null, "height=200, width=400, status=yes");
    });
</script>--%>
</body>
</html>
