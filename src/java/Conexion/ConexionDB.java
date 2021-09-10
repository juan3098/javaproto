package Conexion;
import java.sql.*;
       
public class ConexionDB {
    Connection con;
    
    public ConexionDB(){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventario", "root", "");
            
        } catch (Exception e){
            
        }
    }
    
    public Connection getConnection(){
        return con;
    }
    
}
