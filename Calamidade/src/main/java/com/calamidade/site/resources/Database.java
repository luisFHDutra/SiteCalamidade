package com.calamidade.site.resources;

import java.sql.*;
import java.text.SimpleDateFormat;

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
            String nomeCompleto, String email, String datetime,
            String tituloOcorrencia, String resumoOcorrencia, String statusAprovacao,
            String imagem, String latitude, String longitude, String emAberto, String tipo) {

        System.out.println("nome " + nomeCompleto);
        System.out.println("email " + email);
        System.out.println("timestamp " + datetime);
        System.out.println("titulo " + tituloOcorrencia);
        System.out.println("resumo " + resumoOcorrencia);
        System.out.println("status " + statusAprovacao);
        System.out.println("aberto " + emAberto);
        
        double latitudeDouble = Double.parseDouble(latitude.replace(",", "."));
        double longitudeDouble = Double.parseDouble(longitude.replace(",", "."));
        
        boolean statusBoolean = Boolean.parseBoolean(statusAprovacao);
        boolean emAbertoBoolean = Boolean.parseBoolean(emAberto);
        
        int tipoInt = Integer.parseInt(tipo);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        Timestamp timestamp;
        try {
            java.util.Date parsedDate = dateFormat.parse(datetime);
            timestamp = new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
            System.err.println("Erro ao converter a data: " + e.getMessage());
            return;
        }
        
        String sql = "INSERT INTO ocorrencia (nome_completo, email, datahora_ocorrencia, titulo_ocorrencia, "
                + "resumo_ocorrencia, status_aprovacao, imagem, latitude, longitude, em_aberto, id_tipo) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setString(1, nomeCompleto);
            statement.setString(2, email);
            statement.setTimestamp(3, timestamp);
            statement.setString(4, tituloOcorrencia);
            statement.setString(5, resumoOcorrencia);
            statement.setBoolean(6, statusBoolean);
            statement.setString(7, imagem);
            statement.setDouble(8, latitudeDouble);
            statement.setDouble(9, longitudeDouble);
            statement.setBoolean(10, emAbertoBoolean);
            statement.setInt(11, tipoInt);

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

    public void atualizarOcorrencia(int id, String novoNomeCompleto, String novoEmail, String novoDatetime,
            String novoTituloOcorrencia, String novoResumoOcorrencia, String novoStatusAprovacao,
            String novaImagem, String novaLatitude, String novaLongitude, String novoEmAberto, String novoTipo) {
        String sql = "UPDATE ocorrencia SET nome_completo = ?, email = ?, datahora_ocorrencia = ?, titulo_ocorrencia = ?, "
                + "resumo_ocorrencia = ?, status_aprovacao = ?, imagem = ?, latitude = ?, longitude = ?, em_aberto = ?, id_tipo = ? "
                + "WHERE id = ?";
        
        double latitudeDouble = Double.parseDouble(novaLatitude.replace(",", "."));
        double longitudeDouble = Double.parseDouble(novaLongitude.replace(",", "."));
        
        boolean statusBoolean = Boolean.parseBoolean(novoStatusAprovacao);
        boolean emAbertoBoolean = Boolean.parseBoolean(novoEmAberto);
        
        int tipoInt = Integer.parseInt(novoTipo);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        Timestamp timestamp;
        try {
            java.util.Date parsedDate = dateFormat.parse(novoDatetime);
            timestamp = new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
            System.err.println("Erro ao converter a data: " + e.getMessage());
            return;
        }
        
        try {
            PreparedStatement statement = conexao.prepareStatement(sql);
            statement.setString(1, novoNomeCompleto);
            statement.setString(2, novoEmail);
            statement.setTimestamp(3, timestamp);
            statement.setString(4, novoTituloOcorrencia);
            statement.setString(5, novoResumoOcorrencia);
            statement.setBoolean(6, statusBoolean);
            statement.setString(7, novaImagem);
            statement.setDouble(8, latitudeDouble);
            statement.setDouble(9, longitudeDouble);
            statement.setBoolean(10, emAbertoBoolean);
            statement.setInt(11, tipoInt);
            statement.setInt(12, id);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
