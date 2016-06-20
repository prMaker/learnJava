package com.kaishenit.ajexservlet;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2016/6/20.
 */

@WebServlet("/registname")
public class Login extends HttpServlet{

    Logger logger = LoggerFactory.getLogger(Login.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name =new String(req.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
        logger.debug(name);

        resp.setContentType("text/html;charset=UTF-8");
        resp.setHeader("catch-control","no-catch");
        resp.setHeader("expires","0");
        resp.setHeader("pragma","no-catch");

        PrintWriter printWriter = resp.getWriter();
        if("tom".equals(name)){
            printWriter.write("no");
        }else{
            printWriter.write("yes");
        }
        printWriter.flush();
        printWriter.close();

    }
}