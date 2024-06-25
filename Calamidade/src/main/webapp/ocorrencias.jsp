<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="com.calamidade.site.resources.*"%>

<div class="content-table-container">
    <table class='content-table'>
        <tr>
            <th class="coluna-reservada"></th><th class="coluna-reservada"></th>
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
            <td>
                <a class="alterar-link" href="#" data-id="<%=rs.getString("id")%>">
                    <img class="content-icon" src="assets/images/icon-alterar.png" alt=""/>
                </a>
            </td>
            <td>
                <form action="excluirocorrencia" method="post">
                    <input type="hidden" name="excluir" value="<%=rs.getString("id")%>">
                    <button type="submit" id="delete-btn" onclick="return confirm('Tem certeza que deseja excluir essa ocorrência?');">
                        <img class="content-icon" src="assets/images/icon-excluir.png" alt=""/>
                    </button>
                </form>
            </td>
            <td><%=rs.getString("nome_completo")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("datahora_ocorrencia")%></td>
            <td><%=rs.getString("titulo_ocorrencia")%></td>
            <td><%=rs.getString("resumo_ocorrencia")%></td>
            <td><%=rs.getString("tipo_nome")%></td>
            <td><%=status%></td>
            <td><%=rs.getDouble("latitude")%></td>
            <td><%=rs.getDouble("longitude")%></td>
            <td><%=emAberto%></td>
            <td>
                <% if (imagemBase64 != null && !imagemBase64.isEmpty()) { %>
                <img class="ocorrencia-thumbnail" src="data:image/*;base64,<%= imagemBase64 %>" alt="Imagem da Ocorrencia">
                <% } else { %>
                <p>Imagem indisponivel</p>
                <% } %>
            </td>
        </tr>
        <%
            }
            rs.close();
        %>
        <tr id="alterRow" style="display: none;">
            <td colspan="2">
                <form id="updateForm" action="processaocorrencia" method="post" enctype="multipart/form-data">
                    <button type="submit" id="button-form">Enviar</button>
                    <input type="hidden" name="id" id="id">
                    <td><input type="text" name="nome" placeholder="Nome completo" id="nomeAlter"></td>
                    <td><input type="email" name="email" placeholder="Email" id="emailAlter"></td>
                    <td><input type="datetime-local" name="datetime" id="datetimeAlter"></td>
                    <td><input type="text" name="titulo" placeholder="Título" id="tituloAlter"></td>
                    <td><input type="text" name="resumo" placeholder="Resumo" id="resumoAlter"></td>
                    <td>
                        <select name="tipo" id="tipoAlter" required>
                            <option value="1">Inundações</option>
                            <option value="2">Deslizamentos</option>
                            <option value="3">Secas</option>
                            <option value="4">Tempestades</option>
                            <option value="5">Queimadas</option>
                            <option value="6">Erupção Vulcânica</option>
                        </select>
                    </td>
                    <td><input type="text" name="status" value="Aprovado" id="statusAlter"></td>
                    <td><input type="text" name="latitude" pattern="^-?\d{1,3}(.\d+)?$" placeholder="Latitude" id="latitudeAlter"></td>
                    <td><input type="text" name="longitude" pattern="^-?\d{1,3}(.\d+)?$" placeholder="Longitude" id="longitudeAlter"></td>
                    <td><input type="text" name="aberto" value="Aberto" id="abertoAlter"></td>
                    <td><input type="file" name="imagem" accept="image/*" /></td>
                    <input type="hidden" name="alterar" value="true">
                </form>
            </td>
        </tr>
    </table>
</div>

<script>
    document.querySelectorAll(".alterar-link").forEach(function (link) {
        link.addEventListener("click", function (event) {
            event.preventDefault();
            var row = this.closest("tr");
            var id = row.querySelector("a.alterar-link").getAttribute("data-id");
            var nome = row.querySelector("td:nth-child(3)").textContent;
            var email = row.querySelector("td:nth-child(4)").textContent;
            var datetime = row.querySelector("td:nth-child(5)").textContent;
            var titulo = row.querySelector("td:nth-child(6)").textContent;
            var resumo = row.querySelector("td:nth-child(7)").textContent;
            var tipo = row.querySelector("td:nth-child(8)").textContent;
            var status = row.querySelector("td:nth-child(9)").textContent;
            var latitude = row.querySelector("td:nth-child(10)").textContent;
            var longitude = row.querySelector("td:nth-child(11)").textContent;
            var aberto = row.querySelector("td:nth-child(12)").textContent;
            document.getElementById("id").value = id;
            document.getElementById("nomeAlter").value = nome;
            document.getElementById("emailAlter").value = email;
            document.getElementById("datetimeAlter").value = datetime;
            document.getElementById("tituloAlter").value = titulo;
            document.getElementById("resumoAlter").value = resumo;
            document.getElementById("tipoAlter").value = tipo;
            document.getElementById("statusAlter").value = status;
            document.getElementById("latitudeAlter").value = latitude;
            document.getElementById("longitudeAlter").value = longitude;
            document.getElementById("abertoAlter").value = aberto;
            document.getElementById("alterRow").style.display = "table-row";
        });
    });
</script>
