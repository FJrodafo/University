package es.iespuertodelacruz.jc.testcreatetable.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.commons.dbcp.BasicDataSource;

import es.iespuertodelacruz.jc.testcreatetable.entity.Pais;


public class PaisDAO {
	GestorConexionDDBB gc;
	public PaisDAO(GestorConexionDDBB gc) {
		this.gc = gc;
	}

    

    // Crear un nuevo país
    public Pais save(Pais pais) {
    	
        String sql = "INSERT INTO paises (nombre) VALUES (?)";
        try (
        		Connection connection = gc.getConnection();
        		PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, pais.getNombre());
            int filasAfectadas = statement.executeUpdate();
            if( filasAfectadas > 0)
            	return pais;
            else
            	return null;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return null;
    }

    // Leer un país por nombre
    public Pais findById(String nombre) {
    	
        String sql = "SELECT * FROM paises WHERE nombre = ?";
        try (   Connection connection = gc.getConnection();
        		PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, nombre);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Pais(resultSet.getString("nombre"));
                }
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return null;
    }

    // Actualizar un país
    public boolean update(Pais pais)  {

        String sql = "UPDATE paises SET nombre = ? WHERE nombre = ?";
        try (   Connection connection = gc.getConnection();
        		PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, pais.getNombre());
            statement.setString(2, pais.getNombre());
            int filasAfectadas = statement.executeUpdate();
            if(filasAfectadas > 0)
            	return true;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return false;
    }

    // Eliminar un país por nombre
    public boolean delete(String nombre)  {

        String sql = "DELETE FROM paises WHERE nombre = ?";
        try (   Connection connection = gc.getConnection();
        		PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, nombre);
            int filasAfectadas = statement.executeUpdate();
            if(filasAfectadas > 0)
            	return true;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return false;
    }

    // Obtener todos los países
    public List<Pais> findAll() {
   

        List<Pais> paises = new ArrayList<>();
        String sql = "SELECT * FROM paises";
        try (   Connection connection = gc.getConnection();
        		PreparedStatement statement = connection.prepareStatement(sql);
        		
        ) {
        	ResultSet resultSet = statement.executeQuery();
   
      
            while (resultSet.next()) {
            
                paises.add(new Pais(resultSet.getString("nombre")));
            }
            return paises;
        }catch(Exception ex) {
        	
        	return null;
        }

    }
}