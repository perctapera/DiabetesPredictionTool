<%@page import="login.User"%>
<%@page import="updateProfile.UpdateProDAO" %>
<%@page import="updateProfile.UpdatePro" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
 <title> Main Page </title>
 <link rel= "stylesheet" type= "text/css" href="style.css">
 <script type="text/javascript">
 
      // Form validation code will come here.
    function validate()
      {

         if( document.myForm.fullname.value == "" )
         {
            alert( "Please provide your First Name!" );
            document.myForm.fullname.focus() ;
            return false;
         }

         if( document.myForm.surname.value == "" )
         {
            alert( "Please provide your Surname!" );
            document.myForm.surname.focus() ;
            return false;
         }
         if( document.myForm.weight.value == "" )
         {
            alert( "Please provide your weight!" );
            document.myForm.weight.focus() ;
            return false;
         }
         if( document.myForm.height.value == "" )
         {
            alert( "Please provide your height!" );
            document.myForm.height.focus() ;
            return false;
         }
         if( document.myForm.age.value == "" )
         {
            alert( "Please provide your age!" );
            document.myForm.age.focus() ;
            return false;
         }
         if( document.myForm.bp.value == "" )
         {
            alert( "Please provide your blood pressure" );
            document.myForm.bp.focus() ;
            return false;
         } 
         if( document.myForm.weight.value == "" )
         {
            alert( "Please provide your blood pressure" );
            document.myForm.bp.focus() ;
            return false;
         } 
         
         
         return( true );
      }
  
  </script>
 
  
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
    <li><b><a href="profile.jsp">UPDATE QUESTIONS</a></b></li>
    <li><a href="risk_score.jsp">VIEW STATUS</a></li>
    <li><a href="advice.jsp">ADVICE</a></li>
    <li><a href="facts.jsp">FACTS SHEET </a></li></ul>
    <form action="Logout" method="post"><input type="submit" value="Logout" >
</form>
</nav>

<article>
 <script type="text/javascript">
function changetextbox()
{
    if (document.getElementById("sex").value == "MALE") {
        document.getElementById("iffp").disable='true';
    } else {
        document.getElementById("iffp").disable='false';
    }
}
</script>
<%

