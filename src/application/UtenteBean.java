package application;

import java.util.ArrayList;
import java.util.List;
import application.UtenteValutazione.Utente;
import application.UtenteValutazione.ValutazioneUtente;

public class UtenteBean {

	private Utente u = null;
	private Controller c = new Controller();	
	private String ordinamento = null;
	private List<Filtro> filtri = new ArrayList<Filtro>();
	private List<ValutazioneUtente> val = new ArrayList<ValutazioneUtente>();
	
	public UtenteBean() {}
	

	public List<String> getListaUtenti() {
		
		return c.trovaListaUtenti();
		
	}
	
	public Utente getUtente() {
		return u;
	}
	
	public void setUtente(String name) {
		
		u = c.trovaInfoUtente(name);
		val = c.trovaValutazioniUtente(name);
		u.setRecensioni(c.trovaValutazioniUtente(name));
		
	}
	
	public String getNick() {
		if(u!= null) {
			return u.getNickName();
		}
		return null;
	}

	public List<ValutazioneUtente> getListaValutazioni() {
		
		if(!filtri.isEmpty()) {	
			
			val = c.trovaValutazioniUtente(u.getNickName());
			val = c.filtraValutazioni(val,filtri);
			filtri = new ArrayList<Filtro>();
		}
		
		if(ordinamento != null) {
			val = c.ordinaValutazioni(val,ordinamento);
		}
			
			return val;
			
	}

	public String getDatiUtente() {
						
			String datiUtente = u.getSesso() +"<br>" +u.getNazionalita() +"<br>" +u.getDataNascita() + "<br>Iscritto dal :" + u.getDataIscrizione(); 			
			return datiUtente;
	
	}

	public String getOrdinamento() {
		return ordinamento;
	}

	public void setOrdinamento(String ordinamento) {
		this.ordinamento = ordinamento;
	}

	public List<Filtro> getFiltri() {
		return filtri;
	}

	public void addFiltro(Filtro filtro) {
		
		this.filtri.add(filtro);
		
	}

	public double getMediaTot() {
		return u.getMediaTot();
	}

	public double getMediaEdu() {
		return u.getMediaEducazione();
	}

	public double getMediaPul() {
		return u.getMediaPulizia();
	}

	public double getMediaDisp() {
		return u.getMediaDisponibilita();
	}
	
}
