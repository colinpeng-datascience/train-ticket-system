package ncu.im3069.demo.app;

import java.sql.*;


import org.json.*;

import ncu.im3069.demo.util.DBMgr;


public class TicketHelper {
    

    private TicketHelper() {
        
    }
    



	private static TicketHelper th;
    
    private Connection conn = null;

	private CallableStatement stmt;

	private boolean hasresult;

	private ResultSet rs;

	private int result;
    

    public static TicketHelper getHelper() {

        if(th == null) th = new TicketHelper();
        
        return th;
    }
    
    public int order(Ticket t) {
    	
    	
    	User u = t.getUser();
    	int train_id = t.getTrainid();
    	int departure = t.getDeparture();
    	
    	int arrival = t.getArrival();
    	String seatid = t.getSeatid();
    	String date = t.getDate();
    	result = 0;
    	
    	
    	try {
        	
            
            
        	conn = DBMgr.getConnection();


        	stmt = conn.prepareCall("{call db_bus.sp_BookTicket(?,?,?,?,?,?,?)}");
        	stmt.setInt(1,u.getID());
        	stmt.setInt(2,train_id);
        	stmt.setInt(3,departure);
        	stmt.setInt(4,arrival);
        	stmt.setString(5,seatid);
        	stmt.setString(6,date);
        	stmt.registerOutParameter(7,java.sql.Types.INTEGER);
        	System.out.println("calling sp");
        	hasresult = stmt.execute();
        	result = stmt.getInt(7);
        	System.out.println(result);
        	
        } catch (SQLException e) {
            
            System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            
            e.printStackTrace();
        } finally {
            
            DBMgr.close(stmt, conn);
        }
    	return result;
    	
    	
    }


    public JSONObject search(String datetime, int departure, int arrival) {
		
		Ticket t = null;

        JSONArray jsa = new JSONArray();
        


        int rownum = 0;

		try{
			conn = DBMgr.getConnection();
			System.out.println("connected to server");
			
			stmt = conn.prepareCall("{call db_bus.sp_QueryTicketWithSeatManagement(?,?,?,?)}");
			stmt.setString(1, datetime);

			stmt.setInt(2,departure);
			stmt.setInt(3,arrival);
			stmt.registerOutParameter(4,java.sql.Types.INTEGER);
			System.out.println("datetime: " + datetime + "departure : " + departure + "arrival : " + arrival);
			
			hasresult = stmt.execute();
			
			rownum  = stmt.getInt(4);
			System.out.println("executed, rownum : " + rownum);
			
			if (rownum != 0) {
				rs = stmt.getResultSet();
			while(rs.next()) {
				int trainid = rs.getInt("train_id");
				String seatid = rs.getString("seat_id");
				String deptime = rs.getString("departure_time");
				String aritime = rs.getString("arrival_time");
				int price = rs.getInt("price");
				
				t = new Ticket(trainid,departure,arrival,seatid,deptime,aritime,price);
				jsa.put(t.getData());
			}}
			
		} catch (SQLException e) {

            System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
        } catch (Exception e) {

            e.printStackTrace();
        } finally {

            DBMgr.close(rs,stmt, conn);
        }
		JSONObject response = new JSONObject();
        response.put("row", rownum);

        response.put("data", jsa);

        return response;
		}

	public int deleteByID(User u, int tid) {
		int uid = u.getID();
        int rownum = 0;

		try{
			conn = DBMgr.getConnection();
			System.out.println("connected to server");
			
			stmt = conn.prepareCall("{call db_bus.sp_Delete_bookticket(?,?,?)}");
			stmt.setInt(1, uid);

			stmt.setInt(2,tid);
			
			stmt.registerOutParameter(3,java.sql.Types.INTEGER);

			
			hasresult = stmt.execute();
			
			rownum  = stmt.getInt(3);
			System.out.print("executed, rownum = "+rownum);
			
	    } catch (SQLException e) {
	        
	        System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
	    } catch (Exception e) {
	        
	        e.printStackTrace();
	    } finally {
	        
	        DBMgr.close(stmt, conn);
	    }
		return rownum;
	}

	public JSONObject getBooked(User u) {
		
		int uid = u.getID();
        JSONArray jsa = new JSONArray();
        int rownum = 0;

		try{
			conn = DBMgr.getConnection();
			System.out.println("connected to server");
			
			stmt = conn.prepareCall("{call db_bus.sp_GetTicketByUser(?,?)}");
			stmt.setInt(1, uid);
			stmt.registerOutParameter(2,java.sql.Types.INTEGER);

			
			hasresult = stmt.execute();
			
			rownum  = stmt.getInt(2);
			System.out.println("executed, rownum : " + rownum);
			
			if (rownum != 0) {
				rs = stmt.getResultSet();
			while(rs.next()) {
				int ticket_id = rs.getInt("ticket_id");

				int price = rs.getInt("price");				
				String train_date = rs.getString("train_date");
				int train_id = rs.getInt("train_id");
				String seat_id = rs.getString("seat_id");
				int departure = rs.getInt("departure");
				int arrival = rs.getInt("arrival");
				String book_time = rs.getString("book_time");
				String pay_time = rs.getString("pay_time");
				
				Ticket t = new Ticket(ticket_id,price,train_date,train_id,seat_id,departure,arrival,book_time,pay_time);
				jsa.put(t.getData());
			}}
			
		} catch (SQLException e) {

            System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
        } catch (Exception e) {

            e.printStackTrace();
        } finally {

            DBMgr.close(rs,stmt, conn);
        }
		JSONObject response = new JSONObject();
        response.put("row", rownum);

        response.put("data", jsa);
        
        return response;
		}

	public int payByID(User u, int tid) {		
	
	int uid = u.getID();
    int rownum = 0;

	try{
		conn = DBMgr.getConnection();
		System.out.println("connected to server");
		
		stmt = conn.prepareCall("{call db_bus.sp_PayTicket(?,?,?)}");
		stmt.setInt(1, uid);

		stmt.setInt(2,tid);
		
		stmt.registerOutParameter(3,java.sql.Types.INTEGER);

		
		hasresult = stmt.execute();
		
		rownum  = stmt.getInt(3);
		
    } catch (SQLException e) {
        
        System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
    } catch (Exception e) {
        
        e.printStackTrace();
    } finally {
        
        DBMgr.close(stmt, conn);
    }
	return rownum;
}
}


