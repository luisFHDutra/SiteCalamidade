
package com.calamidade.site.resources;

/**
 *
 * @author luis.dutra
 */
public class Teste {
    public static void main(String[] args) {
        boolean ok = JavaSendEmail.enviarEmail("luis.dutra@universo.univates.br", "Status da ocorrência", "A sua ocorrência foi aprovada.");
        System.out.println(ok);
    }
}
