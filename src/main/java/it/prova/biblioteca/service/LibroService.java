package it.prova.biblioteca.service;

import java.util.List;

import it.prova.biblioteca.model.Libro;

public interface LibroService {

	public List<Libro> listAllElements();

	public Libro caricaSingoloElemento(Long id);

	public Libro caricaSingoloElementoEager(Long id);

	public void aggiorna(Libro libroInstance);

	public void inserisciNuovo(Libro libroInstance);

	public void rimuovi(Long id);

	public List<Libro> findByExample(Libro example);

}
