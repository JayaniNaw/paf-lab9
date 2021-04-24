<%@page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

//Save---------------------------------
if (request.getParameter("itemCode") != null) { 
	Item itemObj = new Item();
	String stsMsg = ""; 
	
	//Insert--------------------------
	if (request.getParameter("hidItemIDSave") == "") {
		
		stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
				request.getParameter("itemName"), 
				request.getParameter("itemPrice"),   
				request.getParameter("itemDesc")); 
		} else
			//Update----------------------
			{ stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
					request.getParameter("itemCode"),
					request.getParameter("itemName"), 
					request.getParameter("itemPrice"), 
					request.getParameter("itemDesc")); 
			}
	session.setAttribute("statusMsg", stsMsg); } 
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null) { 
	Item itemObj = new Item(); String stsMsg =itemObj.deleteItem(request.getParameter("hidItemIDDelete")); 
	session.setAttribute("statusMsg", stsMsg);
	}
%>

	
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="components/jquery-3.2.1.min.js"></script>
<script src="components/items.js"></script>

<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<div class="container">
 <div class="row">
 <div class="col">

				<h1>Items Management</h1>
				<form id ="formItem" name="formItem" method="post" action="Items.jsp">
			 		Item code: <input id= "itemCode" name="ItemCode" type="text" class="form-control"><br> 
			 		Item name: <input id= "itemName" name="ItemName" type="text" class="form-control"><br> 
			 		Item price:<input id= "ItemPrice" name="ItemPrice" type="text" class="form-control"><br> 
			 		Item description: <input id= "ItemDesc" name="ItemDesc" type="text" class="form-control"><br> 
			 		<input id = "btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"><br>
			 		<input type="hidden"id="hidItemIDSave" name="hidItemIDSave "value="">
				</form>
			
				<br/>
				<!-- Show output -->
				<div class="alert alert-success">
 					<% out.print(session.getAttribute("statusMsg"));%>
				</div>

	<br>
	<%
	 Item itemObj = new Item(); 
	 out.print(itemObj.readItems()); 
	%>
				
	</div>
 </div>
</div>
			

</body>
</html>