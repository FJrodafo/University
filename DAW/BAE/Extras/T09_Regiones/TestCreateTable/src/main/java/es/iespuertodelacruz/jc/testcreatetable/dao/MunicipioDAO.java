package es.iespuertodelacruz.jc.testcreatetable.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import es.iespuertodelacruz.jc.testcreatetable.entity.Municipio;
import es.iespuertodelacruz.jc.testcreatetable.entity.Provincia;

public class MunicipioDAO {

	GestorConexionDDBB gc;
	public MunicipioDAO(GestorConexionDDBB gc) {
		this.gc = gc;
	}
	
	 // Crear un nuevo municipio
    public Municipio save(Municipio municipio)  {
        String sql = "INSERT INTO municipios (nombre, provincia_id) VALUES (?, ?)";
        Integer idGenerado = null;
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS)
        ) {
            statement.setString(1, municipio.getNombre());
            statement.setInt(2, municipio.getProvinciaId().getId());
            statement.executeUpdate();
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    idGenerado = generatedKeys.getInt(1); // Obtener el ID generado
                    municipio.setId(idGenerado);
                }
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        if(idGenerado != null) {
        	return municipio;
        }else
        	return null;
    }

    // Leer un municipio por ID
    public Municipio findById(int id)  {
        String sql = "SELECT * FROM municipios WHERE id = ?";
        
        Municipio municipio = null;
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    int provinciaId = resultSet.getInt("provincia_id");
                    ProvinciaDAO provinciaDAO = new ProvinciaDAO(gc);
                    
                    Provincia provincia = provinciaDAO.findById(provinciaId);
                    municipio =  new Municipio(id, nombre, provincia);
                }
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return municipio;
    }

    // Actualizar un municipio
    public boolean update(Municipio municipio)  {
        String sql = "UPDATE municipios SET nombre = ?, provincia_id = ? WHERE id = ?";
        int rows = 0;
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, municipio.getNombre());
            statement.setInt(2, municipio.getProvincia().getId());
            statement.setInt(3, municipio.getId());
            rows = statement.executeUpdate();
            
            
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return rows > 0;
    }

    // Eliminar un municipio por ID
    public boolean delete(int id)  {
    	int rows = 0;
        String sql = "DELETE FROM municipios WHERE id = ?";
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, id);
            rows = statement.executeUpdate();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return rows > 0;
    }

    // Obtener todos los municipios
    public List<Municipio> findAll()  {
        List<Municipio> municipios = new ArrayList<>();
        String sql = "SELECT * FROM municipios";
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                int municipioId = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                int provinciaId = resultSet.getInt("provincia_id");
                ProvinciaDAO provinciaDAO = new ProvinciaDAO(gc);
                
                Provincia provincia = provinciaDAO.findById(provinciaId);
                Municipio municipio =  new Municipio(municipioId, nombre, provincia);
                municipios.add(municipio);
            }
        }catch(Exception ex) {
        	municipios =  null;
        }
        return municipios;
    }	
    
	
}
