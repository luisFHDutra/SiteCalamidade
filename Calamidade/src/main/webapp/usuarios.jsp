<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="com.calamidade.site.resources.*"%>

<div class="content-table-container">
    <a class="insert-link" href="#"><img class="content-icon" src="./assets/images/icon-adicionar.png" alt=""/></a>
    <table class='content-table'>
        <tr>
            <th class="coluna-reservada"></th><th class="coluna-reservada"></th>
            <th>Usuário</th>
            <th>Senha</th>
            <th>Email</th>
        </tr>
        <%
            Database data = new Database();
            ResultSet rs = data.execConsulta("SELECT * FROM usuario");
            while(rs.next()){
        %>
        <tr>
            <td>
                <a class="alterar-link" href="#" data-id="<%=rs.getString("id")%>">
                    <img class="content-icon" src="./assets/images/icon-alterar.png" alt=""/>
                </a>
            </td>
            <td>
                <form action="processausuarios" method="post">
                    <input type="hidden" name="excluir" value="<%=rs.getString("id")%>">
                    <button type="submit" id="delete-btn" onclick="return confirm('Tem certeza que deseja excluir esse usuário?');">
                        <img class="content-icon" src="assets/images/excluir.png" alt=""/>
                    </button>
                </form>
            </td>
            <td><%=rs.getString("usuario")%></td>
            <td><%=rs.getString("senha")%></td>
            <td><%=rs.getString("email")%></td>
        </tr>
        <%
            }
            rs.close();
        %>
        <tr id="insertRow" style="display: none;">
            <td colspan="2">
                <form id="insertForm" action="processausuarios" method="post">
                    <button type="submit" id="button-form">Enviar</button>
                    <td><input type="text" name="usuario" placeholder="Usuário"></td>
                    <td><input type="password" name="senha" placeholder="Senha"></td>
                    <td><input type="email" name="email" placeholder="Email"></td>
                    <input class="margin-right" type="hidden" name="alterar" value="false">
                </form>
            </td>
        </tr>
        <tr id="alterRow" style="display: none;">
            <td colspan="2">
                <form id="updateForm" action="processausuarios" method="post">
                    <button type="submit" id="button-form">Enviar</button>
                    <input type="hidden" name="id" id="id">
                    <td><input type="text" name="usuario" placeholder="Usuarios" id="usuarioAlter"></td>
                    <td><input type="password" name="senha" placeholder="Senha" id="senhaAlter"></td>
                    <td><input type="email" name="email" placeholder="Emails" id="emailAlter"></td>
                    <input type="hidden" name="alterar" value="true">
                </form>
            </td>
        </tr>

    </table>
</div>

<script>
    document.querySelector(".insert-link").addEventListener("click", function (event) {
        event.preventDefault();
        document.getElementById("insertRow").style.display = "table-row";
    });

    document.querySelectorAll(".alterar-link").forEach(function (link) {
        link.addEventListener("click", function (event) {
            event.preventDefault();
            var row = this.closest("tr");
            var id = row.querySelector("a.alterar-link").getAttribute("data-id");
            var usuario = row.querySelector("td:nth-child(3)").textContent;
            var senha = row.querySelector("td:nth-child(4)").textContent;
            var email = row.querySelector("td:nth-child(5)").textContent;
            document.getElementById("id").value = id;
            document.getElementById("usuarioAlter").value = usuario;
            document.getElementById("senhaAlter").value = senha;
            document.getElementById("emailAlter").value = email;
            document.getElementById("alterRow").style.display = "table-row";
        });
    });

</script>
