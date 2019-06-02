
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="VO.UsuarioVO"%>

<script src="js/datatables.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" ></script>
<script src="js/messages_es.js.js"></script>

<h1 class="text-center">Consultar Clientes.</h1><br>
<a class="add-proj brd-rd5" href="#" data-toggle="modal" data-target=".bs-example-modal-sm" title="Add Project">+ Agregar</a>
<br>
<br>

<%
    Conexion conexion = new Conexion();
    Statement puente;
    ResultSet rs;
    puente = conexion.obtenerConexion().createStatement();
    rs = puente.executeQuery("select idUsuario,Usuario,Nombres,Apellidos,Telefono,Correo,Rol from usuarios where Rol = 'cliente' and Estado=1;");
%>


<form action="Usuario" method="POST">
    <table id="datatable-keytable" class="table table-striped table-bordered" style="width: 100%;">
        <thead>
            <tr>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">C�dula</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Usuario</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Nombres</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Apellidos</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Telefono</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Correo</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Rol</td>
                <td style="border 1px;border-bottom-color: #007bff;" class="text-center">Acciones</td>
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
                <td class="text-center">
                    <a class="btn btn-warning btnEditarU" data-id="<%=rs.getString("idUsuario")%>">Editar</a>
                    <a class="btn btn-danger" id="btnEliminarU" data-id="<%=rs.getString("idUsuario")%>">Eliminar</a>
                    <a class="btn btn-primary" href="Usuario?accion=Estado&id=<%=rs.getString("idUsuario")%>&Estado=0">Ocultar</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</form>


<!-- Modal -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="text-center"> Registrar Usuario</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="Usuario" method="POST" class="text-center" id="formRegistrarUsuario">
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
                    <input id="btnRegistrar" class="btn btn-outline-primary" type="submit" name="accion" value="Registrar">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>

    $('#datatable-keytable').DataTable({
        language: {
            "decimal": "",
            "emptyTable": "No hay informaci�n",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Entradas",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },
    });

    $(document).ready(function () {

        $("#formRegistrarUsuario").submit(function () {
            return false
        })

        $("#btnRegistrar").click(function () {
            let formulario = $("form").serialize()
            $("#formRegistrarUsuario").submit()
            $("#formRegistrarUsuario").validate({
                rules: {
                    cedula: {
                        required: true,
                        number: true,
                        rangelength: [1, 10],
                    },
                    usuario: {
                        required: true,
                    },
                    clave: {
                        required: true,
                        number: true,
                    },
                    nombre: {
                        required: true,
                    },
                    apellidos: {
                        required: true,
                    },
                    telefono: {
                        required: true,
                        number: true,
                        rangelength: [7, 10],
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
                                number: "Campo n�merico",
                                rangelength: "Debe estar entre 1 a 10 d�gitos",
                            },
                    telefono:
                            {
                                required: "Campo obligatorio",
                                number: "Campo n�merico",
                                rangelength: "Debe estar entre 7 a 10 n�meros",
                            },
                },
                submitHandler: function () {
                    $.ajax({
                        url: 'Usuario',
                        method: 'POST',
                        data: {'accion': 'Registrar', 'datos': formulario},
                        success: function () {
                            alert("Usuario Registrado")
                            // $("#contenido_principal").html(respuesta)
                        },
                        error: function () {
                            alert("Usuario No Registrado");
                        }
                    })
                }

            })
        })
    });


</script>


<%if (request.getAttribute("error") != null) {%>
${error}
<%} else {%>
${exito}
<%}%> 
