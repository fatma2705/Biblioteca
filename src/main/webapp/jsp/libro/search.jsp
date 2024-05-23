<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it" class="h-100">
<head>
<jsp:include page="../header.jsp" />
<title>Ricerca</title>
</head>
<body class="d-flex flex-column h-100">
	<jsp:include page="../navbar.jsp" />

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
	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }"
				role="alert">
				${errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>

			<div class='card'>
				<div class='card-header'>
					<h5>Ricerca elementi</h5>
				</div>
				<div class='card-body'>

					<form method="post" action="list" class="row g-3">

						<div class="col-md-6">
							<label for="titolo" class="form-label">Titolo</label> <input
								type="text" name="titolo" id="titolo" class="form-control"
								placeholder="Inserire il titolo">
						</div>

						<div class="col-md-3">
							<label for="genere" class="form-label">Genere</label> <select
								class="form-select" id="genere" name="genere">
								<option value="" selected>- Selezionare -</option>
								<option value="FANTASCIENZA">FANTASCIENZA</option>
								<option value="FANTASY">FANTASY</option>
								<option value="HORROR">HORROR</option>
								<option value="GIALLO">GIALLO</option>
								<option value="THRILLER">THRILLER</option>
								<option value="ROMANZO_STORICO">ROMANZO_STORICO</option>
								<option value="ROMANZO_ROSA">ROMANZO_ROSA</option>
								<option value="NARRATIVA_CONTEMPORANEA">NARRATIVA_CONTEMPORANEA</option>
								<option value="SAGGISTICA">SAGGISTICA</option>
								<option value="BIOGRAFIA">BIOGRAFIA</option>
								<option value="AUTOBIOGRAFIA">AUTOBIOGRAFIA</option>
								<option value="MEMORIE">MEMORIE</option>
								<option value="POESIA">POESIA</option>
								<option value="DRAMMA">DRAMMA</option>
								<option value="AVVENTURA">AVVENTURA</option>
								<option value="FANTAPOLITICA">FANTAPOLITICA</option>
								<option value="WESTERN">WESTERN</option>
								<option value="UMORISMO">UMORISMO</option>
								<option value="EPISTOLARE">EPISTOLARE</option>
								<option value="MITOLOGIA">MITOLOGIA</option>
							</select>
						</div>

						<div class="col-md-6">
							<label for="numPagine" class="form-label">Numero Pagine</label> <input
								type="number" class="form-control" name="numPagine"
								id="numPagine" placeholder="Inserire numero pagine">
						</div>

						<div class="col-md-6">
							<label for="dataPubblicazione" class="form-label">Data di
								Pubblicazione</label> <input class="form-control" id="dataPubblicazione"
								type="date" placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
								name="dataPubblicazione">
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
						<%-- FUNZIONE JQUERY UI PER AUTOCOMPLETE --%>
						<script>
							$("#autoreSearchInput")
									.autocomplete(
											{
												source : function(request,
														response) {
													$
															.ajax({
																url : "../autore/searchAutoriAjax",
																datatype : "json",
																data : {
																	term : request.term,
																},
																success : function(
																		data) {
																	response($
																			.map(
																					data,
																					function(
																							item) {
																						return {
																							label : item.label,
																							value : item.value
																						}
																					}))
																}
															})
												},
												//quando seleziono la voce nel campo deve valorizzarsi la descrizione
												focus : function(event, ui) {
													$("#autoreSearchInput")
															.val(ui.item.label)
													return false
												},
												minLength : 2,
												//quando seleziono la voce nel campo hidden deve valorizzarsi l'id
												select : function(event, ui) {
													$('#autoreId').val(
															ui.item.value);
													return false;
												},
												//questo serve in quanto se io imposto un regista e poi lo cancello
												//e faccio altro nella pagina, il valore che poi verrà inviato al 
												//controller deve essere resettato altrimenti non mi darebbe
												//l'errore di validazione di regista mancante
												change : function(event, ui) {
													if (!$(
															"#autoreSearchInput")
															.val()) {
														$('#autoreId').val('');
														return false;
													}
												}
											});
						</script>
						<!-- end script autocomplete -->
						<div class="col-12">
							<button type="submit" name="submit" value="submit" id="submit"
								class="btn btn-primary">Conferma</button>
							<a class="btn btn-outline-primary ml-2"
								href="${pageContext.request.contextPath}/autore/insert">Add
								New</a> <input class="btn btn-outline-warning" type="reset"
								value="Ripulisci">
						</div>

					</form>



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