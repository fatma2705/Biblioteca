<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it" class="h-100">
<head>
	<meta charset="UTF-8">
	<title>Error page</title>
	<!-- Import comune in tutte le pagine -->
	<jsp:include page="./header.jsp" />
	<style>
		.container {
			padding: 1rem;
		}
		.card-header {
			font-size: 1.5rem;
			font-weight: bold;
			background-color: #ffcccc;
			color: #cc0000;
			border: none;
		}
		.card-title {
			font-size: 1.2rem;
			font-weight: bold;
		}
		.card-text {
			font-size: 1.1rem;
		}
		.btn {
			font-size: 1.1rem;
			background-color: #cc0000;
			border-color: #cc0000;
		}
		.btn:hover {
			background-color: #ffcccc;
			color: #cc0000;
		}
	</style>
</head>
<body class="d-flex flex-column h-100">
	<!-- Navbar fissa -->
	<jsp:include page="./navbar.jsp" />
	<main class="flex-shrink-0">
		<div class="container">
			<div class="card border-danger">
				<div class="card-header">Oooops......</div>

				<div class="card-body text-danger">
					<h5 class="card-title">Piccolo Problemino</h5>
					<p class="card-text">Abbiamo riscontrato un problema. Ci scusiamo per l'inconveniente.</p>

					<!-- Dettagli sull'errore -->
					<p>
						<a class="btn btn-primary btn-sm" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"> Dettagli </a>
					</p>

					<div class="collapse" id="collapseExample">
						<div class="card-body text-danger">
							<p class="card-text">Nulla di grave, ma ti chiediamo di contattare il nostro servizio di assistenza per risolvere il problema.</p>
						</div>
					</div>
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
		<!-- /.container -->
	</main>

	<!-- Footer -->
	<jsp:include page="./footer.jsp" />
</body>
</html>
