package it.prova.biblioteca.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class Libro {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Column(name = "titolo")
	private String titolo;
	@Column(name = "genere")
	private Genere genere;
	@Column(name= "numero_pagine")
	private int numPagine;
	@Column(name= "data_pubblicazione")
	private LocalDate dataPubblicazione;
	Autore autore;

}
