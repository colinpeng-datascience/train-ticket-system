package ncu.im3069.demo.controller;

import java.io.*;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.*;
import ncu.im3069.demo.app.User;

import ncu.im3069.tools.JsonReader;

@WebServlet("/api/user.do")
public class UserController extends HttpServlet {
    
    
    private static final long serialVersionUID = 1L;
        




    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.println("doposting");

        JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();
        
        
        String email = jso.getString("email");
        String password = jso.getString("password");
        
        
        User u= new User(email, password);
        
        int rownum = u.register();
        System.out.println("back to dopost");

        System.out.println("the user id:"+rownum);
        if (rownum != 0) {
        System.out.println("rownum not 0");

        JSONObject resp = new JSONObject();
        resp.put("status", "200");
        resp.put("message", "Register successful! Now please log in.");
        resp.put("uid", rownum);
        
        
        
            
            
        jsr.response(resp, response);
        }
        else {
        
           
        JSONObject resp = new JSONObject();
        resp.put("uid", rownum);
        resp.put("status", "400");
        resp.put("message", "Email already exists!");
           
        jsr.response(resp, response);
        }}
    
    
    public void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


            JsonReader jsr = new JsonReader(request);
            JSONObject jso = jsr.getObject();
            

            String email = jso.getString("email");
            String password = jso.getString("password");
            

            User u= new User(email, password);
            

            int result = u.delete();

            if (result == 2) {


            JSONObject resp = new JSONObject();
            resp.put("status", "200");
            resp.put("message", "Delete successful!");

            jsr.response(resp, response);
            }
            else {
            

            JSONObject resp = new JSONObject();

            resp.put("status", "400");
            resp.put("message", "Failed, please delete your tickets first.");

            jsr.response(resp, response);
            }}

    public void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		System.out.print("doing put");

            JsonReader jsr = new JsonReader(request);
            JSONObject jso = jsr.getObject();
            

            String email = jso.getString("email");
            String password = jso.getString("password");
            String newpass = jso.getString("new_password");
            

            User u= new User(email, password);
            
            int result = u.changepassword(newpass);


            if (result == 1) {


            JSONObject resp = new JSONObject();
            resp.put("status", "200");
            resp.put("message", "Change successful! Please log in again.");

            jsr.response(resp, response);
            }
            else {

            JSONObject resp = new JSONObject();

            resp.put("status", "400");
            resp.put("message", "Please enter a new password!");

            jsr.response(resp, response);
            }}
}




