package it.prova.biblioteca.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "autore")
public class Autore {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Column(name = "nome")
	private String nome;
	@Column(name = "cognome")
	private String cognome;
	@Column(name = "nome_arte")
	private String nomeArte;
	@Column(name = "data_nascita")
	private String dataNascita;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "autore")
	private Set<Libro> libri = new HashSet<>();

	public Autore() {

	}

	public Autore(Long id, String nome, String cognome, String nomeArte, String dataNascita) {
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

	public String getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(String dataNascita) {
		this.dataNascita = dataNascita;
	}

	public Set<Libro> getLibri() {
		return libri;
	}

	public void setLibri(Set<Libro> libri) {
		this.libri = libri;
	}

}
