package ncu.im3069.demo.app;

import org.json.*;



public class Ticket {
    


    
    private User u;
    

	private int train_id;

	private int departure;

	private int arrival;

	private String seatid;

	private String deptime;

	private String aritime;

	private int price;

	private String date;

	private String book_time;

	private String pay_time;

	private int ticket_id;


    public Ticket(int trainid, int departure, int arrival, String seatid, String deptime, String aritime,
			int price) {
    	
    	this.train_id = trainid;
    	this.departure = departure;
    	this.arrival = arrival;
    	this.seatid = seatid;
    	this.deptime = deptime;
    	this.aritime = aritime;
    	this.price = price;
    	
	}
    
    
    public Ticket(User u,int trainid, int departure, int arrival, String seatid,String date ) {
    	this.u = u;
    	this.train_id = trainid;
    	this.departure = departure;
    	this.arrival = arrival;
    	this.seatid = seatid;
    	this.date = date;
	}
    
    public Ticket(int ticket_id, int price, String train_date, int train_id, String seat_id, int departure, int arrival,
			String book_time, String pay_time) {
    	this.ticket_id= ticket_id;
    	this.price = price;
    	this.date = train_date;
    	this.seatid = seat_id;
    	this.departure = departure;
    	this.arrival = arrival;
    	this.book_time = book_time;
    	this.pay_time = pay_time;
    	this.train_id = train_id;
	}


	public User getUser() {
    	return this.u;
    }
    
    public String getDate() {
    	return this.date;
    }






    public JSONObject getData() {
    	
        JSONObject jso = new JSONObject();

        jso.put("train_id", getTrainid());
        jso.put("departure", getDeparture());
        jso.put("arrival", getArrival());
        jso.put("seat_id", getSeatid());
        jso.put("departure_time", getDeptime());
        jso.put("arrival_time", getAritime());
        jso.put("price", getPrice());
        jso.put("book_time", getBookedTime());
        jso.put("pay_time",getPayTime());
        jso.put("date", getDate());
        jso.put("ticket_id", getTicketid());
        
        return jso;
    }
    
    


	private int getTicketid() {
		// TODO Auto-generated method stub
		return this.ticket_id;
	}


	private int getPrice() {
		// TODO Auto-generated method stub
		return this.price;
	}


	private String getPayTime() {
		return this.pay_time;
	}


	private String getBookedTime() {
		// TODO Auto-generated method stub
		return this.book_time;
	}


	private String getAritime() {
		// TODO Auto-generated method stub
		return this.aritime;
	}


	private String getDeptime() {
		// TODO Auto-generated method stub
		return this.deptime;
	}


	public String getSeatid() {
		// TODO Auto-generated method stub
		return this.seatid;
	}


	public int getArrival() {
		// TODO Auto-generated method stub
		return this.arrival;
	}


	public int getDeparture() {
		// TODO Auto-generated method stub
		return this.departure;
	}


	public int getTrainid() {
		// TODO Auto-generated method stub
		return this.train_id;
	}
}