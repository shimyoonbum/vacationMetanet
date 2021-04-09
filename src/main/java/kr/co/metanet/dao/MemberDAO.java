package kr.co.metanet.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.metanet.dto.AccountDTO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;
import kr.co.metanet.dto.VacationCommonViewDTO;
import kr.co.metanet.dto.VacationDaysManageDTO;

public interface MemberDAO {
	public AccountDTO login(AccountDTO dto) throws Exception;
	public void	vacationApply(VacationApplyDTO dto) throws Exception;
	public VacationDaysManageDTO vacationDaysManage(AccountDTO dto) throws Exception;
	public List<VacationCommonViewDTO> vacationApplyList(AccountDTO dto) throws Exception;
	public List<VacationCommonViewDTO> vacationApplyApprove(AccountDTO dto) throws Exception;
	public VacationCommonViewDTO vacationApplyDetail(String index) throws Exception;
	public int vacationApprove(ArrayList<String> va_code) throws Exception;
	public int vacationReject(VacationApplyDTO dto) throws Exception;
	public AuthorityDTO mapping(AccountDTO dto) throws Exception;
	public EmployeeDTO getprofile(AccountDTO account) throws Exception;
	public int selectapprovecount(AccountDTO account) throws Exception;
	public int selectcount(AccountDTO dto) throws Exception;
	public int selectrejectcount(AccountDTO dto) throws Exception;
	public int selectstaycount(AccountDTO dto) throws Exception;
	int deletesubmit(ArrayList<String> va_code) throws Exception;
	public int applyModify(VacationApplyDTO dto) throws Exception;
}
