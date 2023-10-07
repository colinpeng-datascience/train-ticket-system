package ncu.im3069.demo.controller;

import java.io.*;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.*;

import ncu.im3069.demo.app.TimeRowHelper;

import ncu.im3069.tools.JsonReader;

@WebServlet("/api/admin.do")
public class AdminController extends HttpServlet {
    
    
    private static final long serialVersionUID = 1L;

	
	private TimeRowHelper rh = TimeRowHelper.getHelper();
    

	
	
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.println("doposting");

        JsonReader jsr = new JsonReader(request);
        JSONObject jso = jsr.getObject();

        int train_id = jso.getInt("train_id");
        String off_date = jso.getString("off_date");
        String departure_time = jso.getString("departure_time");
        String departure_station = jso.getString("departure_station");
        String arrival_station = jso.getString("arrival_station");
        String on_date = jso.getString("on_date");
        
        int result = rh.manage(train_id,off_date,departure_time,departure_station,arrival_station,on_date);
        
        

    	JSONObject resp = new JSONObject();
    	if (result == 0) {
    		resp.put("message","No bus affected, please check your query again.");}
    	else {
    	    resp.put("message","Change successful!");}	
    	    jsr.response(resp, response);

    	}
        

}