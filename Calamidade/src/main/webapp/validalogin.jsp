<%@page import="com.calamidade.site.resources.*"%>
<%
    Database data = new Database();
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");
    
    if(data.validaLogin(usuario, senha)) {
        session.setAttribute("LOGADO", "true");
    } else {
        session.removeAttribute("LOGADO");
    }
    
    response.sendRedirect("index.jsp");
%>

