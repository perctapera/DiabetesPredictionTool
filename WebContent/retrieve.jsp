<%@page import="login.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
 <title> Main Page </title>
 <link rel= "stylesheet" type= "text/css" href="style.css">
</head>
<body>
<%User user = (User) session.getAttribute("User"); %>
<h3>Hi <%=user.getName() %></h3>
<div class="container">

<header>
<h1><a href="home.jsp">DIABETES AND HYPERTENSION PREDICTION TOOL</a></h1>
</header>
  
<nav>
  <ul>
    <li><a href="home.jsp"> HOME</a></li>
    <li><a href="profile.jsp">UPDATE QUESTIONS</a></li>
    <li><b><a href="retrieve.jsp">SAVED PROFILE</a></b></li>
    <li><a href="risk_score.jsp">VIEW STATUS</a></li>
    <li><a href="advice.jsp">ADVICE</a></li>
    <li><a href="facts.jsp">FACTS SHEET </a></li></ul>
    <form action="Logout" method="post"><input type="submit" value="Logout" >
</form>
</nav>

<article>
  	<p><b>Retrieve for Database</b></p>

<ul>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>
<li>Retrieve from Database</li>

</ul>
</article>
</div>
<br>
<br>
<br>
<br>
<br>


<div>
<footer>Diabetes!</footer>

</div>

</body>
</html>
