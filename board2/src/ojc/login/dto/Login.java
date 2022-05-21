package ojc.login.dto;

public class Login {
	private String email;
	private String password;
	private String error;  
	
	public final String getEmail() {
		return email;
	}
	public final void setEmail(String email) {
		this.email = email;
	}
	public final String getPassword() {
		return password;
	}
	public final void setPassword(String password) {
		this.password = password;
	}
	public final String getError() {
		return error;
	}
	public final void setError(String error) {
		this.error = error;
	}
	
	
	
}
