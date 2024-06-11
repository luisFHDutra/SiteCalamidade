package com.calamidade.site.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "processausuarios", urlPatterns = {"/processausuarios"})
public class processausuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Database data = new Database();

        try {
            String alterarId = request.getParameter("id");
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            String email = request.getParameter("email");

            String excluirId = request.getParameter("excluir");
            if (excluirId != null) {
                data.excluirUsuario(Integer.parseInt(excluirId));
                response.sendRedirect(request.getContextPath() + "/usuarios.jsp");
                return;
            }

            if (alterarId != null) {
                data.atualizarUsuario(Integer.parseInt(alterarId), usuario, senha, email);
                response.sendRedirect(request.getContextPath() + "/usuarios.jsp");
                return;
            }

            if (usuario != null && senha != null && email != null) {
                data.inserirUsuario(usuario, senha, email);
                response.sendRedirect(request.getContextPath() + "/usuarios.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
