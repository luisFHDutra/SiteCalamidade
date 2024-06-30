<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="com.calamidade.site.resources.*"%>

<div class="content-table-container">
    <table class='content-table'>
        <tr>
            <th>Nome</th>
            <th>Email</th>
            <th>Timestamp</th>
            <th>Título</th>
            <th>Resumo</th>
            <th>Tipo</th>
            <th>Status</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Aberto</th>
            <th>Imagem</th>
            <th class="coluna-reservada"></th>
        </tr>
        <%
            Database data = new Database();
            String query = "SELECT o.*, t.nome AS tipo_nome FROM ocorrencia o LEFT JOIN tipo_desastre t ON o.id_tipo = t.id";
            ResultSet rs = data.execConsulta(query);
            while(rs.next()){
                String imagemBase64 = rs.getString("imagem");
                String statusStr = rs.getString("status_aprovacao");
                Boolean status = Util.stringToBoolean(statusStr);

                String abertoStr = rs.getString("em_aberto");
                Boolean emAberto = Util.stringToBoolean(abertoStr);
        %>
        <tr>
            <td><%=rs.getString("nome_completo")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("datahora_ocorrencia")%></td>
            <td><%=rs.getString("titulo_ocorrencia")%></td>
            <td><%=rs.getString("resumo_ocorrencia")%></td>
            <td><%=rs.getString("tipo_nome")%></td>
            <td>                    
                <form action="aprovaocorrencia" method="post">
                    <input type="hidden" name="aprovar" value="<%=rs.getString("id")%>">
                    <input type="hidden" name="status" value="<%=status%>">
                    <input type="hidden" name="email" value="<%=rs.getString("email")%>">
                    <button type="submit" id="alterar-btn">
                        <% if (status) {%>
                            <img class="content-icon" src="assets/images/circulo-verde.png" alt=""/>
                        <% } else { %>
                            <img class="content-icon" src="assets/images/circulo-vermelho.png" alt=""/>
                        <% } %>
                    </button>
                </form>
            </td>
            <td><%=rs.getDouble("latitude")%></td>
            <td><%=rs.getDouble("longitude")%></td>
            <td>                    
                <form action="emabertoocorrencia" method="post">
                    <input type="hidden" name="aprovar" value="<%=rs.getString("id")%>">
                    <input type="hidden" name="emaberto" value="<%=emAberto%>">
                    <button type="submit" id="alterar-btn">
                        <% if (emAberto) {%>
                            <img class="content-icon" src="assets/images/circulo-verde.png" alt=""/>
                        <% } else { %>
                            <img class="content-icon" src="assets/images/circulo-vermelho.png" alt=""/>
                        <% } %>
                    </button>
                </form>
            </td>
            <td>
                <% if (imagemBase64 != null && !imagemBase64.isEmpty()) { %>
                <img class="ocorrencia-thumbnail" src="data:image/*;base64,<%= imagemBase64 %>" alt="Imagem da Ocorrencia">
                <% } else { %>
                <p>Imagem indisponivel</p>
                <% } %>
            </td>
            <td>
                <form action="excluirocorrencia" method="post">
                    <input type="hidden" name="excluir" value="<%=rs.getString("id")%>">
                    <button type="submit" id="delete-btn" onclick="return confirm('Tem certeza que deseja excluir essa ocorrência?');">
                        <img class="content-icon" src="assets/images/excluir.png" alt=""/>
                    </button>
                </form>
            </td>
        </tr>
        <%
            }
            rs.close();
        %>

    </table>
</div>
