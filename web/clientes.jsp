<%-- 
    Document   : clientes
    Created on : 8/11/2020, 06:23:15 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="Conexion.ConexionDB" 
        import="ModeloDAO.ClientesDAO" 
        import="java.util.Iterator" 
        import="Modelo.Clientes" 
        import="java.util.List" 
        %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .titulo{
                text-align: center;
                margin: 20px 0;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif}

            .form_clientes{
                width: 250px;
                height: 350px;
                border: 1px solid black;
                background-color: rgb(92, 66, 117);
                padding-top: 10px;
                color: white;
                text-align: center;
            }

            .table_registro td{
                width: 150px;
                height: 30px;
                padding: 0 45px;
                text-align: center;
            }

            .table_clientes th{
                border: 1px solid black;
                background-color: #b0d7f1;
                padding: 3px;
            }

            .table_clientes{
                margin-top: 20px;
                border: 2px solid black;
            }

            .table_clientes tbody tr:hover{
                background-color: rgb(205, 228, 235);
            }

            .div_clientes{
                margin-left: 30px;
                border-color: black;
            }

            .btn{
                width: 65px;
                height: 30px;
                outline: none;
            }

            .mt-10{
                margin-top: 10px;
            }

            .btn-edit{
                background-color: #b2d0e0;
                border-color:#2fa4e7
            }

            .btn-del{
                background-color:#d8b39c;
                border-color:#dd5600;
            }

            .btn-buscar{
                outline: none;
                width: 150px;
                height: 25px;
            }

            .table_clientes th , tr{
                width: 140px;
                text-align: center;
            }

            .table_clientes .small{
                width: 120px;
            }

            .principal_clientes{
                display: flex;
                justify-content: center;
            }

            @media screen and (max-width: 992px){
                .titulo{
                    margin: 0;
                }
                .form_clientes{
                    font-size: 12px;
                    width: 200px;
                    margin: 20px 10px;
                }

                .table_registro td{
                    padding: 0 20px;
                }

                .table_clientes{
                    font-size: 12px;
                }
                .div_clientes{
                    margin: 20px;
                }
            }

            @media screen and (max-width: 768px){
                .titulo{
                    margin: 0;
                }
                .principal_clientes{
                    display: block;
                }
                .form_clientes{
                    font-size: 12px;
                    width: 250px;
                    margin: 20px auto;
                }
                .table_registro td{
                    padding: 0 45px;
                }
                .table_clientes{
                    font-size: 12px;
                }
                .div_clientes{
                    margin: 20px;
                }
            }

            @media screen and (max-width: 576px){
                .principal_clientes{
                    display: block;
                }
                .form_clientes{
                    font-size: 12px;
                    margin: 20px auto;
                }
                .table_clientes{
                    font-size: 12px;
                }
                .div_clientes{
                    margin: 20px;
                }
            }
        </style>
    
        <header>
            <h1 class="titulo">Clientes</h1>
        </header>
        <main class="principal_clientes">
            <aside>
                <!-- Formulario de registro de nuevos clientes-->
                <form class="form_clientes" id="agregar" action="Controller">
                    <input type="hidden" id="oculto">
                    <h2>Registrar un Cliente</h2>
                    <table class="table_registro">
                        <tr>
                            <td>Nombre</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="nombre" class="btn-buscar" autocomplete="off"></td>
                        </tr>
                        <tr>
                            <td>Direccion</td>
                        </tr>
                        <tr>
                            <td><input type="text"  name="direccion" class="btn-buscar" autocomplete="off"></td>
                        </tr>
                        <tr>
                            <td>Telefono</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="telefono" class="btn-buscar" autocomplete="off"></td>
                        </tr>
                    </table>
                    <input type="submit" class="btn btn-edit mt-10" name="accion" value="Agregar">
                </form>
            </aside>
            <!-- Tabla que se llena con el listado de clientes-->
            <!-- Boton para buscar en la lista -->
            <div class="div_clientes">
                <form>
                    <input type="search" name="buscar" id="buscar" class="btn-buscar"> 
                    <button type="submit" class="btn-buscar btn-edit">Buscar Cliente</button>
                </form>
                <table class="table_clientes">
                    <thead>
                        <tr>
                            <th class="small">Codigo</th>
                            <th>Nombre</th>
                            <th>Direccion</th>
                            <th class="small">Telefono</th>
                            <th colspan="2">Opciones</th>
                        </tr>
                    </thead>
                    
                    <%
                        ClientesDAO dao = new ClientesDAO();
                        List<Clientes>list=dao.listar();
                        Iterator<Clientes>iter = list.iterator();
                        Clientes cliente = null;
                    %>
                    
                    <tbody id="llenar" style="border: 1px solid black;">
                        
                        <% while(iter.hasNext()){
                            cliente = iter.next();
                            %>
                        <tr>
                            <td> <%= cliente.getCodigo() %> </td>
                            <td> <%= cliente.getNombre() %> </td>
                            <td> <%= cliente.getDireccion() %> </td>
                            <td> <%= cliente.getTelefono() %> </td>
                            <td> 
                                <button class="btn btn-del">Eliminar</button>
                                <button class="btn btn-edit editar">Editar</button>
                            </td>
                        </tr>
                        
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>

