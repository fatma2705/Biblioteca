<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Pagina dei Risultati</title>
</head>

<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div
				class="alert alert-success alert-dismissible fade show  ${successMessage==null?'d-none':'' }"
				role="alert">
				${successMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }"
				role="alert">
				${errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-danger alert-dismissible fade show d-none"
				role="alert">
				Esempio di operazione fallita!
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-info alert-dismissible fade show d-none"
				role="alert">
				Aggiungere d-none nelle class per non far apparire
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>



			<div class='card'>
				<div class='card-header'>
					<h5>Lista dei risultati</h5>
				</div>
				<div class='card-body'>
					<a class="btn btn-primary "
						href="${pageContext.request.contextPath}/autore/insert">Add
						New</a> <a href="${pageContext.request.contextPath }/autore/search"
						class='btn btn-outline-secondary'> <i
						class='fa fa-chevron-left'></i> Torna alla Ricerca
					</a>

					<div class='table-responsive'>
						<table class='table table-striped '>
							<thead>
								<tr>
									<th>Nome</th>
									<th>Cognome</th>
									<th>Nome Arte</th>
									<th>Data di Nascita</th>
									<th>Azioni</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${autori_list_attribute }" var="autoreItem">
									<tr>
										<td>${autoreItem.nome }</td>
										<td>${autoreItem.cognome }</td>
										<td>${autoreItem.nomeArte }</td>
										<td><fmt:formatDate type="date"
												value="${autoreItem.dataNascita }" /></td>
										<td><a class="btn  btn-sm btn-outline-secondary"
											href="${pageContext.request.contextPath}/autore/show/${autoreItem.id }">Visualizza</a>
											<a class="btn  btn-sm btn-outline-primary ml-2 mr-2"
											href="${pageContext.request.contextPath}/autore/edit/${autoreItem.id }">Edit</a>
											<a class="btn btn-outline-danger btn-sm"
											href="${pageContext.request.contextPath}/autore/preDelete/${autoreItem.id }">Delete</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

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