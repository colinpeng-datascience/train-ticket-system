package ncu.im3069.demo.controller;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.*;
import ncu.im3069.demo.app.User;

import ncu.im3069.tools.JsonReader;

@WebServlet("/api/login.do")
public class loginController extends HttpServlet {
    

    private static final long serialVersionUID = 1L;
        


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.println("doposting");

        JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();
       
        String email = jso.getString("email");
        String password = jso.getString("password");
        

        User u= new User(email, password);
        int rownum = u.getID();
        System.out.println("back to dopost");

        System.out.println("the user id:"+rownum);
        if (rownum != 0) {

        JSONObject resp = new JSONObject();
        resp.put("status", "200");
        resp.put("message", "log in success.");
        resp.put("uid", rownum);

        jsr.response(resp, response);
        }
        else {

        JSONObject resp = new JSONObject();
        resp.put("uid", rownum);

        jsr.response(resp, response);
        }}
}