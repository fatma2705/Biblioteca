<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Ricerca</title>
</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


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


					<form method="post"
						action="${pageContext.request.contextPath}/autore/list"
						class="row g-3">


						<div class="col-md-6">
							<label for="nome" class="form-label">Nome</label> <input
								type="text" name="nome" id="nome" class="form-control"
								placeholder="Inserire il nome">
						</div>

						<div class="col-md-6">
							<label for="cognome" class="form-label">Cognome</label> <input
								type="text" name="cognome" id="cognome" class="form-control"
								placeholder="Inserire il cognome">
						</div>

						<div class="col-md-6">
							<label for="nomeArte" class="form-label">Nome arte</label> <input
								type="text" class="form-control" name="nomeArte" id="nomeArte"
								placeholder="Inserire il nome d'arte">
						</div>

						<div class="col-md-3">
							<label for="dataNascita" class="form-label">Data di
								Nascita</label> <input class="form-control" id="dataNascita"
								type="date" placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
								name="dataNascita">
						</div>


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

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>