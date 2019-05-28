<%-- 
    Document   : ActualizarHistorial
    Created on : 20/03/2019, 01:24:54 PM
    Author     : Daniel
--%>


<%@page import="VO.HistorialVo"%>
<%@page import="DAO.HistorialDao"%>
<%@page import="DAO.HistorialDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
        <title>StoryPet</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

        <title>Actualizar Historial</title>
    </head>
    <body>
        <div class="container text-center">
            <h1 class="text-center">Actualizar Historial</h1>
            <form class="form form-control" action="Historial">

                <%
                    HistorialDao HistorialDao = new HistorialDao();
                    int id = Integer.parseInt((String) request.getAttribute("idHisto"));
                    HistorialVo HistVo = (HistorialVo) HistorialDao.List(id);

                %>

                <label>Novedad:</label><br>
                <input class="inputGroupContainer" type="text" name="Novedad" value="<%=HistVo.getNovedad()%>"><br>             

                <label>Servicio:</label><br>
                <input type="text" name="IdServicio" value="<%=HistVo.getFKServicio()%>"><br>

                <input type="hidden" name="id" value="<%= HistVo.getIdHistorialClinico()%>"><br>

                <input class="btn btn-success" type="submit" name="accion" value="Actualizar"> <br><br>

                <a class="btn btn-warning" href="Historial?accion=listar">Consultar Historial</a>

            </form> 
        </div>
        <%if (request.getAttribute("error") != null) {%>
        ${error}
        <%} else {%>
        ${exito}
        <%}%> 
    </body>
</html>
