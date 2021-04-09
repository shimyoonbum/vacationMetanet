package kr.co.metanet.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.metanet.dto.AccountDTO;
import kr.co.metanet.dto.ApproveWrapperDTO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;
import kr.co.metanet.dto.VacationCommonViewDTO;
import kr.co.metanet.dto.VacationDaysManageDTO;

public interface MemberService {
	//로그인
	public AccountDTO login(AccountDTO dto) throws Exception;
	
	//로그아웃
	public void logout(HttpSession session) throws Exception;
	
	//휴가 신청 기능
	public void vacationApply(VacationApplyDTO dto) throws Exception;
	
	//휴가 신청 내역 화면(1)
	public VacationDaysManageDTO vacationDaysManage(AccountDTO dto) throws Exception;
	
	//휴가 생성 내역 화면(2)
	public List<VacationCommonViewDTO> vacationApplyList(AccountDTO dto) throws Exception;
	
	//휴가 신청 승인 화면
	public List<VacationCommonViewDTO> vacationApplyApprove(AccountDTO dto) throws Exception;
	
	//휴가 신청 승인, 신청 내역 세부 정보 화면
	public VacationCommonViewDTO vacationApplyDetail(String index) throws Exception;
	
	//휴가 승인 기능
	public int vacationApprove(ApproveWrapperDTO dto) throws Exception;
	
	//휴가 반려 기능
	public int vacationReject(VacationApplyDTO dto) throws Exception;
	
	//권한 매핑 
	public AuthorityDTO mapping(AccountDTO dto) throws Exception;
	
	//프로필
	public EmployeeDTO getprofile(AccountDTO dto) throws Exception;
	
	//메인화면
	public int selectApproveCount(AccountDTO account) throws Exception;

	public int selectCount(AccountDTO account) throws Exception;

	public int selectRejectCount(AccountDTO account) throws Exception;

	public int selectStayCount(AccountDTO account) throws Exception;
	
	public int deleteSubmit(ApproveWrapperDTO dto) throws Exception;
	
	public int applyModify(VacationApplyDTO dto) throws Exception;
	
}
