<%@page import="login.User"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
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
  <li><b><a href="home.jsp"> HOME</a></b></li>
    <li><a href="profile.jsp">UPDATE QUESTIONS</a></li>
    <li><a href="risk_score.jsp">VIEW STATUS</a></li>
    <li><a href="advice.jsp">ADVICE</a></li>
    <li><a href="facts.jsp">FACTS SHEET </a></li></ul>
    <form action="Logout" method="post"><input type="submit" value="Logout" >
</form>
</nav>

<article>
  	<p><b>What is Diabetes?</b></p>

<ul>
<li>Diabetes, commonly referred to as diabetes, is a group of metabolic diseases in which there are high blood sugar levels over a prolonged period. 
  Symptoms of high blood sugar include frequent urination, increased thirst, and increased hunger. If left untreated, diabetes can cause many complications.
  Acute complications can include diabetic ketoacidosis, nonketotic hyperosmolar coma, or death.
   Serious long-term complications include heart disease, stroke, chronic kidney failure, foot ulcers, and damage to the eyes.</li>
   <li>Diabetes is due to either the pancreas not producing enough insulin or the cells of the body not responding properly to the insulin produced. 
   There are three main types of diabetes mellitus:</li>
   <li>Type 1 DM results from the pancreas's failure to produce enough insulin. 
   This form was previously referred to as "insulin-dependent diabetes mellitus" (IDDM) or "juvenile diabetes". The cause is unknown.</li>
   <li>Type 2 DM begins with insulin resistance, a condition in which cells fail to respond to insulin properly. 
   As the disease progresses a lack of insulin may also develop. This form was previously referred to as "non insulin-dependent diabetes mellitus" (NIDDM) or "adult-onset diabetes". 
   The most common cause is excessive body weight and not enough exercise.</li>
   <li>Gestational diabetes is the third main form and occurs when pregnant women 
   without a previous history of diabetes develop high blood-sugar levels.</li>

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