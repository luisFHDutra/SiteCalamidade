/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.calamidade.site.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author luisf
 */
@WebServlet(name = "excluirocorrencia", urlPatterns = {"/excluirocorrencia"})
public class excluirocorrencia extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Database data = new Database();

        try {
            String excluirId = request.getParameter("excluir");

            if (excluirId != null) {
                data.excluirOcorrencia(Integer.parseInt(excluirId));
                response.sendRedirect(request.getContextPath() + "/ocorrencias.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
