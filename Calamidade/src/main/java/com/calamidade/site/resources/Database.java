package com.calamidade.site.resources;

import java.sql.*;

public class Database {

    private Connection conexao = null;

    public Database() {
        conecta();
    }

    public void conecta() {
        String nomeDriver = "org.postgresql.Driver";
        String localBancoDados = "jdbc:postgresql://localhost:5432/bancocalamidade";
        String usuario = "postgres";
        String senha = "postgres";

        try {
            Class.forName(nomeDriver).newInstance();
            conexao = DriverManager.getConnection(localBancoDados, usuario, senha);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void execSQL(String sql) {
        if (conexao == null) {
            conecta();
        }
        try {
            Statement st = conexao.createStatement();
            st.execute(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet execConsulta(String sql) {
        ResultSet rs = null;
        try {
            Statement st = conexao.createStatement();
            rs = st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public boolean validaLogin(String usuario, String senha) {
        boolean resp = false;

        try {
            ResultSet rs = execConsulta("SELECT * FROM usuario WHERE usuario='"
                    + usuario + "' AND senha='" + senha + "';");
            resp = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resp;
    }

    public void inserirUsuario(String usuario, String senha, String email) {
        String sql = "INSERT INTO usuario (usuario, senha, email) VALUES (?, ?, ?)";
        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setString(1, usuario);
            statement.setString(2, senha);
            statement.setString(3, email);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluirUsuario(int id) {
        String sql = "DELETE FROM usuario WHERE id = ?";
        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void atualizarUsuario(int id, String novoUsuario, String novaSenha, String novoEmail) {
        String sql = "UPDATE usuario SET usuario = ?, senha = ?, email = ? WHERE id = ?";
        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setString(1, novoUsuario);
            statement.setString(2, novaSenha);
            statement.setString(3, novoEmail);
            statement.setInt(4, id);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void inserirOcorrencia(
            String nomeCompleto, String email, Timestamp dataHoraOcorrencia,
            String tituloOcorrencia, String resumoOcorrencia, boolean statusAprovacao,
            String imagem, double latitude, double longitude, boolean emAberto) {

        String sql = "INSERT INTO ocorrencia (nome_completo, email, datahora_ocorrencia, titulo_ocorrencia, "
                + "resumo_ocorrencia, status_aprovacao, imagem, latitude, longitude, em_aberto) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setString(1, nomeCompleto);
            statement.setString(2, email);
            statement.setTimestamp(3, dataHoraOcorrencia);
            statement.setString(4, tituloOcorrencia);
            statement.setString(5, resumoOcorrencia);
            statement.setBoolean(6, statusAprovacao);
            statement.setString(7, imagem);
            statement.setDouble(8, latitude);
            statement.setDouble(9, longitude);
            statement.setBoolean(10, emAberto);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluirOcorrencia(int id) {
        String sql = "DELETE FROM ocorrencia WHERE id = ?";
        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void atualizarOcorrencia(int id, String novoNomeCompleto, String novoEmail, Timestamp novaDataHoraOcorrencia,
            String novoTituloOcorrencia, String novoResumoOcorrencia, boolean novoStatusAprovacao,
            String novaImagem, double novaLatitude, double novaLongitude, boolean novoEmAberto) {
        String sql = "UPDATE ocorrencia SET nome_completo = ?, email = ?, datahora_ocorrencia = ?, titulo_ocorrencia = ?, "
                + "resumo_ocorrencia = ?, status_aprovacao = ?, imagem = ?, latitude = ?, longitude = ?, em_aberto = ? "
                + "WHERE id = ?";
        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setString(1, novoNomeCompleto);
            statement.setString(2, novoEmail);
            statement.setTimestamp(3, novaDataHoraOcorrencia);
            statement.setString(4, novoTituloOcorrencia);
            statement.setString(5, novoResumoOcorrencia);
            statement.setBoolean(6, novoStatusAprovacao);
            statement.setString(7, novaImagem);
            statement.setDouble(8, novaLatitude);
            statement.setDouble(9, novaLongitude);
            statement.setBoolean(10, novoEmAberto);
            statement.setInt(11, id);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
