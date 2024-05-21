package it.prova.biblioteca.repository.libro;

import java.util.List;

import it.prova.biblioteca.model.Libro;

public interface CustomLibroRepository {
	public List<Libro> findByExample(Libro example);

}
