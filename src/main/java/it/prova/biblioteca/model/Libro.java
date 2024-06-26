package it.prova.biblioteca.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "libro")
public class Libro {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Column(name = "titolo")
	private String titolo;
	@Column(name = "genere")
	private Genere genere;
	@Column(name = "numero_pagine")
	private Integer numPagine;
	@Column(name = "data_pubblicazione")
	private Date dataPubblicazione;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "autore_id", nullable = false)
	private Autore autore;

	public Libro() {

	}

	public Libro(Long id, String titolo, Genere genere, int numPagine, Date dataPubblicazione, Autore autore) {
		this.id = id;
		this.titolo = titolo;
		this.genere = genere;
		this.numPagine = numPagine;
		this.dataPubblicazione = dataPubblicazione;
		this.autore = autore;
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
		if (numPagine == null) {
			// Handle the null case, for example, return a default value
			return 0; // or throw a custom exception
		}
		return numPagine.intValue();

	}

	public void setNumPagine(Integer numPagine) {
		this.numPagine = numPagine;
	}

	public Date getDataPubblicazione() {
		return dataPubblicazione;
	}

	public void setDataPubblicazione(Date dataPubblicazione) {
		this.dataPubblicazione = dataPubblicazione;
	}

	public Autore getAutore() {
		return autore;
	}

	public void setAutore(Autore autore) {
		this.autore = autore;
	}

}
