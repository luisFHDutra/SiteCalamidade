package com.calamidade.site.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "aprovaocorrencia", urlPatterns = {"/aprovaocorrencia"})
public class aprovaocorrencia extends HttpServlet {

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
            String status = request.getParameter("status");
            String email = request.getParameter("email");
            
            Boolean statusBool = !Boolean.parseBoolean(status);
            
            if (aprovarId != null) {
                data.aprovaOcorrencia(Integer.parseInt(aprovarId), statusBool);
                
//                if (statusBool) {
//                    System.out.println("Status está como: " + statusBool);
//                    JavaSendEmail.enviarEmail(email, "Status da ocorrência", "A sua ocorrência foi aprovada.");
//                }
                
                response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
