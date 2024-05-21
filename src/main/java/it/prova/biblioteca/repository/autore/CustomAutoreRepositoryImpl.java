package it.prova.biblioteca.repository.autore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import it.prova.biblioteca.model.Autore;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

public class CustomAutoreRepositoryImpl implements CustomAutoreRepository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Autore> findByExample(Autore example) {
		Map<String, Object> paramaterMap = new HashMap<String, Object>();
		List<String> whereClauses = new ArrayList<String>();

		StringBuilder queryBuilder = new StringBuilder("select a from Autore a where a.id=a.id");

		if (StringUtils.isNotEmpty(example.getNome())) {
			whereClauses.add(" a.nome like :nome");
			paramaterMap.put("nome", "%" + example.getNome() + "%");
		}
		if (StringUtils.isNotEmpty(example.getCognome())) {
			whereClauses.add(" a.cognome like :cognome ");
			paramaterMap.put("cognome", "%" + example.getCognome() + "%");
		}
		if (StringUtils.isNotEmpty(example.getNomeArte())) {
			whereClauses.add(" a.nomeArte like :nomeArte");
			paramaterMap.put("nomeArte", "%" + example.getNomeArte() + "%");
		}
		if (example.getDataNascita() != null) {
			whereClauses.add("a.dataNascita >= :dataNascita ");
			paramaterMap.put("dataNascita", example.getDataNascita());
		}

		queryBuilder.append(!whereClauses.isEmpty() ? " and" : "");
		queryBuilder.append(StringUtils.join(whereClauses, " and "));
		TypedQuery<Autore> typedQuery = entityManager.createQuery(queryBuilder.toString(), Autore.class);

		for (String key : paramaterMap.keySet()) {
			typedQuery.setParameter(key, paramaterMap.get(key));
		}

		return typedQuery.getResultList();
	}

}
