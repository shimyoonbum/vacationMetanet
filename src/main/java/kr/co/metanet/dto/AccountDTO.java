package kr.co.metanet.dto;

public class AccountDTO {
	private String id_code;
	private String id;
	private String password;
	private String Emp_code;
	private String certified_yn;
	public String getId_code() {
		return id_code;
	}
	public void setId_code(String id_code) {
		this.id_code = id_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmp_code() {
		return Emp_code;
	}
	public void setEmp_code(String emp_code) {
		Emp_code = emp_code;
	}
	public String getCertified_yn() {
		return certified_yn;
	}
	public void setCertified_yn(String certified_yn) {
		this.certified_yn = certified_yn;
	}
	
	
	
}
