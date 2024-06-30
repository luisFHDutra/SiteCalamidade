package com.calamidade.site.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "emabertoocorrencia", urlPatterns = {"/emabertoocorrencia"})
public class emabertoocorrencia extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Database data = new Database();

        try {
            String aprovarId = request.getParameter("aprovar");
            String emaberto = request.getParameter("emaberto");
            
            if (aprovarId != null) {
                data.emAbertoOcorrencia(Integer.parseInt(aprovarId), !Boolean.parseBoolean(emaberto));
                response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
