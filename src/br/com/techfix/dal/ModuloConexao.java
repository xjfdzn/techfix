/*
 * The MIT License
 *
 * Copyright 2023 Fabricio Borges.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package br.com.techfix.dal;

import java.sql.*;

/**
 * Conexão com o Banco de Dados
 *
 * @author Fabricio Borges
 * @version 1.2
 */
public class ModuloConexao {

    // Metodo pra Estabelecer a conexão com o Banco de Dados
    /**
     * Método responsável pela conexão com o banco
     *
     * @return conexao
     */
    public static Connection conector() {
        Connection conexao = null;

        // Chamar o Driver
        String driver = "com.mysql.cj.jdbc.Driver";

        // Armazenar informações referente ao Banco
        String url = "jdbc:mysql://localhost:3306/techfix?characterEncoding=utf-8";
        String user = "dba";
        String password = "techfix@123456";

        // Conexão com o Banco:
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            // System.out.println(e);
            return null;
        }
    }
}
