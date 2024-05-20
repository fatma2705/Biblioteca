package it.prova.biblioteca.dto;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import it.prova.biblioteca.model.Genere;
import it.prova.biblioteca.model.Libro;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class LibroDTO {

	private Long id;

	@NotBlank(message = "{libro.titolo.notblank}")
	@Size(min = 4, max = 40, message = "Il valore inserito '${validatedValue}' deve essere lungo tra {min} e {max} caratteri")
	private String titolo;

	@NotNull(message = "{libro.genere.notnull}")
	private Genere genere;

	@NotNull(message = "{libro.numPagine.notnull}")
	private Integer numPagine;

	@NotNull(message = "{libro.dataPubblicazione.notnull}")
	private LocalDate dataPubblicazione;

	@NotNull(message = "{libro.autore.notnull}")
	private AutoreDTO autore;

	public LibroDTO() {

	}

	public LibroDTO(Long id, String titolo, Genere genere, Integer numPagine, LocalDate dataPubblicazione,
			AutoreDTO autore) {
		this.id = id;
		this.titolo = titolo;
		this.genere = genere;
		this.numPagine = numPagine;
		this.dataPubblicazione = dataPubblicazione;
		this.autore = autore;
	}

	public LibroDTO(Long id, String titolo, Genere genere, Integer numPagine, LocalDate dataPubblicazione) {
		this.id = id;
		this.titolo = titolo;
		this.genere = genere;
		this.numPagine = numPagine;
		this.dataPubblicazione = dataPubblicazione;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public Genere getGenere() {
		return genere;
	}

	public void setGenere(Genere genere) {
		this.genere = genere;
	}

	public Integer getNumPagine() {
		return numPagine;
	}

	public void setNumPagine(Integer numPagine) {
		this.numPagine = numPagine;
	}

	public LocalDate getDataPubblicazione() {
		return dataPubblicazione;
	}

	public void setDataPubblicazione(LocalDate dataPubblicazione) {
		this.dataPubblicazione = dataPubblicazione;
	}

	public AutoreDTO getAutore() {
		return autore;
	}

	public void setAutore(AutoreDTO autore) {
		this.autore = autore;
	}

	public Libro buildLibroModel() {
		return new Libro(this.id, this.titolo, this.genere, this.numPagine, this.dataPubblicazione,
				this.autore.buildAutoreModel());
	}

	public static LibroDTO biuldLibroDTOFromModel(Libro libroModel, boolean includeAutore) {
		LibroDTO result = new LibroDTO(libroModel.getId(), libroModel.getTitolo(), libroModel.getGenere(),
				libroModel.getNumPagine(), libroModel.getDataPubblicazione());
		if (includeAutore)
			result.setAutore(AutoreDTO.biuldAutoreDTOFromModel(libroModel.getAutore()));
		return result;
	}

	public static List<LibroDTO> createLibroDTOListFromModelList(List<Libro> modelListInput, boolean includeAutore) {
		return modelListInput.stream().map(libroEntity -> {
			return LibroDTO.biuldLibroDTOFromModel(libroEntity, includeAutore);
		}).collect(Collectors.toList());
	}

}
