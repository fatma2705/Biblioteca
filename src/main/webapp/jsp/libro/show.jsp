<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="it" class="h-100">
<head>
<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />
<title>Visualizza elemento</title>

</head>
<body class="d-flex flex-column h-100">
	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp" />

	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div class='card'>
				<div class='card-header'>Visualizza dettaglio</div>

				<div class='card-body'>
					<dl class="row">
						<dt class="col-sm-3 text-right">Id:</dt>
						<dd class="col-sm-9">${show_libro_attr.id}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Titolo:</dt>
						<dd class="col-sm-9">${show_libro_attr.titolo}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Genere:</dt>
						<dd class="col-sm-9">${show_libro_attr.genere}</dd>
					</dl>

					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Numero Pagine:</dt>
						<dd class="col-sm-9">${show_libro_attr.numPagine}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Data Pubblicazione:</dt>
						<dd class="col-sm-9">
							<fmt:formatDate type="date"
								value="${show_libro_attr.dataPubblicazione}" />
						</dd>


						<!-- info Autore -->
						<p>
							<a class="btn btn-primary btn-sm" data-bs-toggle="collapse"
								href="#collapseExample" role="button" aria-expanded="false"
								aria-controls="collapseExample"> Info Autore </a>
						</p>
						<div class="collapse" id="collapseExample">
							<div class="card card-body">
								<dl class="row">
									<dt class="col-sm-3 text-right">Nome:</dt>
									<dd class="col-sm-9">${show_libro_attr.autore.nome}</dd>
								</dl>
								<dl class="row">
									<dt class="col-sm-3 text-right">Cognome:</dt>
									<dd class="col-sm-9">${show_libro_attr.autore.cognome}</dd>
								</dl>
								<dl class="row">
									<dt class="col-sm-3 text-right">Nome Arte:</dt>
									<dd class="col-sm-9">${show_libro_attr.autore.nomeArte}</dd>
								</dl>

							</div>
							<!-- end info Autore -->
						</div>

						<!-- end card body -->
				</div>

				<div class='card-footer'>
					<a href="${pageContext.request.contextPath }/libro/"
						class='btn btn-outline-secondary' style='width: 80px'> <i
						class='fa fa-chevron-left'></i> Back
					</a>
				</div>
				<!-- end card -->
			</div>

			<!-- end container -->
		</div>

	</main>
	<jsp:include page="../footer.jsp" />

</body>
</html>