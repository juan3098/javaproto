/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Conexion.ConexionDB;
import Interfaces.Metodos;
import Modelo.Clientes;
import java.util.*;
import java.sql.*;

public class ClientesDAO implements Metodos{
    
    ConexionDB cn = new ConexionDB();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Clientes cl = new Clientes();
    
    @Override
    public List listar() {
        
        ArrayList<Clientes>list = new ArrayList<>(); 
        String sql = "SELECT * FROM clientes";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Clientes cliente = new Clientes();
                
                cliente.setCodigo(rs.getInt("codigo"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                
                list.add(cliente);
            }
            
        } catch (Exception e) {
        
        }
        return list;
    }

    @Override
    public Clientes list(int codigo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Clientes cliente) {
        String insert = "insert into clientes (nombre,direccion,telefono) "
                + "values ('"+cliente.getNombre()+"', '"+cliente.getDireccion()+"', '"+cliente.getTelefono()+"' )";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(insert);
            ps.executeUpdate();
        } catch (Exception e){
        }
        return false;
    }

    @Override
    public boolean edit(Clientes cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int codigo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
