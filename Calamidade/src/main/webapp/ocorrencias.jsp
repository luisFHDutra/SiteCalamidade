<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%@page import="com.calamidade.site.resources.*"%>

<div class="content-table-container">
    <a class="insert-link" href="#"><img class="content-icon" src="assets/images/icon-adicionar.png" alt=""/></a>
    <table class='content-table'>
        <tr>
            <th class="coluna-reservada"></th><th class="coluna-reservada"></th>
            <th>Nome</th>
            <th>Email</th>
            <th>Timestamp</th>
            <th>Título</th>
            <th>Resumo</th>
            <th>Status</th>
            <th>Local</th>
        </tr>
        <%
            Database data = new Database();
            ResultSet rs = data.execConsulta("SELECT * FROM ocorrencia");
            while(rs.next()){
        %>
        <tr>
            <td>
                <a class="alterar-link" href="#" data-id="<%=rs.getString("id")%>">
                    <img class="content-icon" src="assets/images/icon-alterar.png" alt=""/>
                </a>
            </td>
            <td>
                <form action="processaocorrencia" method="post">
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
            <td><%=rs.getString("status_aprovacao")%></td>
            <td><%=rs.getString("local")%></td>
        </tr>
        <%
            }
            rs.close();
        %>
        <tr id="insertRow" style="display: none;">
            <td colspan="2">
                <form id="insertForm" action="processaocorrencia" method="post">
                    <button type="submit" id="button-form">Enviar</button>
                    <td><input type="text" name="nome" placeholder="Nome completo"></td>
                    <td><input type="email" name="email" placeholder="Email"></td>
                    <td><input type="datetime-local" name="datetime"></td>
                    <td><input type="text" name="titulo" placeholder="Título"></td>
                    <td><input type="text" name="resumo" placeholder="Resumo"></td>
                    <td><input type="radio" name="status" value="Aprovado"></td>
                    <td><input type="text" name="local" placeholder="Local"></td>
                    <input class="margin-right" type="hidden" name="alterar" value="false">
                </form>
            </td>
        </tr>
        <tr id="alterRow" style="display: none;">
            <td colspan="2">
                <form id="updateForm" action="processaocorrencia" method="post">
                    <button type="submit" id="button-form">Enviar</button>
                    <input type="hidden" name="id" id="id">
                    <td><input type="text" name="nome" placeholder="Nome completo" id="nomeAlter"></td>
                    <td><input type="email" name="email" placeholder="Email" id="emailAlter"></td>
                    <td><input type="datetime-local" name="datetime" id="datahoraAlter"></td>
                    <td><input type="text" name="titulo" placeholder="Título" id="tituloAlter"></td>
                    <td><input type="text" name="resumo" placeholder="Resumo" id="resumoAlter"></td>
                    <td><input type="radio" name="status" value="Aprovado" id="statusAlter"></td>
                    <td><input type="text" name="local" placeholder="Local" id="localAlter"></td>
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
            var nome = row.querySelector("td:nth-child(3)").textContent;
            var email = row.querySelector("td:nth-child(4)").textContent;
            var datetime = row.querySelector("td:nth-child(5)").textContent;
            var titulo = row.querySelector("td:nth-child(5)").textContent;
            var resumo = row.querySelector("td:nth-child(5)").textContent;
            var status = row.querySelector("td:nth-child(5)").textContent;
            var local = row.querySelector("td:nth-child(5)").textContent;
            document.getElementById("id").value = id;
            document.getElementById("nomeAlter").value = nome;
            document.getElementById("emailAlter").value = email;
            document.getElementById("datetimeAlter").value = datetime;
            document.getElementById("tituloAlter").value = titulo;
            document.getElementById("resumoAlter").value = resumo;
            document.getElementById("statusAlter").value = status;
            document.getElementById("localAlter").value = local;
            document.getElementById("alterRow").style.display = "table-row";
        });
    });

</script>
