package application;

import java.util.ArrayList;
import java.util.List;
import application.UtenteValutazione.Utente;
import application.UtenteValutazione.UtenteDao;
import application.UtenteValutazione.ValutazioneUtente;
import application.UtenteValutazione.ValutazioneUtenteDao;

public class Controller {

    private UtenteDao ud = UtenteDao.getInstance();
    private ValutazioneUtenteDao vd = new ValutazioneUtenteDao(); 
    private ApplicaFiltro f = new ApplicaFiltro();
    
    public Controller() {}

    public List<String> trovaListaUtenti(){
    	
    	return ud.trovaListaUtenti();  	
    	
    }
    
    public Utente trovaInfoUtente(String nickname) {
    	
    	return ud.trovaInfoUtente(nickname);
    	
    }
    
    public ArrayList<ValutazioneUtente> trovaValutazioniUtente(String nickname){
    	 	
    	ArrayList<ValutazioneUtente> val = vd.trovaValutazionePerRecensito(nickname);
    	
    	return val;
    	
    }
    
    public List<ValutazioneUtente> filtraValutazioni(List<ValutazioneUtente> val, List<Filtro> filtri){

    	if(val == null || val.isEmpty()) {
    		return val;
    	}
    	
    	return f.filterUserEvaluations(val, filtri);
    	
    }
    
    public List<ValutazioneUtente> ordinaValutazioni(List<ValutazioneUtente> val, String ordinamento){
    	
    	if(val == null || val.isEmpty()) {
    		return val;
    	}
    	return f.sortUserEvaluations(val,ordinamento);
    }
	
}
