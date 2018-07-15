<%@page import="com.neuralnet.engine.EngineTrain" %>
<%@page import="login.User"%>
<%@page import="updateProfile.UpdateProDAO" %>
<%@page import="updateProfile.UpdatePro" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.io.PrintWriter" %>
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
<%User user = (User) session.getAttribute("User");

UpdatePro updatePro = null;
try {
	
	UpdateProDAO empDao = new UpdateProDAO();
	updatePro = empDao.getUpdatePro(user.getId());
} catch(Exception npe){

	npe.printStackTrace();
}

	

%>
<h3>Hi <%=user.getName() %></h3>
<div class="container">

<header>
<h1><a href="home.jsp">DIABETES PREDICTION TOOL</a></h1>
</header>
  
<nav>
  <ul>
    <li><a href="home.jsp"> HOME</a></li>
    <li><a href="profile.jsp">UPDATE QUESTIONS</a></li>
    <li><b><a href="risk_score.jsp">VIEW STATUS</a></b></li>
    <li><a href="advice.jsp">ADVICE</a></li>
    <li><a href="facts.jsp">FACTS SHEET </a></li></ul>
    <form action="Logout" method="post"><input type="submit" value="Logout" >
</form>
</nav>

<article>

<br>
<br>
<br>
<br>

<%  if(updatePro != null){
	
	
	EngineTrain nn = new EngineTrain();
	nn.loadWeights();
	
	//float f1= 0;
	//float f2 = 0;
	//float f3 = 0;
	//float f4 = 0;
	//float f5 = 0;
	//float f6 = 0;
	//float f7 = 0;
	
	int sex = updatePro.getSex();
	float bmi = updatePro.getBmi();
	int age = updatePro.getAge();
	int notp = updatePro.getIffp();
	int bp = updatePro.getBp();
	float dpf = updatePro.getDpf();
	float glucose = updatePro.getSugar();
	
	System.out.println("*********records from db");
	
	System.out.print("Sex: "+sex+"  BMI "+bmi +" age "+age +" notp "+notp +" bp "+bp +" dpf "+dpf +" glucose "+glucose);

	float f1 = sex;
	
	// normalisation formula inoti y=((x-min)/max-min)
	float bmiNorm = (float)bmi/100;
	float f2 = bmiNorm;
	
	
	float ageNorm = (float)age/99;
	float f3 = ageNorm;
	
	
	float notpNorm =  (float)notp/17;
	float f4 = notpNorm;
	
	float bpNorm =(float)bp/122;
	float f5 = bpNorm;
	
	
	float f6 =dpf;
	
	
	float f7 = glucose;
	
	
	
System.out.println("*********normalise from db");
	
	System.out.print("Sex: "+sex+"  BMI "+bmiNorm +" age "+ageNorm +" notp "+notpNorm +" bp "+bpNorm +" dpf "+dpf +" glucose "+glucose);

	
	
	// normalise here
	// get from profile updatePro.getAge();
	//nomalise age
	//f1 = normalised value from update pro
	
	
	
	
	
	// end of normalisation
	// put the values in as features
	
	nn.readMyData(f1, f2, f3, f4, f5, f6, f7);
	
	
 %>




<p> Your Risk Score is  
<%
//= nn.run()
double a = 0;
a = nn.run();
float aa = (float)a;
double aaa = (double)aa;
if (aaa < 0.3) {

	out.println(aaa +"<font color=green>\n You have less probabilty of having diabetes.</font>");
}
else if (aaa > 0.3 && aaa <0.5){

	out.println(aaa + "<font color=blue>\n Watch out your diet you have less risk of having diabetes</font>");
}
else if (aaa > 0.6 && aaa <0.8){
	
	out.println(aa +"<font color=blue>Watch out your diet you have less risk of having diabetes</font>");	
}
else {
	//PrintWriter out= response.getWriter();
	out.println(a +"<font color=red>Contact a heath practitioner immediately your have high risk of having diabetes.</font>");	
}
%>



<%
}else{
	
	
%>

<p> Your Profile could not be found</p>
<%	
	
	
}

%>>


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
