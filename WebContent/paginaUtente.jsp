<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="application.UtenteValutazione.ValutazioneUtente" %>
<%@ page import="milestone1.Filtro" %>

<jsp:useBean id="uBean" scope="session" class="milestone1.UtenteBean"/>

<% 
	String s = request.getParameter("users");
	String ordinamento = request.getParameter("ordinamento");
   	List<String> categorie = new ArrayList<String>();
   	List<String> lingue = new ArrayList<String>();
   	List<String> periodi = new ArrayList<String>();
   	List<String> stelle = new ArrayList<String>();
   	
	if (s != null){

		uBean.setUtente(s);		
		
	}
	else{
		uBean.setUtente(request.getParameter("myhiddenvalue"));
	}
	
	
	if(ordinamento != null){
		
		uBean.setOrdinamento(ordinamento);
		
	}
 	              	
   	//Selezione delle categorie
	if (request.getParameter("categoriaD") != null){
   		categorie.add("Disponibilità");
	}
	
	if (request.getParameter("categoriaE") != null){
   		categorie.add("Educazione");
	}
	
	if (request.getParameter("categoriaP") != null){
   		categorie.add("Pulizia");
	}
	
	uBean.addFiltro(new Filtro("categoria",categorie));
	
	
	//Selezione delle stelle
	if (request.getParameter("stelle1") != null){
   		stelle.add("1");
	}
	if (request.getParameter("stelle2") != null){
   		stelle.add("2");
	}
	if (request.getParameter("stelle3") != null){
   		stelle.add("3");
	}
	if (request.getParameter("stelle4") != null){
   		stelle.add("4");
	}
	if (request.getParameter("stelle5") != null){
   		stelle.add("5");
	}
	
	uBean.addFiltro(new Filtro("stelle",stelle));	
	
	//Selezione delle lingue
	if (request.getParameter("linguaIng") != null){
   		lingue.add("Inglese");
	}

		if (request.getParameter("linguaIta") != null){
   		lingue.add("Italiano");
	}
		
	if (request.getParameter("linguaFra") != null){
   		lingue.add("Francese");
	}

	uBean.addFiltro(new Filtro("lingua",lingue));
	
	//Selezione dei periodi
	if (request.getParameter("periodoMM") != null){
   		periodi.add("Marzo-Maggio");
	}

		if (request.getParameter("periodoGA") != null){
   		periodi.add("Giugno-Agosto");
	}
		
	if (request.getParameter("periodoSN") != null){
   		periodi.add("Settembre-Novembre");
	}

	if (request.getParameter("periodoDF") != null){
   		periodi.add("Dicembre-Febbraio");
	}

	uBean.addFiltro(new Filtro("periodo",periodi));

%>

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
	<link rel="stylesheet" href="css/paginaUtente.css">

	<title>FERSA - Profilo di <%out.println(uBean.getNick());%></title>
	
</head>

