package es.iespuertodelacruz.jc.testcreatetable.dao;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import es.iespuertodelacruz.jc.testcreatetable.entity.Municipio;
import es.iespuertodelacruz.jc.testcreatetable.entity.Pais;
import es.iespuertodelacruz.jc.testcreatetable.entity.Provincia;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CreateTableTests {
	private GestorConexionDDBB gc;
	private MunicipioDAO municipioDAO;
	private ProvinciaDAO provinciaDAO;
	private PaisDAO paisDAO;

	@BeforeEach
	public void setUp() {

		gc = new GestorConexionDDBB("regiones", "root", "1q2w3e4r");
		municipioDAO = new MunicipioDAO(gc);
		provinciaDAO = new ProvinciaDAO(gc);
		paisDAO = new PaisDAO(gc);
	}

	@Test()
	@Order(1)
	void testCreateTablePaisAndNotDuplicates_15_de_100() {
		Pais eslovenia = new Pais("Eslovenia");

		Pais save = paisDAO.save(eslovenia);

		assertNotNull(save);

		// no debe permitir un segundo guardado
		Pais save2 = paisDAO.save(eslovenia);
		assertNull(save2);
		
		boolean delete = paisDAO.delete(eslovenia.getNombre());
		assertTrue(delete);

	}
	
	@Test()
	@Order(2)
	void testPrimaryKeyNombreTablePais_30_de_100(){

		String tableName = "paises";
		String columnName = "nombre";

		boolean esPrimary = primaryKey(tableName,columnName);

		assertTrue(esPrimary);
	}

	@Test()
	@Order(3)
	void testCreateTableProvinciasAutoincrementAndPrimary_45_de_100() {
		Pais pais = new Pais("Venezuela");
		paisDAO.save(pais);
		Provincia provincia = new Provincia();
		provincia.setNombre("Palo Negro");
		provincia.setPais(pais);
		Provincia save = provinciaDAO.save(provincia);
		assertNotNull(save);
		
		//si autoincrement el id será mayor que cero
		assertTrue(save.getId() > 0 );
		
		boolean isPrimary = primaryKey("provincias", "id");
		assertTrue(isPrimary);
		
		provinciaDAO.delete(provincia.getId());
		paisDAO.delete(pais.getNombre());
	}
	

	
	
	@Test()
	@Order(4)
	void testProvinciasForeignPais_60_de_100() {
		Pais pais = new Pais("Libia");
		//no guardamos el país. No existirá para la foreign key
		//paisDAO.save(pais);
		Provincia provincia = new Provincia();
		provincia.setNombre("Tripoli");
		provincia.setPais(pais);
		
		//no debe permitir guardado por la foreign key
		Provincia save = provinciaDAO.save(provincia);
		assertNull(save);
		
		
	}
	
	

	@Test()
	@Order(5)
	void testProvinciasUniqueNombre_75_de_100() {
		Pais pais = new Pais("Venezuela");
		paisDAO.save(pais);
		Provincia provincia = new Provincia();
		provincia.setNombre("Palo Negro");
		provincia.setPais(pais);
		Provincia save = provinciaDAO.save(provincia);
		assertNotNull(save);
		
		
		//si hay restricción unique no permitirá guardar una segunda vez
		Provincia save2 = provinciaDAO.save(provincia);
		assertNull(save2);
		
		
		
		boolean delete = provinciaDAO.delete(provincia.getId());
		boolean delete2 = paisDAO.delete(pais.getNombre());
	}
	
	
	
	
	@Test()
	@Order(6)
	void testCreateTableMunicipiosAutoincrementPrimaryAndUniqueNombreProvincia_100_de_100() {
		Pais pais = new Pais("Chile");
		paisDAO.save(pais);
		Provincia provincia = new Provincia();
		provincia.setNombre("Santiago");
		provincia.setPais(pais);
		Provincia save = provinciaDAO.save(provincia);
		assertNotNull(save);
		
		Municipio municipio = new Municipio();
		municipio.setNombre("Puebla");
		municipio.setProvincia(provincia);
		
		Municipio saveMunicipio = municipioDAO.save(municipio);
		assertNotNull(saveMunicipio);
		
		//si autoincrement el id será mayor que cero
		assertTrue(saveMunicipio.getId() > 0 );
		
		boolean isPrimary = primaryKey("municipios", "id");
		assertTrue(isPrimary);
		
		//no debe guardar mismo municipio con misma provincia
		Municipio saveMunicipio2 = municipioDAO.save(municipio);
		assertNull(saveMunicipio2);
		
		
		//debe permitir guardar municipio con mismo nombre si provincia distinta
		Provincia provincia2 = new Provincia();
		provincia2.setNombre("Cuyo");
		provincia2.setPais(pais);
		Provincia save2 = provinciaDAO.save(provincia2);
		assertNotNull(save2);
		Municipio municipio3 = new Municipio();
		municipio3.setNombre("Puebla");
		municipio3.setProvincia(provincia2);
		Municipio saveMunicipio3 = municipioDAO.save(municipio3);
		assertNotNull(saveMunicipio3);

		
		municipioDAO.delete(saveMunicipio3.getId());
		provinciaDAO.delete(provincia2.getId());
		paisDAO.delete(pais.getNombre());
		
		municipioDAO.delete(saveMunicipio.getId());
		provinciaDAO.delete(provincia.getId());
		paisDAO.delete(pais.getNombre());
	}
	
	private boolean primaryKey(String tableName, String columnName) {
		
		String query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = ? AND COLUMN_NAME = ? AND CONSTRAINT_NAME = 'PRIMARY'";

		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/regiones", "root", "1q2w3e4r");
		     PreparedStatement preparedStatement = connection.prepareStatement(query)) {

		    preparedStatement.setString(1, tableName);
		    preparedStatement.setString(2, columnName);

		    try (ResultSet resultSet = preparedStatement.executeQuery()) {
		        if (resultSet.next()) {
		        	return true;
		            
		        } 
		    }
		} catch (SQLException e) {
		    //e.printStackTrace();
		}
		return false;
	}

}
