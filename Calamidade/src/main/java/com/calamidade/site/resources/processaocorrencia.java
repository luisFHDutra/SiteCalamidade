package com.calamidade.site.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;

@MultipartConfig
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
            Part imagemPart = request.getPart("imagem");
            String status = request.getParameter("status");
            String aberto = request.getParameter("aberto");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            
            if (alterarId != null) {
                try {
                    if (imagemPart != null && imagemPart.getSize() > 0) {
                        byte[] bytes = new byte[(int) imagemPart.getSize()];
                        imagemPart.getInputStream().read(bytes);
                        String imagemBase64 = java.util.Base64.getEncoder().encodeToString(bytes);

                        data.atualizarOcorrencia(Integer.parseInt(alterarId), nome, email, datetime, titulo, resumo, status, imagemBase64, latitude, longitude, aberto);
                    } else {
                        data.atualizarOcorrencia(Integer.parseInt(alterarId), nome, email, datetime, titulo, resumo, status, null, latitude, longitude, aberto);
                    }
                    response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
                    return;
                } catch (Exception e) {
                    System.err.println("Erro ao atualizar a ocorrência: " + e.getMessage());
                    response.sendRedirect(request.getContextPath() + "/index.jsp?error=true&message=update_failed");
                    return;
                }
            }

            try {
                if (imagemPart != null && imagemPart.getSize() > 0) {
                    byte[] bytes = new byte[(int) imagemPart.getSize()];
                    imagemPart.getInputStream().read(bytes);
                    String imagemBase64 = java.util.Base64.getEncoder().encodeToString(bytes);

                    data.inserirOcorrencia(nome, email, datetime, titulo, resumo, status, imagemBase64, latitude, longitude, aberto);
                } else {
                    data.inserirOcorrencia(nome, email, datetime, titulo, resumo, status, null, latitude, longitude, aberto);
                }
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } catch (Exception e) {
                System.err.println("Erro ao inserir a ocorrência: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=true&message=insert_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=true");
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        }
    }

}
