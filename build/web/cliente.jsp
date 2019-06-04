<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>StoryPet! | </title>

        <!-- Datatables -->
        <link href="./vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="./vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="./vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="./vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="./vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="./vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- bootstrap-progressbar -->
        <link href="./vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
        <!-- bootstrap-daterangepicker -->
        <link href="./vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <!-- Tabla -->
        <script src="js/datatables.js" type="text/javascript"></script>
        <!-- Custom Theme Style -->
        <link href="./build/css/custom.min.css" rel="stylesheet">

        <script src="js/jquery.validate.js"></script>
        <script src="js/messages_es.js.js"></script>

    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>StoryPet!</span></a>
                        </div>

                        <div class="clearfix"></div>
                        <%
                            //recojemos sesion.
                            HttpSession sesion = request.getSession();
                            //creamos variables                            
                            String usuario;
                            String nombre;
                            String apellido;
                            String telefono;
                            String correo;
                            String rol;

                            // guardamos variables traidas de la session.
                            usuario = sesion.getAttribute("Usuario").toString();
                            nombre = sesion.getAttribute("Nombres").toString();
                            apellido = sesion.getAttribute("Apellidos").toString();
                            telefono = sesion.getAttribute("Telefono").toString();
                            correo = sesion.getAttribute("Correo").toString();
                            rol = sesion.getAttribute("Rol").toString();

                            //validamos correo
                            if (sesion.getAttribute("Correo") != null) {
                        %>
                        <!-- menu profile quick info -->
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Bienvenido,</span>
                                <h2><%= nombre%></h2>
                            </div>
                        </div>
                        <%
                            } else {
                                out.print("<script>alert('inicie sesion');</script>");
                                out.print("<script>location.replace('index.jsp');</script>");
                            }
                        %>
                        <!-- /menu profile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>General</h3>
                                <ul class="nav side-menu">
                                    <li><a><i class="fa fa-home"></i> Inicio <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a id="btnMascotas" >Mascota</a></li>  <!-- Mascotas admin2 -->
                                            <li><a id="btnHistorial">Historial</a></li>  <!-- Historia index -->
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="form.html">General Formularios</a></li>
                                            <li><a href="form_advanced.html">Avance Componentes</a></li>
                                            <li><a href="form_validation.html">Formulario Validacion</a></li>
                                            <li><a href="form_wizards.html">Form Wizard</a></li>
                                            <li><a href="form_upload.html">Form Upload</a></li>
                                            <li><a href="form_buttons.html">Form Botones</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="general_elements.html">Elementos Generales</a></li>
                                            <li><a href="media_gallery.html">Media Galeria</a></li>
                                            <li><a href="typography.html">Tipografias</a></li>
                                            <li><a href="icons.html">Iconos</a></li>
                                            <li><a href="glyphicons.html">Glyphicons</a></li>
                                            <li><a href="widgets.html">Widgets</a></li>
                                            <li><a href="invoice.html">Invoice</a></li>
                                            <li><a href="inbox.html">Inbox</a></li>
                                            <li><a href="calendar.html">Calendario</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="tables.html">Tablas</a></li>
                                            <li><a href="tables_dynamic.html">Tablas Dinamicas</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="chartjs.html">Chart JS</a></li>
                                            <li><a href="chartjs2.html">Chart JS2</a></li>
                                            <li><a href="morisjs.html">Moris JS</a></li>
                                            <li><a href="echarts.html">ECharts</a></li>
                                            <li><a href="other_charts.html">Other Charts</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                                            <li><a href="fixed_footer.html">Fixed Footer</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="menu_section">
                                <h3>Live On</h3>
                                <ul class="nav side-menu">
                                    <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="e_commerce.html">E-commerce</a></li>
                                            <li><a href="projects.html">Proyecto</a></li>
                                            <li><a href="project_detail.html">Project Detail</a></li>
                                            <li><a href="contacts.html">Contactps</a></li>
                                            <li><a href="profile.html">Perfil</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="page_403.html">403 Error</a></li>
                                            <li><a href="page_404.html">404 Error</a></li>
                                            <li><a href="page_500.html">500 Error</a></li>
                                            <li><a href="plain_page.html">Plain Pagina</a></li>
                                            <li><a href="login.html">Login Pagina</a></li>
                                            <li><a href="pricing_tables.html">Pricing Tables</a></li>
                                        </ul>
                                    </li>
                                    <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="#level1_1">Level One</a>
                                            <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                                                <ul class="nav child_menu">
                                                    <li class="sub_menu"><a href="level2.html">Level Two</a>
                                                    </li>
                                                    <li><a href="#level2_1">Level Two</a>
                                                    </li>
                                                    <li><a href="#level2_2">Level Two</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a href="#level1_2">Level One</a>
                                            </li>
                                        </ul>
                                    </li>                  
                                    <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                                </ul>
                            </div>

                        </div>
                        <!-- /sidebar menu -->

                        <!-- /menu footer buttons -->
                        <div class="sidebar-footer hidden-small">
                            <a data-toggle="tooltip" data-placement="top" title="Settings">
                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Lock">
                                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            </a>
                        </div>
                        <!-- /menu footer buttons -->
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav>
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>

                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <img src="images/img.jpg" alt=""><%= nombre%>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                                        <li><a id="btnPerfil"> Perfil</a></li>
                                        <li>
                                            <a href="javascript:;">
                                                <span class="badge bg-red pull-right">50%</span>
                                                <span>Configuracion</span>
                                            </a>
                                        </li>
                                        <li><a href="javascript:;">Ayuda</a></li>

                                        <li>
                                            <%
                                                out.print("<a class='btn-danger' href='login.jsp?cerrar=true'><i class='fa fa-sign-out pull-right'></i> Salir</a>");
                                            %> 
                                        </li>
                                    </ul>
                                </li>

                                <li role="presentation" class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-envelope-o"></i>
                                        <span class="badge bg-green">6</span>
                                    </a>
                                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a>
                                                <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="text-center">
                                                <a>
                                                    <strong>See All Alerts</strong>
                                                    <i class="fa fa-angle-right"></i>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <!-- top tiles -->
                    <div class="row tile_count">
                        <div class="row top_tiles" style="margin: 10px 0;">
                            <div id="contenido_principal">
                            </div>   
                        </div>
                        <!-- /top tiles -->
                    </div>
                    <!-- /page content -->

                    <!-- footer content -->
                    <footer>
                        <div class="pull-right">
                            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
                        </div>
                    </footer>
                    <!-- /footer content -->
                </div>
            </div>


            <!-- Custom Theme Scripts -->
            <script src="./build/js/custom.min.js"></script>

            <!-- jQuery -->
            <script src="./vendors/jquery/dist/jquery.min.js"></script>
            <!-- Bootstrap -->
            <script src="./vendors/bootstrap/dist/js/bootstrap.min.js"></script>
            <!-- FastClick -->
            <script src="./vendors/fastclick/lib/fastclick.js"></script>
            <!-- NProgress -->
            <script src="./vendors/nprogress/nprogress.js"></script>
            <!-- Chart.js -->
            <script src="./vendors/Chart.js/dist/Chart.min.js"></script>
            <!-- jQuery Sparklines -->
            <script src="./vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
            <!-- morris.js -->
            <script src="./vendors/raphael/raphael.min.js"></script>
            <script src="./vendors/morris.js/morris.min.js"></script>
            <!-- gauge.js -->
            <script src="./vendors/gauge.js/dist/gauge.min.js"></script>
            <!-- bootstrap-progressbar -->
            <script src="./vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
            <!-- Skycons -->
            <script src="./vendors/skycons/skycons.js"></script>
            <!-- Flot -->
            <script src="./vendors/Flot/jquery.flot.js"></script>
            <script src="./vendors/Flot/jquery.flot.pie.js"></script>
            <script src="./vendors/Flot/jquery.flot.time.js"></script>
            <script src="./vendors/Flot/jquery.flot.stack.js"></script>
            <script src="./vendors/Flot/jquery.flot.resize.js"></script>
            <!-- Flot plugins -->
            <script src="./vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
            <script src="./vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
            <script src="./vendors/flot.curvedlines/curvedLines.js"></script>
            <!-- DateJS -->
            <script src="./vendors/DateJS/build/date.js"></script>
            <!-- bootstrap-daterangepicker -->
            <script src="./vendors/moment/min/moment.min.js"></script>
            <script src="./vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

            <!-- Custom Theme Scripts -->
            <script src="./build/js/custom.min.js"></script>

            <script>

                function activarEditarEliminarMascota() {
                    //              $("#btnEditarM").click(function () {
                    //                  alert("editarMascota")
                    //                 var id = $(this).attr("data-id")
                    //                 $.ajax({
                    //                     url: 'Mascota',
                    //                      method: 'POST',
                    //                      data: {'accion': 'Editar', 'id': id},
                    //                      success: function (respuesta) {
                    //                         $("#contenido_principal").html(respuesta)
                    //                         activarEditarEliminarMascota()
                    //                     },
                    //                      error: function () {
                    //                          alert("Error al editar")
                    //                       }
                    //                  })
                    //             })

                    $("#btnEliminarM").click(function () {
                        alert("eliminarrMascota")
                        var id = $(this).attr("data-id")
                        $.ajax({
                            url: 'Mascota',
                            method: 'POST',
                            data: {'accion': 'Eliminar', 'id': id},
                            succes: function (respuesta) {
                                $("#contenido_principal").html(respuesta)
                                activarEditarEliminarMascota()
                            },
                            error: function () {
                                alert("Error al eliminar")
                            }
                        })
                    })

                }

                function activarEditarEliminarHistorial() {
                    $("#btnEditarH").click(function () {
                        alert("editar historial")
                        var id = $(this).attr("data-id")
                        $.ajax({
                            url: 'Historial',
                            method: 'POST',
                            data: {'accion': 'editar', 'id': id},
                            success: function (respuesta) {
                                $("#contenido_principal").html(respuesta)
                                activarEditarEliminarUsuario()
                            },
                            error: function () {
                                alert("No se ha podido editar")
                            }
                        })
                    })

                    $(".btnEliminarH").click(function () {
                        alert("eliminarHistorial")
                        var id = $(this).attr("data-id")
                        $.ajax({
                            url: 'Historial',
                            method: 'POST',
                            data: {'accion': 'Eliminar', 'id': id},
                            success: function (respuesta) {
                                $("#contenido_principal").html(respuesta)
                                activarEditarEliminarMascota()
                            },
                            error: function () {
                                alert("Error al eliminar")
                            }
                        })
                    })

                }

                $(document).ready(function () {
                    activarEditarEliminarMascota()
                    activarEditarEliminarHistorial()


                    $.ajax({
                        url: 'Mascota',
                        method: 'POST',
                        data: {'accion': 'ListarMascotaUsuario'},
                        success: function (respuesta) {
                            $("#contenido_principal").html(respuesta)
                            activarEditarEliminarMascota()
                        },
                        error: function () {
                            alert("No se ha podido obtener la información")
                        }
                    })


                    $("#btnHistorial").click(function () {
                        $.ajax({
                            url: 'Historial',
                            method: 'POST',
                            data: {'accion': 'ListarHistorialUsuario'},
                            success: function (respuesta) {
                                $("#contenido_principal").html(respuesta)
                                activarEditarEliminarHistorial()
                            },
                            error: function () {
                                alert("No se ha podido obtener la información")
                            }
                        })

                    })

                    //Mascota Funcion
                    $("#btnMascotas").click(function () {
                        $.ajax({
                            url: 'Mascota',
                            method: 'POST',
                            data: {'accion': 'ListarMascotaUsuario'},
                            success: function (respuesta) {
                                $("#contenido_principal").html(respuesta)
                                activarEditarEliminarMascota()
                            },
                            error: function () {
                                alert("No se ha podido obtener la información")
                            }
                        })
                    })

                    $("#btnPerfil").click(function () {
                        $.ajax({
                            url: 'Usuario',
                            method: 'POST',
                            data: {'accion': 'perfil'},
                            success: function (respuesta) {
                                $("#contenido_principal").html(respuesta)
                            },
                            error: function () {
                                alert("No se ha podido obtener la información")
                            }
                        })
                    })

                })
            </script>

            <%if (request.getAttribute("error") != null) {%>
            ${error}
            <%} else {%>
            ${exito}
            <%}%> 
    </body>
</html>