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
<h1><a href="home.jsp">DIABETES PREDICTION TOOL</a></h1>
</header>
  
<nav>
  <ul>
     <li><a href="home.jsp"> HOME</a></li>
    <li><a href="profile.jsp">UPDATE QUESTIONS</a></li>
    <li><a href="risk_score.jsp">VIEW STATUS</a></li>
    <li><a href="advice.jsp">ADVICE</a></li>
    <li><b><a href="facts.jsp">FACTS SHEET </a></b></li></ul>
    <form action="Logout" method="post"><input type="submit" value="Logout" >
</form>
</nav>

<article>
  		<p><b>Ten Things You Might Not Know About Diabetes</b></p>
<ul>
  <li>About one third of all people with diabetes do not know they have the disease.<br></li>
  <li>Type 2 diabetes often does not have any symptoms.<br></li>
  <li>Only about five percent of all people with diabetes have type 1 diabetes.<br></li>
  <li>If you are at risk, type 2 diabetes can be prevented with moderate weight loss (10–15 pounds) and 30 minutes of moderate physical activity (such as brisk walking) each day.</li>
  <li>A meal plan for a person with diabetes isn’t very different than that which is recommended for people without diabetes.</li>
  <li>Diabetes is the leading cause of blindness in working-age adults.</li>
  <li>People with diabetes are twice as likely to develop heart disease than someone without diabetes.</li>
  <li>Good control of diabetes significantly reduces the risk of developing complications and prevents complications from getting worse.</li>
  <li>Bariatric surgery can reduce the symptoms of diabetes in obese people.</li>
  <li>Diabetes costs $174 billion annually, including $116 billion in direct medical expenses.</li>
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
