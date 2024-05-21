package it.prova.biblioteca.repository.libro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import it.prova.biblioteca.model.Libro;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

public class CustomLibroRepositoryImpl implements CustomLibroRepository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Libro> findByExample(Libro example) {
		Map<String, Object> paramaterMap = new HashMap<String, Object>();
		List<String> whereClauses = new ArrayList<String>();

		StringBuilder queryBuilder = new StringBuilder(
				"select l from Libro l left join fetch l.autore a where l.id = l.id ");

		if (StringUtils.isNotEmpty(example.getTitolo())) {
			whereClauses.add(" l.titolo like :titolo");
			paramaterMap.put("titolo", "%" + example.getTitolo() + "%");
		}
		if (example.getGenere() != null) {
			whereClauses.add(" l.genere = :genere ");
			paramaterMap.put("genere", example.getGenere());
		}
		if (example.getNumPagine() != null) {
			whereClauses.add("l.numPagine >= :numPagine");
			paramaterMap.put("numPagine", example.getNumPagine());
		}
		if (example.getDataPubblicazione() != null) {
			whereClauses.add(" l.dataPubblicazione >= :dataPubblicazione");
			paramaterMap.put("dataPubblicazione", example.getDataPubblicazione());
		}
		if (example.getAutore() != null) {
			whereClauses.add(" a.id = :id");
			paramaterMap.put("id", example.getAutore().getId());
		}

		queryBuilder.append(!whereClauses.isEmpty() ? " and " : "");
		queryBuilder.append(StringUtils.join(whereClauses, " and "));
		TypedQuery<Libro> typedQuery = entityManager.createQuery(queryBuilder.toString(), Libro.class);

		for (String key : paramaterMap.keySet()) {
			typedQuery.setParameter(key, paramaterMap.get(key));
		}

		return typedQuery.getResultList();
	}

}
