package ncu.im3069.demo.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.*;

import ncu.im3069.demo.app.TicketHelper;
import ncu.im3069.demo.app.User;
import ncu.im3069.tools.JsonReader;


@WebServlet("/api/myticket.do")
public class MyTicketController extends HttpServlet {
    
    
    private static final long serialVersionUID = 1L;
    
    private TicketHelper th = TicketHelper.getHelper();
    


    


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.print("posting");
    	
    	JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();
        
        String password = jso.getString("password");
        String email = jso.getString("email");
        User u= new User(email, password);
        
        JSONObject query = th.getBooked(u);

        
        JSONObject resp = new JSONObject();
        resp.put("status", "200");
        resp.put("response", query);

        jsr.response(resp, response);
        
    }
    
}