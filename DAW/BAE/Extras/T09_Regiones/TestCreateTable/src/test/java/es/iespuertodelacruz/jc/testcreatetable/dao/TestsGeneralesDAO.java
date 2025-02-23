package es.iespuertodelacruz.jc.testcreatetable.dao;



import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import es.iespuertodelacruz.jc.testcreatetable.entity.Municipio;
import es.iespuertodelacruz.jc.testcreatetable.entity.Pais;
import es.iespuertodelacruz.jc.testcreatetable.entity.Provincia;

public class TestsGeneralesDAO {
	 private GestorConexionDDBB gc;
	    private MunicipioDAO municipioDAO;
	    private ProvinciaDAO provinciaDAO;
	    private PaisDAO paisDAO;

	    @BeforeEach
	    public void setUp() {
	        // Configura tu conexión a la base de datos aquí (gc, municipioDAO, provinciaDAO)
	       
	        gc = new GestorConexionDDBB("regiones", "root", "1q2w3e4r");
	        municipioDAO = new MunicipioDAO(gc);
	        provinciaDAO = new ProvinciaDAO(gc);
	        paisDAO = new PaisDAO(gc);
	    }
	    
	    


	    @Test
	    public void testProvincia() throws SQLException {
	        // Crear una provincia ficticia para asociar al municipio
	        Provincia provincia = new Provincia();
	        provincia.setNombre("Las Palmas");
	        Pais spain = new Pais("España");
	        provincia.setPais(spain);
	        Provincia save = provinciaDAO.save(provincia);
	        
	        assertNotNull(save);
	        
	        assertTrue(save.getNombre().equals(provincia.getNombre()));
	        assertTrue(save.getId() > 0);
	        
	        Provincia findById = provinciaDAO.findById(save.getId());
	        
	        assertNotNull(findById);
	        assertTrue(findById.getNombre().equals(provincia.getNombre()));
	        assertTrue(findById.getPais().getNombre().equals(spain.getNombre()));
	        
	        
	        List<Provincia> findAll = provinciaDAO.findAll();
	        
	        assertNotNull(findAll);
	        assertTrue(findAll.size() > 0);
	        
	        Provincia encontrada = findAll.stream()
	        	.filter(p->p.getId() == save.getId())
	        	.findFirst()
	        	.orElse(null);
	        
	        assertNotNull(encontrada);
	        assertTrue(encontrada.getNombre().equals(save.getNombre()));
	        assertTrue(encontrada.getPais().getNombre().equals(save.getPais().getNombre()));
	        
	        Provincia modificada = save;
	        modificada.setNombre("Ravenna");
	        Pais italia = new Pais("Italia");
	        modificada.setPais(italia);
	        boolean okModificada = provinciaDAO.update(modificada);
	        assertTrue(okModificada);
	        
	        Provincia findModificada = provinciaDAO.findById(modificada.getId());
	        assertTrue(findModificada.getNombre().equals(modificada.getNombre()));
	        assertTrue(findModificada.getPais().getNombre().equals(modificada.getPais().getNombre()));
	        
	        boolean delete = provinciaDAO.delete(save.getId());
	        assertTrue(delete);
	        
	        findById = provinciaDAO.findById(modificada.getId());
	        assertNull(findById);
	        
	    
	    }

	    @Test
	    public void testPais() throws SQLException {
	        
	        Pais eslovenia = new Pais("Eslovenia");
	        
	        Pais save = paisDAO.save(eslovenia);
	        
	        assertNotNull(save);
	        
	        assertTrue(save.getNombre().equals(eslovenia.getNombre()));
	        
	        
	        Pais findById = paisDAO.findById(save.getNombre());
	        
	        assertNotNull(findById);
	        assertTrue(findById.getNombre().equals(eslovenia.getNombre()));
	     
	        
	        
	        List<Pais> findAll = paisDAO.findAll();
	        
	        assertNotNull(findAll);
	        assertTrue(findAll.size() > 0);
	        
	        Pais encontrada = findAll.stream()
	        	.filter(p->p.getNombre().equals(eslovenia.getNombre() ) )
	        	.findFirst()
	        	.orElse(null);
	        
	        assertNotNull(encontrada);
	        assertTrue(encontrada.getNombre().equals(save.getNombre()));
	        
	        
	        
	        boolean delete = paisDAO.delete(eslovenia.getNombre());
	        assertTrue(delete);
	        
	        findById = paisDAO.findById(eslovenia.getNombre());
	        assertNull(findById);
	        
	    
	    }
	    
	    
	    
	    @Test
	    public void testMunicipio() throws SQLException {
	        // Crear una provincia ficticia para asociar al municipio
	        Provincia provincia = new Provincia();
	        provincia.setNombre("Madrid");
	        provincia.setId(1);
	        Pais spain = new Pais("España");
	        provincia.setPais(spain);
	        
	        Municipio municipio = new Municipio();
	        municipio.setNombre("Parla");
	        municipio.setProvincia(provincia);
	        
	        Municipio save = municipioDAO.save(municipio);
	        
	        assertNotNull(save);
	        
	        assertTrue(save.getNombre().equals(municipio.getNombre()));
	        assertTrue(save.getId() > 0);
	        
	        Municipio findById = municipioDAO.findById(municipio.getId());
	        assertTrue(municipio.getNombre().equals(findById.getNombre()));
	        assertTrue(findById.getProvincia().getNombre().equals(municipio.getProvincia().getNombre()));
	        
	      
	        
	        List<Municipio> findAll = municipioDAO.findAll();
	        
	        assertNotNull(findAll);
	        assertTrue(findAll.size() > 0);
	        
	        Municipio encontrada = findAll.stream()
	        	.filter(p->p.getId() == save.getId())
	        	.findFirst()
	        	.orElse(null);
	        
	        assertNotNull(encontrada);
	        assertTrue(encontrada.getNombre().equals(save.getNombre()));
	        assertTrue(encontrada.getProvincia().getNombre().equals(save.getProvincia().getNombre()));
	        
	        Municipio modificada = save;
	        modificada.setNombre("Chantilly");
	        Provincia pitalia = new Provincia();
	        pitalia.setId(2);
	        pitalia.setNombre("París");
	        Pais italia = new Pais("Italia");
	        pitalia.setPais(italia);
	        
	        modificada.setProvincia(pitalia);
	        boolean okModificada = municipioDAO.update(modificada);
	        assertTrue(okModificada);
	        
	        Municipio findModificada = municipioDAO.findById(modificada.getId());
	        assertTrue(findModificada.getNombre().equals(modificada.getNombre()));
	        assertTrue(findModificada.getProvincia().getNombre().equals(modificada.getProvincia().getNombre()));
	        
	        boolean delete = municipioDAO.delete(save.getId());
	        assertTrue(delete);
	        
	        findById = municipioDAO.findById(modificada.getId());
	        assertNull(findById);
	        
	    
	    }


}
