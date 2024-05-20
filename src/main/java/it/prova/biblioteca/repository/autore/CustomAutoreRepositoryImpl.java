package it.prova.biblioteca.repository.autore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.micrometer.common.util.StringUtils;
import it.prova.biblioteca.model.Autore;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

public class CustomAutoreRepositoryImpl implements CustomAutoreRepository {
	
	@PersistenceContext
	private EntityManager entityManager;

//	@Override
//	public List<Autore> findByExample(Autore example) {
//		Map<String,Object> paramaterMap = new HashMap<String,Object>();
//		List<String> whereClauses= new ArrayList<String>();
//		
//		StringBuilder queryBuilder = new StringBuilder("select a from Autore a where a.id=a.id");
//		
//		if (StringUtils.isNotEmpty(example.getNome())) {
//			
//		}
//	}

}
