/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.server;

import java.io.IOException;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon E. Figueroa
 */
public class SendMessageServlet extends HttpServlet {

    private final String pagina = "/index.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String text = req.getParameter("text") != null ? req.getParameter("text") : "Hello World";

        try {
            InitialContext ic = new InitialContext();
            ConnectionFactory cf = (ConnectionFactory) ic.lookup("jms/ConnectionFactory");
            Queue queue = (Queue) ic.lookup("queue/QueueTest");

            Connection connection = cf.createConnection();
            Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            MessageProducer publisher = session.createProducer(queue);
            connection.start();

            TextMessage message = session.createTextMessage(text);
            publisher.send(message);
        } catch (NamingException | JMSException e) {
            res.getWriter().println("Error while trying to send <" + text + "> message: " + e.getMessage());
        }

        RequestDispatcher view = req.getRequestDispatcher(pagina);
        req.setAttribute("mensaje", text);
        view.forward(req, res);
    }

}