UpdatePro updatePro = null;
try {
	
	UpdateProDAO empDao = new UpdateProDAO();
	updatePro = empDao.getUpdatePro(user.getId());
} catch(Exception npe){

	npe.printStackTrace();
}

	if(updatePro != null){
	
%>
 <form action="dbUpdate" method="post" name= "myForm" onsubmit="return(validate());">
 
			<table border="0" cellpadding="10" cellspacing="0" width="600"
				class="tblTable">
				<tr class="tblHead">
					<td colspan="2"><b>Kindly Answer the following Questions below to determine your diabetic status</b></td>
				</tr>
				<tr>
					<td width="40%"><label></label></td>
					<td width="60%"></td>
				</tr>

				<tr>
					<td><label>Full Names</label></td>
					<td><input type="text" name="fullname" class="txtField"  value="<%=updatePro.getFullname()%>" required /><span
						id="fullname" class="required"></span></td>
				</tr>
				<tr>
					<td><label>Surname</label></td>
					<td><input type="text" name="surname" class="txtField" value="<%=updatePro.getSurname()%>" required /><span
						id="surname" ></span></td>
				</tr>
				<tr>
				<td><label>Gender</label></td>
    			<td><input type="radio" value = "0" name="gender" checked="checked">Male
    				<input type="radio" value = "1" name="gender" >Female</td>
    			</tr>
    			

				<tr>
					<td><label>Weight (kg)</label></td>
					<td><input type="number" min="20" max="150" name="weight" class="txtField" value= " <%=updatePro.getWeight() %>" required /><span id="weight" ></span></td>
				</tr>

				<tr>
					<td>Height (cm)</td>
					<td><input type="number" min="50" max="300" name="height" class="txtField" value = "<%=updatePro.getHeight()%>" required /><span id="height" ></span></td>
					
					<%  %>
					</td>
				</tr>
				<tr>
					<td><label>Age</label></td>
					<td><input type="text" name="age" class="txtField" value="<%=updatePro.getAge() %>" required /><span
						id="age" ></span></td>
				</tr>

				<tr>

					<td><label>If female number of times pregnant</label></td>
					<td><select name="notp" id="iffp">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5+</option>
					</select></td>
				</tr>

				<tr>
					<td><label>Blood Pressure</label></td>
					<td><input type="number" min="20" max="150" name="bp" class="txtField" value="<%=updatePro.getBp()%>" required  /><span id="bp" ></span></td>
				</tr>

				<tr>
					<td><label>diabetes mellitus history in relatives</label></td>
					<td><select name="dpf">
							<option value="1">Yes</option>
							<option value="0">No</option>
					</select></td>
				</tr>
	<tr><td><label><b> Kindly answer the following questions to determine your glucose level</b> </label></td></tr>
				<tr>
					<td><label>Occasional burred vision</label></td>
					<td><select name="vision">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				<tr>
					<td><label>Frequent urination</label></td>
					<td><select name="urine">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				
				<tr>
					<td><label>Over Thirsty</label></td>
					<td><select name="thirsty">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				
				<tr>
					<td><label>Feeling hungry</label></td>
					<td><select name="hungry">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				<tr>
					<td><label>Tiredness and loss of weight</label></td>
					<td><select name="tiredness">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				

				<tr>
					<td><input type="submit" name="submit" value="Submit"
						class="btnSubmit" style="background-color: Silver; color: Black"></td>
					<td><input name="Reset" type="reset" value="Cancel"
						class="btnReset" style="background-color: Silver;"></td>
				</tr>
			</table>
		</form>			
 <% 


	}else{
		

%>
<form action="dbInsert" method="post" name= "myForm" onsubmit="return(validate());">

			<table border="0" cellpadding="10" cellspacing="0" width="600"
				class="tblTable">
				<tr class="tblHead">
					<td colspan="2"><b>Kindly Answer the following Questions
							below to determine your diabetic status</b></td>
				</tr>
				<tr>
					<td width="40%"><label></label></td>
					<td width="60%"></td>
				</tr>

				<tr>
					<td><label>Full Names</label></td>
					<td><input type="text" name="fullname" class="txtField"required /><span
						id="fullname" class="required"></span></td>
				</tr>
				<tr>
					<td><label>Surname</label></td>
					<td><input type="text" name="surname" class="txtField" required/><span
						id="surname" ></span></td>
				</tr>
				<tr>
				<td><label>Gender</label></td>
    			<td><input type="radio" name="gender" value = "0" checked="checked">Male
    				<input type="radio" name="gender" value = "1">Female</td>
    			</tr>
    			</tr>

				<tr>
					<td><label>Weight (kg)</label></td>
					<td><input type="number" min="20" max="150" name="weight" class="txtField" required /><span
						id="weight" ></span></td>
				</tr>

				<tr>
					<td>Height (cm)</td>
					<td><input typetype="number" min="50" max="300" name="height" class="txtField" /><span
						id="height" class="required"></span></td>
				</tr>
				<tr>
					<td><label>Age</label></td>
					<td><input type="text" name="age" class="txtField" required /><span
						id="age" ></span></td>
				</tr>

				<tr>

					<td><label>If female number of times pregnant</label></td>
					<td><select name="notp">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5+</option>
					</select></td>
				</tr>

				<tr>
					<td><label>Blood Pressure</label></td>
					<td><input type="number" min="20" max="150" name="bp" class="txtField" required /><span id="bp" ></span></td>
				</tr>

				<tr>
					<td><label>Diabetes mellitus history in relatives</label></td>
					<td><select name="dpf">
					<option value="0">SELECT HISTORY</option>
							<option value="1">Yes</option>
							<option value="0">No</option>
					</select></td>
				</tr>

				
			<tr><td><label><b> Kindly answer the following questions to determine your glucose level</b> </label></td></tr>
				<tr>
					<td><label>Occasional burred vision</label></td>
					<td><select name="vision">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				<tr>
					<td><label>Frequent urination</label></td>
					<td><select name="urine">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				
				<tr>
					<td><label>Over Thirsty</label></td>
					<td><select name="thirsty">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				
				<tr>
					<td><label>Feeling hungry</label></td>
					<td><select name="hungry">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				<tr>
					<td><label>Tiredness and loss of weight</label></td>
					<td><select name="tiredness">
							<option value="0">No</option>
							<option value="1">Yes</option></select></td>
				</tr>
				

				<tr>
					<td><input type="submit" name="submit" value="Submit"
						class="btnSubmit" style="background-color: Silver; color: Black"></td>
					<td><input name="Reset" type="reset" value="Cancel"
						class="btnReset" style="background-color: Silver;"></td>
				</tr>
			</table>
		</form>	
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
<% 		
	}
%>
</html>
