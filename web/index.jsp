<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="css/inicio.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    
<style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.principal{
    display: flex;
    background-color: #FFF3E0;
}

.panel{
    width: 200px;
    height: 88vh;
    margin: 0;
    background-color:#2e2e2e;
}

.panel li{
    padding: 10px 20px;
    display: flex;
}

.panel li:hover{
    background-color: rgb(31, 30, 30);
}

.panel ul li a{
    text-decoration: none;
    color: white;
    padding: 5px 180px 5px 15px;
}

.container{
    width: 1200px;
    overflow-y: scroll;
}

.image{
    width: 300px;
    height: 300px;
}

.list{
    width: 30px;
    height: 30px;
}

@media screen and (max-width: 992px){
    .cabecera{
        height: 13vh;
        font-size: 13px;
    }
    .panel{
        height: 87vh;
    }
}

@media screen and (max-width: 768px){
    .cabecera{
        height: 120px;
        font-size: 13px;
    }
    nav a:last-child{
        margin-right: 0;
    }
    .principal{
        display: block;
    }
    .panel{
        width: 100vw;
        height: 300px;
    }
    .container{
        width: 100vw;
    }
}

@media screen and (max-width: 576px){
    .cabecera{
        height: 120px;
        font-size: 13px;
    }
    nav a:last-child{
        margin-right: 0;
    }
    .principal{
        display: block;
    }
    .panel{
        width: 100vw;
        height: 300px;
    }
    .container{
        width: 100vw;
    }
}



</style>
<script>
    
function abrir(url,contenedor){
    $.get(url,{},function (data){
        $("#" + contenedor).html(data);
    });
}

</script>
    

    <jsp:include page="header.jsp" flush="true"/>
    
    <!-- Menu de opciones lateral -->
    <main class="principal">
        <nav class="panel">
            <ul>
                <li> 
                    <img src="img/client.svg" class="list"><a href="#" onclick="abrir('Controller?accion=lista','contenedor_principal');">Clientes</a>
                </li>    
            </ul>
        </nav>
    
        <!-- Contenedor que se llenara un vez se le de click a las opciones de la lista-->
        <div class="container" id="contenedor_principal">
            
        </div>
    </main>
</body>
</html>
