package it.prova.biblioteca.repository.autore;

import java.util.List;

import it.prova.biblioteca.model.Autore;

public interface CustomAutoreRepository {
	List<Autore> findByExample(Autore example);
}
