package kr.co.metanet.dto;

public class VacationCommonViewDTO extends VacationApplyDTO {
	private String emp_Name;
	private String upper_Emp_Name;
	private String vk_Code_Name;
	private String vs_Code_Name;
	/* 상세 리스트  */
	private String org_Name;
	private String emp_rank;
	public String getOrg_Name() {
		return org_Name;
	}
	public void setOrg_Name(String org_Name) {
		this.org_Name = org_Name;
	}
	public String getEmp_rank() {
		return emp_rank;
	}
	public void setEmp_rank(String emp_rank) {
		this.emp_rank = emp_rank;
	}
	public String getEmp_Name() {
		return emp_Name;
	}
	public void setEmp_Name(String emp_Name) {
		this.emp_Name = emp_Name;
	}
	public String getUpper_Emp_Name() {
		return upper_Emp_Name;
	}
	public void setUpper_Emp_Name(String upper_Emp_Name) {
		this.upper_Emp_Name = upper_Emp_Name;
	}
	public String getVk_Code_Name() {
		return vk_Code_Name;
	}
	public void setVk_Code_Name(String vk_Code_Name) {
		this.vk_Code_Name = vk_Code_Name;
	}
	public String getVs_Code_Name() {
		return vs_Code_Name;
	}
	public void setVs_Code_Name(String vs_Code_Name) {
		this.vs_Code_Name = vs_Code_Name;
	}
	
	


	
	
	
}
