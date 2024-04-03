package es.iespuertodelacruz.jc.testcreatetable.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import es.iespuertodelacruz.jc.testcreatetable.entity.Pais;
import es.iespuertodelacruz.jc.testcreatetable.entity.Provincia;

public class ProvinciaDAO {
    private GestorConexionDDBB gc;

    public ProvinciaDAO(GestorConexionDDBB gc) {
        this.gc = gc;
    }

    // Crear una nueva provincia
    public Provincia save(Provincia provincia)  {
        String sql = "INSERT INTO provincias (nombre, pais_nombre) VALUES (?, ?)";
        Integer idGenerado = null;
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ) {
            statement.setString(1, provincia.getNombre());
            statement.setString(2, provincia.getPaisNombre().getNombre());
            statement.executeUpdate();
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    idGenerado = generatedKeys.getInt(1); // Obtener el ID generado
                    provincia.setId(idGenerado);
                }
            }
        }catch(Exception ex) {
        	//ex.printStackTrace();
        }
        if(idGenerado != null) {
        	return provincia;
        }else
        	return null;
       
    }

    // Leer una provincia por ID
    public Provincia findById(int id)  {
        String sql = "SELECT * FROM provincias WHERE id = ?";
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String paisNombre = resultSet.getString("pais_nombre");
                    Pais pais = new Pais(paisNombre); // Supongamos que tienes una clase Pais
                    return new Provincia(id, nombre, pais);
                }
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return null;
    }

    // Actualizar una provincia
    public boolean update(Provincia provincia) {
        String sql = "UPDATE provincias SET nombre = ?, pais_nombre = ? WHERE id = ?";
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, provincia.getNombre());
            statement.setString(2, provincia.getPaisNombre().getNombre());
            statement.setInt(3, provincia.getId());
            int rows = statement.executeUpdate();
            if(rows > 0)
            	return true;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return false;
    }

    // Eliminar una provincia por ID
    public boolean delete(int id)  {
        String sql = "DELETE FROM provincias WHERE id = ?";
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, id);
            int rows = statement.executeUpdate();
            if( rows > 0)
            	return true;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
        return false;
    }

    // Obtener todas las provincias
    public List<Provincia> findAll() {
        List<Provincia> provincias = new ArrayList<>();
        String sql = "SELECT * FROM provincias";
        try (
            Connection connection = gc.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                int provinciaId = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String paisNombre = resultSet.getString("pais_nombre");
                Pais pais = new Pais(paisNombre); 
                provincias.add(new Provincia(provinciaId, nombre, pais));
            }
        }catch(Exception ex) {
        	return null;
        }
        return provincias;
    }
}