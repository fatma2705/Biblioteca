package it.prova.biblioteca.dto;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import it.prova.biblioteca.model.Autore;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class AutoreDTO {

	private Long id;

	@NotBlank(message = "{autore.nome.notblank}")
	private String nome;

	@NotBlank(message = "{autore.cognome.notblank}")
	private String cognome;

	@NotBlank(message = "{autore.nomeArte.notblank}")
	@Size(min = 3, max = 15, message = "Il valore inserito '${validatedValue}' deve essere lungo tra {min} e {max} caratteri")
	private String nomeArte;

	@NotNull(message = "{autore.dataNascita.notnull")
	private LocalDate dataNascita;

	public AutoreDTO() {

	}

	public AutoreDTO(Long id, String nome, String cognome, String nomeArte, LocalDate dataNascita) {
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.nomeArte = nomeArte;
		this.dataNascita = dataNascita;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getNomeArte() {
		return nomeArte;
	}

	public void setNomeArte(String nomeArte) {
		this.nomeArte = nomeArte;
	}

	public LocalDate getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(LocalDate dataNascita) {
		this.dataNascita = dataNascita;
	}

	public Autore buildAutoreModel() {
		return new Autore(this.id, this.nome, this.cognome, this.nomeArte, this.dataNascita);
	}

	public static AutoreDTO biuldAutoreDTOFromModel(Autore autoreModel) {
		return new AutoreDTO(autoreModel.getId(), autoreModel.getNome(), autoreModel.getCognome(),
				autoreModel.getNomeArte(), autoreModel.getDataNascita());
	}

	public static List<AutoreDTO> createAutoreDTOListFromModelList(List<Autore> modelListInput) {
		return modelListInput.stream().map(autoreEntity -> {
			return AutoreDTO.biuldAutoreDTOFromModel(autoreEntity);
		}).collect(Collectors.toList());
	}

}
