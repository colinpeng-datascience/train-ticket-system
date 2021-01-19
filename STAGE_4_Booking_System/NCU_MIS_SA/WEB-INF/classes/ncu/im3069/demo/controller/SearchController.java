package ncu.im3069.demo.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import ncu.im3069.demo.app.TicketHelper;

import ncu.im3069.demo.app.TimeRowHelper;

import ncu.im3069.tools.JsonReader;


@WebServlet("/api/search.do")
public class SearchController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private TicketHelper th =  TicketHelper.getHelper();
    private TimeRowHelper rh = TimeRowHelper.getHelper();


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.println("doing post");
        JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();
        int departure = jso.getInt("departure");
        int arrival = jso.getInt("arrival");
        String date = jso.getString("date");
        String time = jso.getString("time");
        String datetime = date + " " + time;
        JSONObject query = th.search(datetime,departure,arrival);
        
        JSONObject resp = new JSONObject();
        resp.put("status", "200");
        resp.put("response", query);

        jsr.response(resp, response);
        
        }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        JsonReader jsr = new JsonReader(request);


        JSONArray jsa = new JSONArray();


        jsa = rh.getall();
        
       
		
		JSONObject query = new JSONObject();

        query.put("data", jsa);
        
        JSONObject resp = new JSONObject();
        
        resp.put("status", "200");
        resp.put("response", query);

        jsr.response(resp, response);
        
        }
    	
    	
    
}