<body>
<form name="form2" method="post" action="paginaUtente.jsp">
	<input type="hidden" name="myhiddenvalue" value="<%=uBean.getNick()%>" />
	<div id="head" class="row">
	  <div class="col-sm-1">
	  	<div class="well">
	  		<a href = "listaUtenti.jsp">
	  		<img src="immagini/icon.png" alt="logo" width=20 height=25>
	  		</a>
	  		<p style="font-family: Arial;font-size: 14px;color: #fefeff;display: inline;">FERSA</p>
	  	</div>
	  </div>
	  <div class="col-sm-11">
	  	<div class="well"></div>
	  </div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<br>
		</div>
	</div>
	<div class="row">
	  <div class="col-sm-2">
	  	<div class="well">
	  		<img src="immagini/utente.jpg" alt="user image" width=100 height=100 style="position:relative;left:10px;">
	  		<p style="font-size:18px;position:relative;left:20px;"><b>@<%out.println(uBean.getNick());%></b></p>
	  	</div>
	  </div>
	  <div class="col-sm-3">
	  	<div class="well">
	  		<p id="text" style="text-align:left;"><%out.println(uBean.getDatiUtente());%></p>
	  	</div>
	  </div>
	  <div class="col-sm-3">
	  		<h2 style="text-align:center;">Punteggio : </h2>
			<h1 style="text-align:center;"><b><%out.println(uBean.getMediaTot());%></b></h1>
	  </div>
	  <div class="col-sm-2">
	  	<div class="row">
	  		<div class="col-sm-12">
 					<p id="text" style="display:inline;position:relative;left:30px;"><b>Disponibilità</b></p>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-sm-12">
 					<p id="text" style="display:inline;position:relative;left:30px;top:20px;"><b>Educazione</b></p>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-sm-12">
 					<p id="text" style="display:inline;position:relative;left:30px;top:40px;"><b>Pulizia</b></p>
	  		</div>
	  	</div>
	  	</div>
	  	<div class="col-sm-2">
			<div id="score" style="width:70px;height:30px;border-radius:5px;background-color:#343658;"><p style="color:white;position:relative;left:20px;"><b><%out.println(uBean.getMediaDisp());%></b></p></div>  	
			<div id="score" style="width:70px;height:30px;border-radius:5px;background-color:#546ba9;position:relative;top:15px;"><p style="color:white;position:relative;left:20px;"><b><%out.println(uBean.getMediaEdu());%></b></p></div>  	
			<div id="score" style="width:70px;height:30px;border-radius:5px;background-color:#878CE6;position:relative;top:30px;"><p style="color:white;position:relative;left:20px;"><b><%out.println(uBean.getMediaPul());%></b></p></div>  	
	  	</div>
	  </div>


	<div class="row">
	  <div class="col-sm-10">
	  	<div class="row">
	  		<div class="col-sm-12">
					<select class="form-control" id="list" name="ordinamento" >
							<option>  </option>
							<option>Valutazione crescente</option>
							<option>Valutazione decrescente</option>
					</select>		    
	  		</div>
	  	</div>
	  	<div class="row" id="valutazioni">
	  		<div class="col-sm-12">
	  			<ul class="list-group">
					<%
				    	List<ValutazioneUtente> valList = uBean.getListaValutazioni();
						
						if(valList != null){
					    	for(int i=0;i<valList.size();i++){
					    		
					    		ValutazioneUtente val = valList.get(i);
					    		String valutazione;
					    		
				    			valutazione = "<br><b>"+val.getRecensore()+"</b>&emsp;"+val.getCategoria()+"&emsp;"+val.getLingua()+"&emsp;"+val.getPeriodo()+"&emsp;";
					    		
				    			for(int j=1;j<=val.getStelle();j++){
				    				valutazione += "&bigstar;";
				    			}
				    			
				    			
					    		if(val.getTesto() != null){
					    			valutazione += "<br><i>"+val.getTesto()+"</i><br>";
					    		}

					    		
					    		out.println("<li class='list-gorup-item' id='valutazione'>"+valutazione+"</li>");
					    		
					    	}
						}

				   	%>	
				</ul>
	  		</div>
	  	</div>
	  </div>
	  <div class="col-sm-2 border border-primary rounded">

	  	<div class="row">
	  		<div class="col-sm-12">
	  			<div class="well">
		  				<p id="text" style="font-size:18px;"><b>Categoria</b></p>
		  				<input type="checkbox" name="categoriaD">Disponibilità<br>
						<input type="checkbox" name="categoriaE">Educazione<br>
						<input type="checkbox" name="categoriaP">Pulizia<br>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-sm-12">
	  			<div class="well">
	  				<p id="text" style="font-size:18px;"><b>Numero di stelle</b></p>
	  				<input type="checkbox" name="stelle1">1<br>
					<input type="checkbox" name="stelle2">2<br>
					<input type="checkbox" name="stelle3">3<br>
					<input type="checkbox" name="stelle4">4<br>
					<input type="checkbox" name="stelle5">5<br>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-sm-12">
	  			<div class="well">
	  				<p id="text" style="font-size:18px;"><b>Lingua</b></p>
	  				<input type="checkbox" name="linguaIta">Italiano<br>
					<input type="checkbox" name="linguaIng">Inglese<br>
					<input type="checkbox" name="linguaFra">Francese<br>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-sm-12">
	  			<div class="well">
	  				<p id="text" style="font-size:18px;"><b>Periodo soggiorno</b></p>
	  				<input type="checkbox" name="periodoMM"> Marzo-Maggio<br>
					<input type="checkbox" name="periodoGA"> Giugno-Agosto<br>
					<input type="checkbox" name="periodoSN"> Settembre-Novembre<br>
					<input type="checkbox" name="periodoDF"> Dicembre-Febbraio<br>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-sm-12" style="text-align: center;">
  			  	<input id="button" type="submit" value="Filtra">
	  		</div>
	  	</div>
	  	
	  </div>
	</div>
</form>	
</body>

</html>
