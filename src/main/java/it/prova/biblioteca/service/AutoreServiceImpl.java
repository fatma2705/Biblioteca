package it.prova.biblioteca.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;

import it.prova.biblioteca.model.Autore;
import it.prova.biblioteca.repository.autore.AutoreRepository;
import jakarta.persistence.criteria.Predicate;

public class AutoreServiceImpl implements AutoreService {

	@Autowired
	private AutoreRepository repository;

	@Transactional(readOnly = true)
	public List<Autore> listAllElements() {
		return (List<Autore>) repository.findAll();
	}

	@Transactional(readOnly = true)
	public Autore caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Transactional(readOnly = true)
	public Autore caricaSingoloElementoConLibri(Long id) {
		return repository.findByidEager(id);
	}

	@Transactional
	public void aggiorna(Autore autoreInstance) {
		repository.save(autoreInstance);
	}

	@Transactional
	public void inserisciNuovo(Autore autoreInstance) {
		repository.save(autoreInstance);
	}

	@Transactional
	public void rimuovi(Long idToDelete) {
		repository.deleteById(idToDelete);
	}

	@Transactional
	public List<Autore> findByExample(Autore example) {
		return repository.findByExample(example);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<Autore> findByExampleWithPagination(Autore example, Integer pageNo, Integer pageSize, String sortBy) {

		Specification<Autore> specificationCriteria = (root, query, cb) -> {

			List<Predicate> predicates = new ArrayList<Predicate>();

			if (StringUtils.isNotEmpty(example.getNome()))
				predicates.add(cb.like(cb.upper(root.get("nome")), "%" + example.getNome().toUpperCase() + "%"));

			if (StringUtils.isNotEmpty(example.getCognome()))
				predicates.add(cb.like(cb.upper(root.get("cognome")), "%" + example.getCognome().toUpperCase() + "%"));

			if (StringUtils.isNotEmpty(example.getNomeArte()))
				predicates
						.add(cb.like(cb.upper(root.get("nomeArte")), "%" + example.getNomeArte().toUpperCase() + "%"));

			if (example.getDataNascita() != null)
				predicates.add(cb.greaterThanOrEqualTo(root.get("dataNascita"), example.getDataNascita()));

			return cb.and(predicates.toArray(new Predicate[predicates.size()]));
		};

		Pageable paging = null;
		if (pageSize == null || pageSize < 10)
			paging = Pageable.unpaged();
		else
			paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return repository.findAll(specificationCriteria, paging);
	}

}
