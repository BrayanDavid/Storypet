<%-- 
    Document   : ConsultarHistorial
    Created on : 19/03/2019, 10:00:50 PM
    Author     : Daniel
--%>

<%@page import="DAO.UsuarioDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.ServicioDAO"%>
<%@page import="VO.ServiciosVo"%>
<%@page import="DAO.MascotasDAO"%>
<%@page import="VO.MascotasVO"%>
<%@page import="VO.HistorialVo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.HistorialDao"%>
<%@page session="true"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Historial</title>
        <!-- Bootstrap -->
        <link href="./vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="./vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="./vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="./vendors/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Datatables -->
        <link href="./vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="./vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="./vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="./vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="./vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="./build/css/custom.min.css" rel="stylesheet">
    </head>
    <body>

        <h1 class="text-center">Consultar Historial</h1>
        <%
            HttpSession miSesion = request.getSession();
            String cedula;

            Conexion conexion = new Conexion();
            Statement puente;
            ResultSet rs;
            puente = conexion.obtenerConexion().createStatement();
            rs = puente.executeQuery("SELECT historialclinico.idHistorialClinico,historialclinico.Fecha,historialclinico.Novedad,servicios.Servicio,mascotas.Nombre,usuarios.Nombres FROM servicios INNER JOIN historialclinico on servicios.idServicio=historialclinico.FKServicio INNER JOIN mascotas ON historialclinico.FKMascota=mascotas.idMascota INNER JOIN usuarios ON mascotas.FKUsuario=usuarios.idUsuario ;");
        %>
        <div class="container buscar">
            <a class="btn btn-outline-success" data-toggle="modal" data-target="#myModal">Registrar</a>
            <form class="form">
                <input class="form-control" type="text" id="txtbuscar" placeholder=" ID" name="txtbuscar"/>
                <input class="btn btn" type="submit" value="Buscar" onclick="validar()"/>
            </form>   
            <%
                String nombrebuscar = request.getParameter("txtbuscar");
                if (nombrebuscar != null) {
                    puente = conexion.obtenerConexion().createStatement();
                    rs = puente.executeQuery("SELECT historialclinico.idHistorialClinico,historialclinico.Fecha,historialclinico.Novedad,servicios.Servicio,mascotas.Nombre,usuarios.Nombres FROM servicios INNER JOIN historialclinico on servicios.idServicio=historialclinico.FKServicio INNER JOIN mascotas ON historialclinico.FKMascota=mascotas.idMascota where historialclinico.Mascota LIKE '%" + nombrebuscar + "%'");
                } else if (nombrebuscar == "") {
            %>
            <script type="text/javascript">

                function validar() {
                    var texto = document.getElementById("txtbuscar");
                    if (texto.length == 0) {
                        alert("Usuario no encontrado");
                    }
                }
            </script>
            <%
                }
            %>

        </div>

        <div class="container">
            <form action="Historial">
                <br>
                <table id="datatable-keytable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <td class="text-center">ID</td>
                            <td class="text-center">Fecha</td>
                            <td class="text-center">Novedad</td>
                            <td class="text-center">Servicio</td>
                            <td class="text-center">Mascota</td>  
                            <td class="text-center">Usuario</td>  
                            <td class="text-center">Acciones</td>
                        </tr>               

                    </thead>

                    <%
                        while (rs.next()) {
                    %>
                    <tbody>
                        <tr>
                            <td class="text-center"><%= rs.getString("historialclinico.idHistorialClinico")%></td>                       
                            <td class="text-center"><%= rs.getString("historialclinico.Fecha")%></td>                       
                            <td class="text-center"><%= rs.getString("historialclinico.Novedad")%></td>                       
                            <td class="text-center"><%= rs.getString("servicios.Servicio")%></td>
                            <td class="text-center"><%= rs.getString("mascotas.Nombre")%></td>
                            <td class="text-center"><%= rs.getString("usuarios.Nombres")%></td>
                            <td class="text-center">
                                <a class="btn btn-warning" href ="Historial?accion=editar&id=<%= rs.getString("historialclinico.idHistorialClinico")%>">Editar</a>
                                <a class="btn btn-danger" href="Historial?accion=eliminar&id=<%= rs.getString("historialclinico.idHistorialClinico")%>">Eliminar</a>
                            </td>
                        </tr>
                    </tbody>
                    <%
                        }
                    %> 
                </table>
                <a class="btn btn-success" href="list.jsp">Volver</a>
            </form>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="text-center"> Registrar Historial</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="Historial" class="text-center" id="formRegistrarHistorial">
                            <label>Fecha</label><br>
                            <input type="text" id="inFecha" readonly name="fecha" ><br><br>
                            <label>Novedad</label><br>
                            <textarea class="form-control" placeholder="Novedad" name="novedad" ></textarea><br>
                            <label>Servicio</label><br>
                            <select name="servicio">
                                <option>Seleccione...</option>
                                <%
                                    ServiciosVo serviciosVo = new ServiciosVo();
                                    ServicioDAO servicioDAO = new ServicioDAO();
                                    List<ServiciosVo> ListarServicio = servicioDAO.Listar();
                                    for (int i = 0; i < ListarServicio.size(); i++) {
                                        serviciosVo = ListarServicio.get(i);

                                %>

                                <option value="<%=serviciosVo.getTipoServicio()%>"><%=serviciosVo.getTipoServicio()%></option>
                                <%}
                                %>
                            </select>


                            <br> 
                            <label>Mascota</label><br>
                            <select name="mascota">
                                <option>Seleccione...</option>
                                <%
                                    MascotasVO mascotasVo = new MascotasVO();
                                    MascotasDAO mascotasDAO = new MascotasDAO();
                                    List<MascotasVO> Lis = mascotasDAO.Listar();
                                    for (int i = 0; i < Lis.size(); i++) {
                                        mascotasVo = Lis.get(i);

                                %>
                                <option value="<%=mascotasVo.getNombre()%> "><%=mascotasVo.getNombre()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <br>
                            <label>Usuario</label><br>
                            <select name="usuario">
                                <option>Seleccione...</option>
                                <%
                                    UsuarioVO usuarioVO = new UsuarioVO();
                                    UsuarioDAO usuarioDAO = new UsuarioDAO();
                                    List<UsuarioVO> Lista = usuarioDAO.Listar();
                                    for (int i = 0; i < Lista.size(); i++) {
                                        usuarioVO = Lista.get(i);

                                %>
                                <option value="<%=usuarioVO.getNombres()%>"><%=usuarioVO.getNombres()%></option>

                                <%
                                    }
                                %>
                            </select>
                            <br> <br>    
                            <input class="btn btn-outline-primary" type="submit" name="accion" value="Registrar">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <%if (request.getAttribute("error") != null) {%>
        ${error}
        <%} else {%>
        ${exito}
        <%}%> 

        <script>

            $(document).ready(function () {
                var f = new Date();
                var fecha = f.getFullYear() + "/" + (f.getMonth() + 1) + "/" + f.getDate();
                document.getElementById("inFecha").value = fecha;
            });

        </script>

        <!-- jQuery -->
        <script src="./vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="./vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="./vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="./vendors/nprogress/nprogress.js"></script>
        <!-- iCheck -->
        <script src="./vendors/iCheck/icheck.min.js"></script>
        <!-- Datatables -->
        <script src="./vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="./vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="./vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="./vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="./vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="./vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="./vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="./vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="./vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="./vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="./vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="./vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <script src="./vendors/jszip/dist/jszip.min.js"></script>
        <script src="./vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="./vendors/pdfmake/build/vfs_fonts.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="./build/js/custom.min.js"></script>


    </body>
</html>
