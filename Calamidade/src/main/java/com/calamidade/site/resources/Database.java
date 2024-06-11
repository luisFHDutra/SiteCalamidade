package com.calamidade.site.resources;

import java.sql.*;

public class Database {

    private Connection conexao = null;
    
    public Database(){
        conecta();
    }
    // create database bancodados;
    // \c bancodados
    // create table usuarios(id serial primary key, usuario text, senha text, email text);
    public void conecta() {
        String nomeDriver = "org.postgresql.Driver";
        String localBancoDados = "jdbc:postgresql://localhost:5432/bancodados";
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
        if(conexao == null) {
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
    
    public boolean validaLogin(String usuario, String senha){
        boolean resp = false;
        
        try {
            ResultSet rs = execConsulta("SELECT * FROM usuarios WHERE usuario='"
                    + usuario +"' AND senha='" + senha + "';");
            resp = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resp;
    }
    
    public void inserirUsuario(String usuario, String senha, String email) {
        String sql = "INSERT INTO usuarios (usuario, senha, email) VALUES (?, ?, ?)";
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
        String sql = "DELETE FROM usuarios WHERE id = ?";
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
        String sql = "UPDATE usuarios SET usuario = ?, senha = ?, email = ? WHERE id = ?";
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

}
