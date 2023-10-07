package ncu.im3069.demo.app;

import java.sql.*;


import org.json.*;

import ncu.im3069.demo.util.DBMgr;



public class TimeRowHelper {
    

    private TimeRowHelper() {
        
    }
    



	private static TimeRowHelper th;
    
    private Connection conn = null;

	private CallableStatement stmt;

	private boolean hasresult;

	private ResultSet rs;

	private int result;

	private int rownum;

    

    public static TimeRowHelper getHelper() {

        if(th == null) th = new TimeRowHelper();
        
        return th;
    }
    
	public int manage(int train_id, String off_date, String departure_time, String departure_station,
			String arrival_station, String on_date) {
		
		

		try {

	    	conn = DBMgr.getConnection();


	    	stmt = conn.prepareCall("{call db_bus.sp_TrainManagement(?,?,?,?,?,?,?)}");
	    	stmt.setInt(1,train_id);
	    	stmt.setString(2,off_date);
	    	stmt.setString(3,departure_time);
	    	stmt.setString(4,departure_station);
	    	stmt.setString(5,arrival_station);
	    	stmt.setString(6,on_date);
	    	stmt.registerOutParameter(7,java.sql.Types.INTEGER);
	    	
	    	hasresult = stmt.execute();
	    	int result = stmt.getInt(7);
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

	public JSONArray getall() {


        
		TimeRow r = null;

        JSONArray jsa = new JSONArray();
		
		
		try{
			conn = DBMgr.getConnection();
			System.out.println("connected to server");
			
			stmt = conn.prepareCall("{call db_bus.sp_GetAllTrain(?)}");
			stmt.registerOutParameter(1,java.sql.Types.INTEGER);
			
			hasresult = stmt.execute();
			
			rownum  = stmt.getInt(1);
			System.out.println("executed, rownum : " + rownum);
			
			if (rownum != 0) {
				rs = stmt.getResultSet();
			while(rs.next()) {
				int train_id = rs.getInt("TRAIN_id");
				int departure = rs.getInt("STATION_id_departure_station");
				String departure_time = rs.getString("TRAIN_departure_time");
				String off_date = rs.getString("TRAIN_off_date");
				String on_date = rs.getString("TRAIN_on_date");
				String arrival_time = rs.getString("TRAIN_arrival_time");
				r = new TimeRow(train_id,departure,arrival_time,departure_time,off_date,on_date);
				jsa.put(r.getData());
			}}
			
		} catch (SQLException e) {

            System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
        } catch (Exception e) {

            e.printStackTrace();
        } finally {

            DBMgr.close(rs,stmt, conn);
        }

		return jsa;
	}
}


