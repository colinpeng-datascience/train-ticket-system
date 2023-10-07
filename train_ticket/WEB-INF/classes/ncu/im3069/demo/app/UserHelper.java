package ncu.im3069.demo.app;

import java.sql.*;


import ncu.im3069.demo.util.DBMgr;


public class UserHelper {
    

    private UserHelper() {
        
    }
    



	private static UserHelper th;
    
    private Connection conn = null;

	private CallableStatement stmt;

	private boolean hasresult;


	private int result;

	private int rownum;
    

    public static UserHelper getHelper() {

        if(th == null) th = new UserHelper();
        
        return th;
    }
    


	public int login(String email, String password) {



		try {
	    	
	        
	        
	    	conn = DBMgr.getConnection();


	    	stmt = conn.prepareCall("{call db_bus.sp_UserLogin(?,?,?)}");
	    	stmt.setString(1,email);
	    	stmt.setString(2,password);

	    	
	    	
	    	stmt.registerOutParameter(3,java.sql.Types.INTEGER);
	    	System.out.println("calling sp");
	    	hasresult = stmt.execute();
	    	rownum = stmt.getInt(3);
	    	System.out.println(rownum);
	    		
	    	

	    } catch (SQLException e) {
	        
	        System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
	    } catch (Exception e) {
	        
	        e.printStackTrace();
	    } finally {
	        
	        DBMgr.close(stmt, conn);
	    }
		return rownum;

	}



	public int register(String email, String password) {

		try {

        	conn = DBMgr.getConnection();


        	stmt = conn.prepareCall("{call db_bus.sp_RegisterUser(?,?,?)}");
        	stmt.setString(1,email);
        	stmt.setString(2,password);
        	
        	
        	stmt.registerOutParameter(3,java.sql.Types.INTEGER);
        	Boolean hasresult = stmt.execute();
        	rownum = stmt.getInt(3);
        		
        	

        } catch (SQLException e) {

            System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            
            e.printStackTrace();
        } finally {
            
            DBMgr.close(stmt, conn);
        }
		return rownum;

	}



	public int delete(int id) {
		

		int result = 0;
		try {
	    	
	        
	        
	    	conn = DBMgr.getConnection();


	    	stmt = conn.prepareCall("{call db_bus.sp_DeleteUserByUserID(?,?)}");
	    	stmt.setInt(1,id);
	    	System.out.print(id);
	    	stmt.registerOutParameter(2,java.sql.Types.INTEGER);
	    	System.out.println("calling sp");
	    	hasresult = stmt.execute();
	    	result = stmt.getInt(2);
	    	System.out.println(result);

	    } catch (SQLException e) {
	        
	        System.err.format("SQL State: %s\n%s\n%s", e.getErrorCode(), e.getSQLState(), e.getMessage());
	    } catch (Exception e) {
	        
	        e.printStackTrace();
	    } finally {
	        
	        DBMgr.close(stmt, conn);
	    }
		System.out.print("user delete"+result);
		
		return result;

	}



	public int changepass(int id, String newpassword) {
		

		try {
	    	
	        
	        
	    	conn = DBMgr.getConnection();


	    	stmt = conn.prepareCall("{call db_bus.sp_ResetNewPassword(?,?,?)}");
	    	stmt.setInt(1,id);
	    	stmt.setString(2, newpassword);
	    	stmt.registerOutParameter(3,java.sql.Types.INTEGER);
	    	

	    	hasresult = stmt.execute();
	    	result = stmt.getInt(3);
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



}


