package it.prova.biblioteca.service;

import java.util.List;

import org.springframework.data.domain.Page;

import it.prova.biblioteca.model.Autore;

public interface AutoreService {

	public List<Autore> listAllElements();

	public Autore caricaSingoloElemento(Long id);

	public Autore caricaSingoloElementoConLibri(Long id);

	public void aggiorna(Autore autoreInstance);

	public void inserisciNuovo(Autore autoreInstance);

	public void rimuovi(Long idToDelete);

	public List<Autore> findByExample(Autore example);

	public Page<Autore> findByExampleWithPagination(Autore example, Integer pageNo, Integer pageSize, String sortBy);

}
