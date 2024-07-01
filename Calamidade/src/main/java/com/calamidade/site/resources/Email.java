package com.calamidade.site.resources;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Fernando
 */
public class Email {
    public static boolean enviarEmail(String destinatario, String assunto, String mensagem) {
        String emailOrigem = "controle.estoque.univates@gmail.com";
        String senhaOrigem = "ctca yyku gtvk daxn";
        boolean ok = true;
        
        SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator(emailOrigem, senhaOrigem));
        email.setSSLOnConnect(true);
        
        try {
            email.setFrom(emailOrigem);
            email.setSubject(assunto);
            email.setMsg(mensagem);
            email.addTo(destinatario);
            email.send();
            System.out.println("Email enviado!");
            
        }catch(Exception e){
            e.printStackTrace();
            ok = false;
        }
        return ok;
    }
}