package it.prova.biblioteca.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import it.prova.biblioteca.model.Libro;
import it.prova.biblioteca.repository.libro.LibroRepository;

public class LibroServiceImpl implements LibroService {

	@Autowired
	private LibroRepository repository;

	@Transactional(readOnly = true)
	public List<Libro> listAllElements() {
		return (List<Libro>) repository.findAll();
	}

	@Transactional(readOnly = true)
	public Libro caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Transactional(readOnly = true)
	public Libro caricaSingoloElementoEager(Long id) {
		return repository.findSingleLibroEager(id);
	}

	@Transactional
	public void aggiorna(Libro libroInstance) {
		repository.save(libroInstance);
	}

	@Transactional
	public void inserisciNuovo(Libro libroInstance) {
		repository.save(libroInstance);
	}

	@Transactional
	public void rimuovi(Long id) {
		repository.deleteById(id);
	}

	@Transactional(readOnly = true)
	public List<Libro> findByExample(Libro example) {
		return repository.findByExample(example);
	}

}
