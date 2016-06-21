<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
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
          <h2>Create, Save and Export your resume!</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected"><a href="/index">Home</a></li>
          <li><a href="/generatecv">Create Your CV</a></li>
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
        <div class="container">

          <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

          </c:if>

          <h4 class="text-center"><a href="${contextPath}/generatecv">Create your CV</a></h4>

        </div>
      </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
      <p><a href="/index">Home</a> | <a href="/generatecv">Create Your CV</a> | <a href="/login">Log In</a> | <a href="/registration">Sign Up</a> | <a href="/contact">Contact Us</a></p>
      <p>Copyright &copy; shadowplay_2 | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">design from HTML5webtemplates.co.uk</a></p>
    </div>
  </div>
</body>
</html>
