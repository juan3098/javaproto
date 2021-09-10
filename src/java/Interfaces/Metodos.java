package Interfaces;

import java.util.List;
import Modelo.Clientes;

public interface Metodos {
    
    public List listar();
    public Clientes list(int codigo);
    public boolean add(Clientes cliente);
    public boolean edit(Clientes cliente);
    public boolean eliminar(int codigo);
    
}
