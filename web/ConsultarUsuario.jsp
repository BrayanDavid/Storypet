<%-- 
    Document   : ConsultarUsuario
    Created on : 1/04/2019, 08:29:04 PM
    Author     : Admin
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar clientes</title>
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

    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Lista Clientes.</h1><br>
            <%
                Conexion conexion = new Conexion();
                Statement puente;
                ResultSet rs;
                puente = conexion.obtenerConexion().createStatement();
                rs = puente.executeQuery("select idUsuario,Usuario,Nombres,Apellidos,Telefono,Correo,Rol from usuarios where Rol = 'cliente' and Estado=1;");
            %>

            <br>
            <form action="Usuario">
                <table id="datatable-keytable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Cédula</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Usuario</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Nombres</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Apellidos</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Telefono</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Correo</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Rol</td>
                            <td style="border 1px;border-bottom-color: #007bff;" class="text-center tdEspacio">Acciones</td>
                        </tr>                    
                    </thead>
                    <tbody>
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getString("idUsuario")%></td>
                            <td class="text-center"><%= rs.getString("Usuario")%></td>
                            <td class="text-center"><%= rs.getString("Nombres")%></td>
                            <td class="text-center"><%= rs.getString("Apellidos")%></td>
                            <td class="text-center"><%= rs.getString("Telefono")%></td>
                            <td class="text-center"><%= rs.getString("Correo")%></td>
                            <td class="text-center"><%= rs.getString("Rol")%></td>
                            <td>
                                <a class="btn btn-warning"  href="Usuario?accion=Editar&id=<%=rs.getString("idUsuario")%>">Editar</a>
                                <a id="btnEliminar"  class="btn btn-danger"  href="Usuario?accion=Eliminar&id=<%=rs.getString("idUsuario")%>">Eliminar</a>
                                <a class="btn btn-primary" href="Usuario?accion=Estado&id=<%=rs.getString("idUsuario")%>&Estado=0">Ocultar</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <a href="Usuario?accion=Listar" class="btn btn-primary">Volver</a>   
                <button id="btnSA_3" type="button" class="btn btn-outline-warning" >Confirmación</button>
                <button id="btnSA_2" type="button" class="btn btn-outline-info">Alertas</button>
            </form>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="text-center"> Registrate</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="Usuario" class="text-center" id="formRegistrarUsuario">
                            <input style="width: 49%;height: 34px;"name="cedula" id="cedula" class="required" placeholder=" Cedula" type="text">
                            <input style="width: 49%;height: 34px;"name="usuario" id="usuario" class="required" placeholder=" Usuario" type="text"><br><br>
                            <input style="width: 49%;height: 34px;"name="clave" id="clave" class="required" placeholder=" Clave" type="password">
                            <input style="width: 49%;height: 34px;" name="nombres" id="nombres" class="required" placeholder=" Nombres" type="text"><br><br>
                            <input style="width: 49%;height: 34px;" name="apellidos" id="apellidos" class="required" placeholder=" Apellidos" type="text">
                            <input style="width: 49%;height: 34px;" name="telefono" id="telefono" class="required" placeholder=" Telefono" type="text"><br><br>
                            <input style="width: 49%;height: 34px;"  name="correo" id="correo" class="required email" placeholder=" Correo" type="email">
                            <select name="rol" style="width: 48%;height: 34px;"><br>
                                <option value="null"> Seleccione...</option>
                                <option value="cliente"> Usuario</option>                                                            
                            </select><br><br>
                            <input type="submit" id="btnRegistrar" name="accion" value="Registrar" class="btn btn-outline-primary">                                               
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

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

        
        <script>

                    $("#btnEliminar").click(function () {
                        swal("Advertencia", "...desea eliminar", "warning");
                    });

                    //       $("#btnEliminar").click(function () {
                    //         swal({
                    //           title: "¿Está seguro?",
                    //         text: "Una vez eliminado, no podrá recuperar este archivo!",
                    //       icon: "warning",
                    //     buttons: true,
                    //           dangerMode: true,
                    //           })
                    //                 .then((willDelete) => {
                    //                   if (willDelete) {
                    //                     swal("El archivo ha sido eliminado!", {
                    //                       icon: "success",
                    //                 });
                    //           } else {
                    //             swal("Operación cancelada!");
                    //           }
                    //                     });
                    //       });

                    $("#btnSA_2").click(function () {
                        swal("Advertencia", "...texto de advertencia", "warning");
                    });

                    $("#btnSA_3").click(function () {
                        swal({
                            title: "¿Está seguro?",
                            text: "Una vez eliminado, no podrá recuperar este archivo!",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                                .then((willDelete) => {
                                    if (willDelete) {
                                        swal("El archivo ha sido eliminado!", {
                                            icon: "success",
                                        });
                                    } else {
                                        swal("Operación cancelada!");
                                    }
                                });
                    });


                    $(document).ready(function ()
                    {
                        $("#formRegistrarUsuario").validate({
                            rules: {
                                cedula: {
                                    required: true,
                                    number: true,
                                    rangelength: [1, 10]
                                },
                                usuario: {
                                    required: true
                                },
                                clave: {
                                    required: true,
                                    pasword: true,
                                },
                                nombre: {
                                    required: true
                                },
                                apellidos: {
                                    required: true
                                },
                                telefono: {
                                    required: true,
                                    number: true,
                                    rangelength: [7, 10]
                                },
                                correo: {
                                    required: true,
                                    email: true,
                                },

                            },
                            messages: {
                                cedula:
                                        {
                                            required: "Campo obligatorio",
                                            number: "Campo númerico",
                                            rangelength: "Debe estar entre 1 a 10 dígitos"
                                        },
                                telefono:
                                        {
                                            required: "Campo obligatorio",
                                            number: "Campo númerico",
                                            rangelength: "Debe estar entre 7 a 10 números"
                                        },
                            },
                        });
                    });

        </script>

        <%if (request.getAttribute("error") != null) {%>
        ${error}
        <%} else {%>
        ${exito}
        <%}%> 

    </body>
</html>
