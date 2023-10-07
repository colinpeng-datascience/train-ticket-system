package ncu.im3069.demo.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.*;
import ncu.im3069.demo.app.Ticket;
import ncu.im3069.demo.app.TicketHelper;
import ncu.im3069.demo.app.User;
import ncu.im3069.tools.JsonReader;


@WebServlet("/api/ticket.do")
public class TicketController extends HttpServlet {
    
    
    private static final long serialVersionUID = 1L;
    
    private TicketHelper th = TicketHelper.getHelper();
    


    


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	
    	System.out.println("doposting");
        JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();
        
        
        String email = jso.getString("email");
        String password = jso.getString("password");
        int train_id = jso.getInt("train_id");
        int departure = jso.getInt("departure");
        int arrival = jso.getInt("arrival");
        String date = jso.getString("date");
        String seat_id = jso.getString("seat_id");
        
        
        
        User u= new User(email, password);
        
        Ticket t = new Ticket(u,train_id,departure,arrival,seat_id,date);
        
        int rownum = th.order(t);
        
        System.out.println("back to dopost");

        System.out.println("the rownum:"+rownum);
        if (rownum != 0) {
        System.out.println("rownum not 0");
        
        JSONObject resp = new JSONObject();
        resp.put("status", "200");

            
        jsr.response(resp, response);
        }
        else {
        
           
        JSONObject resp = new JSONObject();
        resp.put("status", "400");
           
        jsr.response(resp, response);}}
    
    


    public void doDelete(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.print("deleting");
        JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();
        
        String password = jso.getString("password");
        String email = jso.getString("email");
        int tid = jso.getInt("ticket_id");
        User u= new User(email, password);
        
        int result = th.deleteByID(u,tid);
        
        
        if (result == 1) {

        JSONObject resp = new JSONObject();
        resp.put("status", "200");
        resp.put("message", "Ticket cancelled.");
        jsr.response(resp, response);
        }
    
        else {
        JSONObject resp = new JSONObject();
        resp.put("status", "400");
        resp.put("message", "Error!");
        jsr.response(resp, response);
        }
    }
    
    public void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            JsonReader jsr = new JsonReader(request);
            JSONObject jso = jsr.getObject();
            
            String password = jso.getString("password");
            String email = jso.getString("email");
            int tid = jso.getInt("ticket_id");
            User u= new User(email, password);
            
            int result = th.payByID(u,tid);
            
            
            if (result == 1) {

            JSONObject resp = new JSONObject();
            resp.put("status", "200");
            resp.put("message", "Ticket paid!");
            jsr.response(resp, response);
            }
        
            else {
            JSONObject resp = new JSONObject();
            resp.put("status", "400");
            resp.put("message", "Error!");
            jsr.response(resp, response);
            }
        }
}