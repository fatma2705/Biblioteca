package it.prova.biblioteca.repository.autore;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import it.prova.biblioteca.model.Autore;

public interface AutoreRepository
		extends PagingAndSortingRepository<Autore, Long>, JpaSpecificationExecutor<Autore>, CustomAutoreRepository, CrudRepository<Autore, Long> {

	@Query("select a from Autore a left join fetch a.libri where a.id = ?1")
	public Autore findByidEager(Long id);

}
