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
    <li><b><a href="advice.jsp">ADVICE</a></b></li>
    <li><a href="facts.jsp">FACTS SHEET </a></li></ul>
    <form action="Logout" method="post"><input type="submit" value="Logout" >
</form>
</nav>

<article>
  	<p><b>Managing Diabetes</b></p>
<img src="thumb.jpg" alt="Diabetics" height="42" width="42">
<ul>
<li>Diabetes is a lifelong, total-body problem. Manage blood sugars and overall health with these smart tips.</li>
<li>Brush and floss regularly.
Just as unregulated diabetes leads to high levels of glucose in your blood, it also leads to higher-than-usual levels of glucose in your saliva, which raises the risk for dental decay. Plus, diabetes makes fighting infection harder, so that if gum disease develops, you’ll have a more difficult time getting rid of it than someone without diabetes. However, research suggests that people with diabetes who gain control over their periodontal problems have better glycemic control after gum treatment than before. For healthy teeth and gums, dentists and nutritionists alike recommend that you see your dentist regularly, brush with a fluoride toothpaste at least twice a day, and remember to floss.</li>
<li>Drinking between one-half and two alcoholic drinks per day has been shown to reduce the risk of developing type 2 diabetes by an average of 30 percent, compared with nondrinkers or heavy drinkers. However, among people who already have diabetes, there is some question about the benefits of alcohol. Talk to your doctor to make sure that alcohol is safe for you and that you understand how it might affect your blood-glucose levels. And if you don’t already drink alcohol, don’t start.</li>
<li>Smoking increases the risk of developing diabetes, and once you have it, smoking makes every problem and complication associated with diabetes even worse. Smoking raises blood-glucose levels, constricts blood vessels, and causes inflammation, and smokers have an increased risk of kidney disease, nerve damage, blood-vessel damage, and foot and leg infections. Note that many people gain weight after quitting smoking because they try to satisfy their nicotine cravings by eating more — a particularly dangerous strategy for people with diabetes. Therefore, it’s super-important to quit smoking, if you smoke — and to be mindful of your food intake as you kick the bad habit</li>
<li>As you are learning to gain control over your weight and blood sugar, it can be helpful to keep a log that includes some specific information about your eating habits. Every time you eat, jot down where you are; what time it is; how hungry you feel before beginning to eat and again when you stop eating; the foods and amounts eaten; and your thoughts or feelings at the time. Over time, you’ll start to see patterns. By identifying the situations in which you’re most likely to make poor food choices — something we often do as a response to anxiety or stress — you can learn to substitute new activities.</li>
<li>Next to weight control and medical treatment, exercise is the most important thing you can do to take control over diabetes. Exercise decreases body fat and promotes weight loss — but even if you don’t lose weight as a result, exercise will improve blood-sugar control and your body’s response to insulin and even help prevent heart disease. Aim for 30 minutes of activity, five days per week. Studies show that all levels of exercise are beneficial, from moderate-intensity walking to high-intensity resistance training with weights. The key is to find something you enjoy doing and will stick with — whether it’s walking, swimming, cycling, or dancing — and then get moving!</li>
<li>Diabetes symptoms are silent, so you may not notice an immediate repercussion when you neglect to take your medicine — and that means far too many people decide against taking prescribed medications (or “forget” to take them). Don’t be one of them! Untreated diabetes carries the grave risks of heart disease, nerve damage, and other complications. Take medications or insulin as directed by your physician. If you have uncomfortable side effects or questions about your medication or treatment plan, talk with your doctor.</li>
<li>Some people resist checking their blood-sugar levels, but daily monitoring really is the only way to know if they are under control. Foods, activity level, medications, illness, and even stress can affect blood glucose. Unless you check, you might not know whether your levels are holding steady or spiraling out of control. Ask your doctor how often you need to check — and what to do if your blood glucose readings are abnormal.</li>
<li>Advice on Diabetes</li>
<li>Advice on Diabetes</li>

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
