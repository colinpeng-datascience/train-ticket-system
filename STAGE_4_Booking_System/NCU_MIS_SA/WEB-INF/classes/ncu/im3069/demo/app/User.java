package ncu.im3069.demo.app;

import org.json.*;


public class User {

    private int id;
    
    private String email;

    private String password;

    private int rownum = 0;
    private UserHelper uh = UserHelper.getHelper();
    

    public User(String email, String password) {
    	System.out.print("creating user");
		this.email = email;
		this.password = password;        
		this.id = uh.login(email,password);

      
    }

    public int register() {
    	System.out.print("creating user");
    	rownum = uh.register(email,password);
		return rownum;
    	
    }
    
    
    
    public int getID() {
        return this.id;
    }


    public String getEmail() {
        return this.email;
    }
    

    public String getPassword() {
        return this.password;
    }
    

    public JSONObject getData() {
        JSONObject jso = new JSONObject();
        jso.put("id", getID());
        jso.put("email", getEmail());
        jso.put("password", getPassword());
        return jso;
    }
    
    
	public int delete() {
		int result = uh.delete(id);
		return result;
		
		
	}



	public int changepassword(String newpassword) {
		int result = uh.changepass(id,newpassword);
		return result;
	}
}