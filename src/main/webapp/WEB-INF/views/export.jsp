<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CV Complet</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/export.css">
        <!-- <script type="text/javascript" src="//use.typekit.net/lyj3wzr.js"></script>
        <script type="text/javascript">try{Typekit.load();}catch(e){}</script> -->
    <body>
        <div class="page">
            <div class="section row">
                <h1 class="col"><span style="font-weight:700">
                <label class="description" for="element_6">${firstName}</label>
                </span> 
                <label class="description" for="element_5">${lastName} </label>
                </h1>
                <div class="contact-info col-right">
                    <div><label class="description" for="element_2">${phoneNumber} </label></div>
                    <div><a href="mailto:"><label class="description" for="element_8">${email}</label></a></div>
                    <%--<div><a href=""><label class="description" for="element_19">Personal Site </label></a></div>--%>
                </div>
            </div>
             <div class="section row">
                <h2 class="col">Gender</h2>
                <div class="section-text col-right"><span class="key"><label class="description" for="element_4">${gender} </label></div>
			</div>
			<div class="section row">	
                <h2 class="col">Date Of Birth</h2>
                <div class="section-text col-right"><span class="key"><label class="description" for="element_1">${dateOfBirth} </label></div>
			</div>
			<div class="section row">
				<h2 class="col">Address</h2>
                <div class="section-text col-right"><span class="key"><label class="description" for="element_7">${address} </label></div>
             </div>   
			<div class="section row">
				<h2 class="col">Nationality</h2>
                <div class="section-text col-right"><span class="key"><label class="description" for="element_15">${nationality} </label></div>
            </div>
             <%--<div class="section row">
                <h2 class="col">About Me</h2>
                <div class="section-text col-right"><span class="key"><label class="description" for="element_9">About Me </label></div>
            </div>
            <div class="section row">
                <h2 class="col">Hobbies/Interests</h2>
                <div class="section-text col-right"><span class="key"> <label class="description" for="element_16">Hobbies/Interests </label> </span> </div>
            </div>--%>
            <%--<div class="section row">
                <h2 class="col">Skills</h2>
                <div class="section-text col-right"> <span class="key">
                <label class="description" for="element_18">Skills </label>
                </span>    
                </div>
            </div>--%>
            <div class="section row">
                <h2 class="col">Education</h2>
                <div class="section-text col-right">
                    <span class="key"><label class="description" for="element_11">${education} </label></span>
                </div>
            </div>
            <div class="section row">
                <h2 class="col">Job Experience</h2>
                <div class="section-text col-right">

                <span class="key"><label class="description" for="element_10">${workExperience}  </label></span>
                </div>

            </div>

            <c:forEach items="${customFields}" var="cf">
                <div class="section row">
                    <h2 class="col">${cf.name}</h2>
                    <div class="section-text col-right"><span class="key"><label class="description" for="element_15">${cf.value}</label></div>
                </div>
            </c:forEach>
            <%--<div class="section row">
                <h2 class="col">Volunteer Experiences</h2>
                <div class="section-text col-right">

                <span class="key"><label class="description" for="element_17">Volunteer Experiences </label></span>
                </div>

            </div>
            <div class="section row">
                <h2 class="col">Certificates</h2>
                <div class="section-text col-right">
                    <span class="key"><label class="description" for="element_12">Certificates </label></span>
                </div>
            </div>
            <div class="section row">
                <h2 class="col">Recomandations</h2>
                <div class="section-text col-right">
                    <span class="key"><label class="description" for="element_13">Recomandations </label></span>
                </div>
            </div>--%>
            
            
            
        </div>
    </body>
</html>