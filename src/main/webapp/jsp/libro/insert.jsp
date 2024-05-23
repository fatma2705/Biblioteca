<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it" class="h-100">
<head>
<jsp:include page="../header.jsp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/jqueryUI/jquery-ui.min.css" />
<style>
.ui-autocomplete-loading {
	background: white url("../assets/img/jqueryUI/anim_16x16.gif") right
		center no-repeat;
}

.error_field {
	color: red;
}
</style>
<title>Inserisci nuovo</title>

</head>
<body class="d-flex flex-column h-100">
	<jsp:include page="../navbar.jsp" />

	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<%-- se l'attributo in request ha errori --%>
			<spring:hasBindErrors name="libro_autore_attr">
				<%-- alert errori --%>
				<div class="alert alert-danger " role="alert">Attenzione!!
					Sono presenti errori di validazione</div>
			</spring:hasBindErrors>

			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }"
				role="alert">
				${errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>

			<div class='card'>
				<div class='card-header'>
					<h5>Inserisci nuovo elemento</h5>
				</div>
				<div class='card-body'>

					<h6 class="card-title">
						I campi con <span class="text-danger">*</span> sono obbligatori
					</h6>


					<form:form method="post" modelAttribute="insert_libro_attr"
						action="save" novalidate="novalidate" class="row g-3">

						<div class="col-md-6">
							<label for="titolo" class="form-label">Titolo <span
								class="text-danger">*</span></label>
							<spring:bind path="titolo">
								<input type="text" name="titolo" id="titolo"
									class="form-control ${status.error ? 'is-invalid' : ''}"
									placeholder="Inserire il titolo"
									value="${insert_libro_attr.titolo }">
							</spring:bind>
							<form:errors path="titolo" cssClass="error_field" />
						</div>

						<div class="col-md-3">
							<label for="genere" class="form-label">Genere <span
								class="text-danger">*</span></label>
							<spring:bind path="genere">
								<select class="form-select ${status.error ? 'is-invalid' : ''}"
									id="genere" name="genere" required>
									<option value="" selected>- Selezionare -</option>
									<option value="FANTASCIENZA"
										${insert_libro_attr.genere  == 'FANTASCIENZA'?'selected':''}>FANTASCIENZA</option>
									<option value="FANTASY"
										${insert_libro_attr.genere  == 'FANTASY'?'selected':''}>FANTASY</option>
									<option value="HORROR"
										${insert_libro_attr.genere  == 'HORROR'?'selected':''}>HORROR</option>
									<option value="GIALLO"
										${insert_libro_attr.genere  == 'GIALLO'?'selected':''}>GIALLO</option>
									<option value="THRILLER"
										${insert_libro_attr.genere  == 'THRILLER'?'selected':''}>THRILLER</option>
									<option value="ROMANZO_STORICO"
										${insert_libro_attr.genere  == 'ROMANZO_STORICO'?'selected':''}>ROMANZO_STORICO</option>
									<option value="ROMANZO_ROSA"
										${insert_libro_attr.genere  == 'ROMANZO_ROSA'?'selected':''}>ROMANZO_ROSA</option>
									<option value="NARRATIVA_CONTEMPORANEA"
										${insert_libro_attr.genere  == 'NARRATIVA_CONTEMPORANEA'?'selected':''}>NARRATIVA_CONTEMPORANEA</option>
									<option value="SAGGISTICA"
										${insert_libro_attr.genere  == 'SAGGISTICA'?'selected':''}>SAGGISTICA</option>
									<option value="BIOGRAFIA"
										${insert_libro_attr.genere  == 'BIOGRAFIA'?'selected':''}>BIOGRAFIA</option>
									<option value="AUTOBIOGRAFIA"
										${insert_libro_attr.genere  == 'AUTOBIOGRAFIA'?'selected':''}>AUTOBIOGRAFIA</option>
									<option value="MEMORIE"
										${insert_libro_attr.genere  == 'MEMORIE'?'selected':''}>MEMORIE</option>
									<option value="POESIA"
										${insert_libro_attr.genere  == 'POESIA'?'selected':''}>POESIA</option>
									<option value="DRAMMA"
										${insert_libro_attr.genere  == 'DRAMMA'?'selected':''}>DRAMMA</option>
									<option value="AVVENTURA"
										${insert_libro_attr.genere  == 'AVVENTURA'?'selected':''}>AVVENTURA</option>
									<option value="FANTAPOLITICA"
										${insert_libro_attr.genere  == 'FANTAPOLITICA'?'selected':''}>FANTAPOLITICA</option>
									<option value="WESTERN"
										${insert_libro_attr.genere  == 'WESTERN'?'selected':''}>WESTERN</option>
									<option value="UMORISMO"
										${insert_libro_attr.genere  == 'UMORISMO'?'selected':''}>UMORISMO</option>
									<option value="EPISTOLARE"
										${insert_libro_attr.genere  == 'EPISTOLARE'?'selected':''}>EPISTOLARE</option>
									<option value="MITOLOGIA"
										${insert_libro_attr.genere  == 'MITOLOGIA'?'selected':''}>MITOLOGIA</option>

								</select>
							</spring:bind>
							<form:errors path="genere" cssClass="error_field" />
						</div>

						<div class="col-md-6">
							<label for="numPagine" class="form-label">Numero Pagine<span
								class="text-danger">*</span></label>
							<spring:bind path="numPagine">
								<input type="number"
									class="form-control ${status.error ? 'is-invalid' : ''}"
									name="numPagine" id="numPagine"
									placeholder="Inserire numero pagine"
									value="${insert_libro_attr.numPagine }">
							</spring:bind>
							<form:errors path="numPagine" cssClass="error_field" />
						</div>


						<div class="col-md-6">
							<fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date'
								value='${insert_libro_attr.dataPubblicazione}' />
							<div class="form-group col-md-6">
								<label for="dataPubblicazione" class="form-label">Data
									di Pubblicazione <span class="text-danger">*</span>
								</label>
								<spring:bind path="dataPubblicazione">
									<input class="form-control ${status.error ? 'is-invalid' : ''}"
										id="dataPubblicazione" type="date" placeholder="dd/MM/yy"
										title="formato : gg/mm/aaaa" name="dataPubblicazione"
										value="${parsedDate}">
								</spring:bind>
								<form:errors path="dataPubblicazione" cssClass="error_field" />
							</div>
						</div>



						<div class="col-md-6">
							<label for="autoreSearchInput" class="form-label">Autore:
								<span class="text-danger">*</span>
							</label>
							<spring:bind path="autore">
								<input class="form-control ${status.error ? 'is-invalid' : ''}"
									type="text" id="autoreSearchInput" name="autoreInput"
									value="${insert_libro_attr.autore.nome}${empty insert_libro_attr.autore.nome?'':' '}${insert_libro_attr.autore.cognome}">
							</spring:bind>
							<input type="hidden" name="autore.id" id="autoreId"
								value="${insert_libro_attr.autore.id}">
							<form:errors path="autore" cssClass="error_field" />
						</div>

						<!-- 						<div class="form-row">	 -->
						<!-- 							<div class="form-group col-md-6"> -->
						<!-- 								<label for="regista.id">Regista</label> -->
						<!-- 							    <select class="form-control" id="regista.id" name="regista.id"> -->
						<!-- 							    	<option value="" selected> -- Selezionare una voce -- </option> -->
						<%-- 							      	<c:forEach items="${registi_list_attribute }" var="registaItem"> --%>
						<%-- 							      		<option value="${registaItem.id}" ${insert_film_attr.regista.id == registaItem.id?'selected':''} >${registaItem.nome } ${registaItem.cognome }</option> --%>
						<%-- 							      	</c:forEach> --%>
						<!-- 							    </select> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<div class="col-12">
							<button type="submit" name="submit" value="submit" id="submit"
								class="btn btn-primary">Conferma</button>
						</div>


					</form:form>

					<%-- FUNZIONE JQUERY UI PER AUTOCOMPLETE --%>
					<script>
									$("#autoreSearchInput").autocomplete({
										 source: function(request, response) {
										        $.ajax({
										            url: "../autore/searchAutoreAjax",
										            datatype: "json",
										            data: {
										                term: request.term,   
										            },
										            success: function(data) {
										                response($.map(data, function(item) {
										                    return {
											                    label: item.label,
											                    value: item.value
										                    }
										                }))
										            }
										        })
										    },
										//quando seleziono la voce nel campo deve valorizzarsi la descrizione
									    focus: function(event, ui) {
									        $("#autoreSearchInput").val(ui.item.label)
									        return false
									    },
									    minLength: 2,
									    //quando seleziono la voce nel campo hidden deve valorizzarsi l'id
									    select: function( event, ui ) {
									    	$('#autoreId').val(ui.item.value);
									        return false;
									    },
									    //questo serve in quanto se io imposto un regista e poi lo cancello
									    //e faccio altro nella pagina, il valore che poi verrà inviato al 
									    //controller deve essere resettato altrimenti non mi darebbe
									    //l'errore di validazione di regista mancante
									    change: function( event, ui ) {
									    	if(!$("#autoreSearchInput").val()){
									    		$('#autoreId').val('');
									    		return false;
									    	}
									    }
									});
								</script>
					<!-- end script autocomplete -->


					<!-- end card-body -->
				</div>
				<!-- end card -->
			</div>
			<!-- end container -->
		</div>

		<!-- end main -->
	</main>
	<jsp:include page="../footer.jsp" />

</body>
</html>