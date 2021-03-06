package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- Meta, title, CSS, favicons, etc. -->\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\n");
      out.write("        <title>StoryPet! | </title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap -->\n");
      out.write("        <link href=\"./vendors/bootstrap/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Font Awesome -->\n");
      out.write("        <link href=\"./vendors/font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- NProgress -->\n");
      out.write("        <link href=\"./vendors/nprogress/nprogress.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Animate.css -->\n");
      out.write("        <link href=\"./vendors/animate.css/animate.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Custom Theme Style -->\n");
      out.write("        <link href=\"./build/css/custom.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"login\">\n");
      out.write("        <div>\n");
      out.write("            <a class=\"hiddenanchor\" id=\"signup\"></a>\n");
      out.write("            <a class=\"hiddenanchor\" id=\"signin\"></a>\n");
      out.write("\n");
      out.write("            <div class=\"login_wrapper\">\n");
      out.write("                <div class=\"animate form login_form\">\n");
      out.write("                    <section class=\"login_content\">                       \n");
      out.write("                        <form action=\"Usuario\" method=\"post\" >\n");
      out.write("                            <h1>Iniciar Sesion</h1>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"text\" name=\"correo\" class=\"form-control\" placeholder=\"Correo\" value=\"ei@ei.com\" required=\"\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"password\" name=\"clave\" class=\"form-control\" value=\"123456789\" placeholder=\"Contraseña\" required=\"\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input class=\"btn btn-default submit\" type=\"submit\" name=\"accion\" value=\"ingresar\">\n");
      out.write("                                <a class=\"reset_pass\" href=\"#\">Olvidaste tu contraseña?</a>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"clearfix\"></div>\n");
      out.write("\n");
      out.write("                            <div class=\"separator\">\n");
      out.write("                                <p class=\"change_link\">New to site?\n");
      out.write("                                    <a href=\"#signup\" class=\"to_register\"> Crear Cuenta </a>\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                                <div class=\"clearfix\"></div>\n");
      out.write("                                <br />\n");
      out.write("\n");
      out.write("                                <div>\n");
      out.write("                                    <h1><i class=\"fa fa-paw\"></i> StoryPet!</h1>\n");
      out.write("                                    <p>©2019 All Rights Reserved. StoryPet! is a Bootstrap 3 template. Privacy and Terms</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </section>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div id=\"register\" class=\"animate form registration_form\">\n");
      out.write("                    <section class=\"login_content\">\n");
      out.write("                        <form action=\"Usuario\" method=\"post\" id=\"formulario\" >\n");
      out.write("                            <h1>Crear Cuenta</h1>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"cedula\" placeholder=\"Cedula\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"usuario\" placeholder=\"Usuario\"  />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"password\" class=\"form-control\" name=\"clave\" placeholder=\"Clave\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"nombres\" placeholder=\"Nombres\"  />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"apellidos\" placeholder=\"Apellidos\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" name=\"telefono\" placeholder=\"Telefono\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"email\" class=\"form-control\" name=\"correo\" placeholder=\"Correo\" />\n");
      out.write("                            </div>                         \n");
      out.write("                            <div>\n");
      out.write("                                <input type=\"hidden\" name=\"rol\" value=\"usuario\">                             \n");
      out.write("                            </div>                         \n");
      out.write("                            <div>\n");
      out.write("                                <button class=\"btn btn-default submit\" id=\"btnRegistrar\" type=\"submit\" >Registar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("\n");
      out.write("                        <div class=\"separator\">\n");
      out.write("                            <p class=\"change_link\">Already a member ?\n");
      out.write("                                <a href=\"#signin\" class=\"to_register\"> Iniciar Sesion </a>\n");
      out.write("                            </p>\n");
      out.write("                            <div class=\"clearfix\"></div>\n");
      out.write("                            <br />\n");
      out.write("\n");
      out.write("                            <div>\n");
      out.write("                                <h1><i class=\"fa fa-paw\"></i> StoryPet!</h1>\n");
      out.write("                                <p>©2016 All Rights Reserved. StoryPet! is a Bootstrap 3 template. Privacy and Terms</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </section>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Validaciones -->        \n");
      out.write("        <script src=\"js/jquery.validate.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/messages_es.js.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("\n");
      out.write("            $(\"#formulario\").submit(function () {\n");
      out.write("                return false\n");
      out.write("            })\n");
      out.write("\n");
      out.write("            $(\"#btnRegistrar\").click(function () {\n");
      out.write("                let formulario = $(\"form\").serialize()\n");
      out.write("                $(\"#formulario\").submit()\n");
      out.write("                $(\"#formulario\").validate({\n");
      out.write("                    rules: {\n");
      out.write("                        cedula: {\n");
      out.write("                            required: true,\n");
      out.write("                            number: true,\n");
      out.write("                            rangelength: [9, 10],\n");
      out.write("                        },\n");
      out.write("                        usuario: {\n");
      out.write("                            required: true,\n");
      out.write("                        },\n");
      out.write("                        clave: {\n");
      out.write("                            required: true,\n");
      out.write("                            pasword: true,\n");
      out.write("                        },\n");
      out.write("                        nombres: {\n");
      out.write("                            required: true,\n");
      out.write("                        },\n");
      out.write("                        apellidos: {\n");
      out.write("                            required: true,\n");
      out.write("                        },\n");
      out.write("                        telefono: {\n");
      out.write("                            required: true,\n");
      out.write("                            number: true,\n");
      out.write("                            rangelength: [7, 10],\n");
      out.write("                        },\n");
      out.write("                        correo: {\n");
      out.write("                            required: true,\n");
      out.write("                            email: true,\n");
      out.write("                        },\n");
      out.write("                    },\n");
      out.write("                    messages: {\n");
      out.write("                        Cedula: {\n");
      out.write("                            required: \"Campo obligatorio\",\n");
      out.write("                            number: \"Campo númerico\",\n");
      out.write("                            rangelength: \"Debe estar entre 1 a 10 dígitos\"\n");
      out.write("                        },\n");
      out.write("                        Telefono: {\n");
      out.write("                            required: \"Campo obligatorio\",\n");
      out.write("                            number: \"Campo númerico\",\n");
      out.write("                            rangelength: \"Debe estar entre 7 a 10 números\"\n");
      out.write("                        }\n");
      out.write("                    },\n");
      out.write("                    submitHandler: function () {\n");
      out.write("                        $.ajax({\n");
      out.write("                            url: 'Usuario',\n");
      out.write("                            method: 'POST',\n");
      out.write("                            data: {'accion': 'Registrar', 'datos': formulario},\n");
      out.write("                            success: function () {\n");
      out.write("                                alert(\"Usuario Registrado\")\n");
      out.write("                                // $(\"#contenido_principal\").html(respuesta)\n");
      out.write("                            },\n");
      out.write("                            error: function () {\n");
      out.write("                                alert(\"Usuario No Registrado\");\n");
      out.write("                            }\n");
      out.write("                        })\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                })\n");
      out.write("\n");
      out.write("            })\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        ");

            if (request.getParameter("cerrar") != null) {
                HttpSession sesion = request.getSession();
                sesion.invalidate();
                response.sendRedirect("login.jsp");
            } else {

            }
        
      out.write("\n");
      out.write("\n");
      out.write("        ");
 if (request.getAttribute("error") != null) {
      out.write("\n");
      out.write("        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("        ");
} else {
      out.write("\n");
      out.write("        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${exito}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
