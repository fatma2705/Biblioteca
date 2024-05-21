package it.prova.biblioteca.repository.libro;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import it.prova.biblioteca.model.Libro;

public interface LibroRepository extends CrudRepository<Libro, Long>, CustomLibroRepository {

	@Query("from Libro l join fetch l.autore where l.id = ?1")
	Libro findSingleLibroEager(Long id);

}
