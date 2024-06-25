<%@ page import="java.sql.*" %>
<%@ page import="com.calamidade.site.resources.*" %>
<%@ page contentType="application/json" pageEncoding="UTF-8" %>

<%
    // Configurações de cabeçalho CORS
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");

    Database data = new Database();
    ResultSet rs = data.execConsulta("SELECT latitude, longitude FROM ocorrencia WHERE status_aprovacao = true");

    // Construção do JSON de resposta
    StringBuilder pointsJson = new StringBuilder("[");
    boolean first = true;
    while(rs.next()) {
        if (!first) {
            pointsJson.append(",");
        } else {
            first = false;
        }
        pointsJson.append("{ \"lat\": ").append(rs.getDouble("latitude")).append(", \"lng\": ").append(rs.getDouble("longitude")).append(" }");
    }
    pointsJson.append("]");
    
    // Envio da resposta JSON
    out.print(pointsJson.toString());
%>
