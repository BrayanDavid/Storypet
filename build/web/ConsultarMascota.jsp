<%-- 
    Document   : ConsultarMascota
    Created on : 05-may-2019, 14:19:55
    Author     : Brayan
--%>

<%@page import="DAO.EspeciesDAO"%>
<%@page import="VO.EspeciesVO"%>
<%@page import="DAO.RazasDAO"%>
<%@page import="VO.RazasVO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consultar Mascota</title>

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
<style>
    label.error{
        color: red;
    }
</style>
<script src="js/jquery.validate.js"></script>
<script src="js/messages_es.js.js"></script>

<div class="container">
    <h1 class="text-center">Lista Mascotas.!</h1><br>
    <a class="add-proj brd-rd5" href="#" data-toggle="modal" data-target=".bs-example-modal-sm" title="Add Project">+</a>
    <%
        Conexion conexion = new Conexion();
        Statement puente;
        ResultSet rs;
        puente = conexion.obtenerConexion().createStatement();
        rs = puente.executeQuery("SELECT idMascota, mascotas.Nombre, FechaNacimiento, Sexo, razas.Nombre, FKUsuario FROM mascotas INNER JOIN razas ON mascotas.FKRaza = razas.idRaza;");
    %>

    <br>
    <form action="Mascota">
        <table id="datatable-keytable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">ID</td>
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Nombre</td>
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Fecha</td>
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Sexo</td>
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Raza</td>
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Usuario</td>                      
                    <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Acciones</td>                      
                </tr>   
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getString("idMascota")%></td>
                    <td class="text-center"><%= rs.getString("mascotas.Nombre")%></td>
                    <td class="text-center"><%= rs.getString("FechaNacimiento")%></td>                        
                    <td class="text-center"><%= rs.getString("Sexo")%></td>                        
                    <td class="text-center"><%= rs.getString("razas.Nombre")%></td>                        
                    <td class="text-center"><%= rs.getString("FKUsuario")%></td>             
                    <td>
                        <a class="btn btn-warning" href="Mascota?accion=Editar&id=<%= rs.getString("idMascota")%>">Editar</a>
                        <a class="btn btn-danger" href="Mascota?accion=Eliminar&id=<%= rs.getString("idMascota")%>">Eliminar</a>
                        <a class="btn btn-primary" href="Mascota?accion=Estado&id=<%= rs.getString("idMascota")%>&Estado=0">Ocultar</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="Mascota?accion=Listar" class="btn btn-primary">Volver</a>
    </form>
</div>

<!-- Modal -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="text-center"> Registrar Mascota</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="Mascota" class="text-center" id="formRegistrarMascota">
                    <label>Nombre</label><br>            
                    <input class="bordes" type="text" name="nombre" style="width: 174px;height: 34px;" placeholder=" Nombre" required="true"><br> 
                    <label>Fecha Nacimiento</label><br>
                    <input class="bordes" type="date" name="fechaNacimiento"style="width: 174px;height: 34px;" required="true"><br> 
                    <label>Sexo</label><br>
                    <select class="bordes" name="sexo"style="width: 174px;height: 34px;" required="true">
                        <option>Seleccione...</option>
                        <option>M</option>
                        <option>F</option>
                    </select><br> 
                    <label>Especie</label><br>
                    <select class="bordes" name="especie" style="width: 174px;height: 34px;" required="true">
                        <option>Seleccione...</option>
                        <%
                            EspeciesVO especiesVO = new EspeciesVO();
                            EspeciesDAO especiesDAO = new EspeciesDAO();

                            List<EspeciesVO> Listar = especiesDAO.Listar();
                            for (int i = 0; i < Listar.size(); i++) {
                                especiesVO = Listar.get(i);

                        %>

                        <option value="<%= especiesVO.getIdEspecie()%>"><%= especiesVO.getNombre()%></option>

                        <%

                            }
                        %>
                    </select><br>

                    <label>Raza</label><br>
                    <select class="bordes" name="idRaza" style="width: 174px;height: 34px;" required="true">
                        <option>Seleccione...</option>
                        <%
                            RazasVO razasVO = new RazasVO();
                            RazasDAO razasDAO = new RazasDAO();
                            List<RazasVO> List = razasDAO.Listar();
                            for (int i = 0; i < List.size(); i++) {
                                razasVO = List.get(i);
                        %>

                        <option value="<%= razasVO.getIdRaza()%>"> <%=razasVO.getNombre()%></option>

                        <%
                            }
                        %>
                    </select><br>
                    <label>Usuario</label><br>
                    <input class="bordes" type="number" name="idUsuario"style="width: 174px;height: 34px;" required="true">
                    <br><br>
                    <input type="submit" id="btnRegistrar" name="accion" value="Registrar" class="btn btn-outline-primary">                                               
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<script>

    $("#btnRegistrar").ready(function () {
        $("#formRegistrarMascota").validate({
            rules: {
                nombre: {
                    required: true,
                },
                fechaNacimiento: {
                    required: true,
                },
                sexo: {
                    required: true,
                },
                especie: {
                    required: true,
                },
                idRaza: {
                    required: true,
                },
                idUsuario: {
                    required: true,
                }
            }

        })

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


<%if (request.getAttribute("error") != null) {%>
${error}
<%} else {%>
${exito}
<%}%> 
