package com.calamidade.site.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "processaocorrencia", urlPatterns = {"/processaocorrencia"})
public class processaocorrencia extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Database data = new Database();

        try {
            String alterarId = request.getParameter("id");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String datetime = request.getParameter("datetime");
            String titulo = request.getParameter("titulo");
            String resumo = request.getParameter("resumo");
            String status = request.getParameter("status");
            String local = request.getParameter("local");

            String excluirId = request.getParameter("excluir");
            if (excluirId != null) {
//                data.excluirUsuario(Integer.parseInt(excluirId));
                response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
                return;
            }

            if (alterarId != null) {
//                data.atualizarUsuario(Integer.parseInt(alterarId), usuario, senha, email);
                response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
                return;
            }

            if (nome != null && email != null && datetime != null && titulo != null && resumo != null && status != null && local != null) {
//                data.inserirUsuario(usuario, senha, email);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
