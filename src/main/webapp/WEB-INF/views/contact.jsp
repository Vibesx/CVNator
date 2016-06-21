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
          <h1><a href="index.jsp">CV<span class="logo_colour">Nator</span></a></h1>
          <h2>Simple. Contemporary. Website Template.</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li><a href="/index">Home</a></li>
          <li><a href="/generatecv">Create Your CV</a></li>
          <c:if test="${pageContext.request.userPrincipal.name == null}">
            <li><a href="/login">Log In</a></li>
            <li><a href="/registration">Sign Up</a></li>
          </c:if>
          <li class="selected"><a href="/contact">Contact Us</a></li>
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
        <!-- insert the page content here -->
        <p>Telephone: 0745 123 546</p>
        <p>Email: </p><a href="mailto:">test@example.com</a>
        <%--<h1>Contact Us</h1>
        <p>Below is an example of how a contact form might look with this template:</p>
        <form action="#" method="post">
          <div class="form_settings">
            <p><span>Name</span><input class="contact" type="text" name="your_name" value="" /></p>
            <p><span>Email Address</span><input class="contact" type="text" name="your_email" value="" /></p>
            <p><span>Message</span><textarea class="contact textarea" rows="8" cols="50" name="your_enquiry"></textarea></p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="submit" /></p>
          </div>
        </form>
        <p><br /><br />NOTE: A contact form such as this would require some way of emailing the input to an email address.</p>--%>
      </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
      <p><a href="/index">Home</a> | <a href="/generatecv">Create Your CV</a> | <a href="/login">Log In</a> | <a href="/registration">Sign Up</a> | <a href="/contact">Contact Us</a></p>
    </div>
  </div>
</body>
</html>
