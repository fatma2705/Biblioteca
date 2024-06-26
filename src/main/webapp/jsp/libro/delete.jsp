
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Rimuovi Elemento</title>

</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div class='card'>
				<div class='card-header'>
					<h5>Vuoi Eliminare Questo Elemento?</h5>
				</div>


				<div class='card-body'>
					<dl class="row">
						<dt class="col-sm-3 text-right">Id:</dt>
						<dd class="col-sm-9">${toDelete_libro_attr.id}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Titolo:</dt>
						<dd class="col-sm-9">${toDelete_libro_attr.titolo}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Genere:</dt>
						<dd class="col-sm-9">${toDelete_libro_attr.genere}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Data Pubblicazione:</dt>
						<dd class="col-sm-9">
							<fmt:parseDate value="${toDelete_libro_attr.dataPubblicazione}"
								pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date" />
							<fmt:formatDate pattern="dd/MM/yyyy"
								value="${localDateToBeParsed}" />
						</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Numero Pagine:</dt>
						<dd class="col-sm-9">${toDelete_libro_attr.numPagine}</dd>
					</dl>

					<!-- info Regista -->
					<p>
						<a class="btn btn-primary btn-sm" data-bs-toggle="collapse"
							href="#collapseExample" role="button" aria-expanded="false"
							aria-controls="collapseExample"> Info Autore </a>
					</p>
					<div class="collapse" id="collapseExample">
						<div class="card card-body">
							<dl class="row">
								<dt class="col-sm-3 text-right">Nome:</dt>
								<dd class="col-sm-9">${toDelete_libro_attr.autore.nome}</dd>
							</dl>
							<dl class="row">
								<dt class="col-sm-3 text-right">Cognome:</dt>
								<dd class="col-sm-9">${toDelete_libro_attr.autore.cognome}</dd>
							</dl>
							<dl class="row">
								<dt class="col-sm-3 text-right">Nome Arte:</dt>
								<dd class="col-sm-9">${toDelete_libro_attr.autore.nomeArte}</dd>
							</dl>

						</div>
					</div>
					<!-- end info Regista -->

				</div>
				<!-- end card body -->

				<div class='card-footer'>
					<form method="post"
						action="${pageContext.request.contextPath}/libro/delete">
						<input type="hidden" name="idLibro"
							value="${toDelete_libro_attr.id}">
						<button type="submit" name="submit" id="submit"
							class="btn btn-danger">Conferma</button>
						<a href="${pageContext.request.contextPath}/libro"
							class='btn btn-outline-secondary' style='width: 80px'> <i
							class='fa fa-chevron-left'></i> Back
						</a>
					</form>
				</div>
				<!-- end card -->
			</div>


			<!-- end container -->
		</div>

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>