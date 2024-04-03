package es.iespuertodelacruz.jc.testcreatetable;

import java.sql.SQLException;
import java.util.List;

import es.iespuertodelacruz.jc.testcreatetable.dao.GestorConexionDDBB;
import es.iespuertodelacruz.jc.testcreatetable.dao.MunicipioDAO;
import es.iespuertodelacruz.jc.testcreatetable.dao.PaisDAO;
import es.iespuertodelacruz.jc.testcreatetable.dao.ProvinciaDAO;
import es.iespuertodelacruz.jc.testcreatetable.entity.Pais;

public class Main {
	
	public static void main(String args[]) {
		
        GestorConexionDDBB gc = new GestorConexionDDBB("regiones", "root", "1q2w3e4r");
        MunicipioDAO municipioDAO = new MunicipioDAO(gc);
     
        ProvinciaDAO provinciaDAO = new ProvinciaDAO(gc);
     
		PaisDAO paisDAO = new PaisDAO(gc);
		
		
		List<Pais> findAll = paisDAO.findAll();
		
		for (Pais pais : findAll) {
			System.out.println(pais.getNombre());
		}
		
	}
	


}
