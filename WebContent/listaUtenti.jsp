<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<jsp:useBean id="bean" scope="request" class="milestone1.UtenteBean"/>


<!-- HTML 5 -->
<!DOCTYPE html>
<html>

<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<head>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/listaUtenti.css">

	<title>FERSA - Lista Utenti</title>

</head>
<body>

	<div class="row" id="choseUser">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
		    <form name="form" method="post" action="paginaUtente.jsp">
		    	<p>Selezionare un utente :</p>    
				<select class="form-control" id="list" name="users" onchange="this.form.submit()">
	           		<%
				    	List<String> userList = bean.getListaUtenti();
		    			out.println("<option>  </option>");
				    	for(int i=0;i<userList.size();i++){				    		
				    		out.println("<option>"+userList.get(i)+"</option>");				    	
				    	}
				   	%>	
				</select>
		    </form>
		</div>
		<div class="col-sm-4"></div>
	</div>
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">
			<img id="image" src="immagini/icon.png" alt="case" width=300 height=300>
		</div>
		<div class="col-sm-4">
		</div>
	</div>

</body>
</html>