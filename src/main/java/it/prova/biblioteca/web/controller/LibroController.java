package it.prova.biblioteca.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import it.prova.biblioteca.dto.AutoreDTO;
import it.prova.biblioteca.dto.LibroDTO;
import it.prova.biblioteca.model.Libro;
import it.prova.biblioteca.service.AutoreService;
import it.prova.biblioteca.service.LibroService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping(value = "/libro")
public class LibroController {

	@Autowired
	private LibroService libroService;

	@Autowired
	private AutoreService autoreService;

	@GetMapping
	public ModelAndView listAllLibri() {
		ModelAndView mv = new ModelAndView();
		List<Libro> libri = libroService.listAllElements();
		mv.addObject("libro_list_attribute", LibroDTO.createLibroDTOListFromModelList(libri, false));
		mv.setViewName("libro/list");
		return mv;
	}

	@GetMapping("/insert")
	public String createLibro(Model model) {
		model.addAttribute("insert_libro_attr", new LibroDTO());
		return "libro/insert";
	}

	@PostMapping("/save")
	public String saveLibro(@Valid @ModelAttribute("insert_libro_attr") LibroDTO libroDTO, BindingResult result,
			RedirectAttributes redirectAttrs, HttpServletRequest request) {
		// se fosse un entity questa operazione sarebbe inutile perche provvederebbe
		// da solo fare il binding dell'intero oggetto. Essendo un dto dobbiamo pensarci
		// noi 'a mano'. Se validazione risulta ok devo caricare l'oggetto per
		// visualizzarne nome e cognome nel campo testo
		if (libroDTO.getAutore() == null || libroDTO.getAutore().getId() == null)
			result.rejectValue("autore", "libro.autore.notnull");
		else
			libroDTO.setAutore(AutoreDTO
					.biuldAutoreDTOFromModel(autoreService.caricaSingoloElemento(libroDTO.getAutore().getId())));

		if (result.hasErrors()) {
			return "autore/insert";
		}
		libroService.inserisciNuovo(libroDTO.buildLibroModel());

		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/libro";
	}

	@GetMapping("/search")
	public String searchLibro(Model model) {
		model.addAttribute("autori_list_attribute",
				AutoreDTO.createAutoreDTOListFromModelList(autoreService.listAllElements()));
		return "libro/search";
	}

	@PostMapping("/list")
	public String listLibri(LibroDTO libroExample, ModelMap model) {
		List<Libro> libri = libroService.findByExample(libroExample.buildLibroModel());
		model.addAttribute("libro_list_attribute", LibroDTO.createLibroDTOListFromModelList(libri, false));
		return "libro/list";
	}

	@GetMapping("/show/{idLibro}")
	public String showLibro(@PathVariable(required = true) Long idLibro, Model model) {
		model.addAttribute("show_libro_attr",
				LibroDTO.biuldLibroDTOFromModel(libroService.caricaSingoloElemento(idLibro), true));
		return "libro/show";
	}

	@GetMapping("/preUpdate/{idLibro}")
	public String prepareUpdate(@PathVariable(required = true) Long idLibro, Model model) {
		model.addAttribute("toUpdate_libro_attr",
				LibroDTO.biuldLibroDTOFromModel(libroService.caricaSingoloElemento(idLibro), true));
		return "libro/update";
	}

	@PostMapping("/update")
	public String update(@Valid @ModelAttribute("toUpdate_libro_attr") LibroDTO libroDTO, BindingResult result,
			RedirectAttributes redirectAttrs, HttpServletRequest request) {

		if (libroDTO.getAutore() == null || libroDTO.getAutore().getId() == null)
			result.rejectValue("autore", "libro.autore.notnull");
		else
			libroDTO.setAutore(AutoreDTO
					.biuldAutoreDTOFromModel(autoreService.caricaSingoloElemento(libroDTO.getAutore().getId())));
		if (result.hasErrors()) {
			return "libro/update";
		}
		libroService.aggiorna(libroDTO.buildLibroModel());

		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita con successo");
		return "redirect:/libro";
	}

	@GetMapping("/preDelete/{idLibro}")
	public String prepareDelete(@PathVariable(required = true) Long idLibro, Model model) {
		model.addAttribute("toDelete_libro_attr", libroService.caricaSingoloElemento(idLibro));
		return "libro/delete";
	}

	@PostMapping("/delete")
	public String delete(@RequestParam(required = true) Long idLibro, RedirectAttributes redirectAttrs) {
		libroService.rimuovi(idLibro);
		redirectAttrs.addFlashAttribute("successMessage", "Rimozione eseguita con successo");
		return "redirect:/libro";
	}

}
