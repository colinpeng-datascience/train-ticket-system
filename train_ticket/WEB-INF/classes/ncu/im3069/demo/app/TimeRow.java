package ncu.im3069.demo.app;

import org.json.*;


public class TimeRow {
    
    
    private int train_id;
    
    private int departure;
    
    private String arrival_time;
    
    private String departure_time;
    
    private String off_date;
    
    private String on_date;
    
    
    public TimeRow(int train_id, int departure,String arrival_time,String departure_time,String off_date,String on_date) {
    	
		this.train_id = train_id;
		this.departure = departure;        
		this.arrival_time = arrival_time;
		this.departure_time = departure_time;
		this.off_date = off_date;
		this.on_date = on_date;
    }
    
    public JSONObject getData() {
         
        JSONObject jso = new JSONObject();
        jso.put("train_id", getTrainID());
        jso.put("departure", getDeparture());
        jso.put("arrival_time", getArrivalTime());
        jso.put("departure_time", getDepartureTime());
        jso.put("off_date", getOffDate());
        jso.put("on_date", getOnDate());

        return jso;
    }


	private String getOnDate() {
		// TODO Auto-generated method stub
		return this.on_date;
	}


	private String getOffDate() {
		// TODO Auto-generated method stub
		return this.off_date;
	}


	private String getDepartureTime() {
		// TODO Auto-generated method stub
		return this.departure_time;
	}


	private String getArrivalTime() {
		// TODO Auto-generated method stub
		return this.arrival_time;
	}


	private int getDeparture() {
		// TODO Auto-generated method stub
		return this.departure;
	}


	private int getTrainID() {
		// TODO Auto-generated method stub
		return this.train_id;
	}

}