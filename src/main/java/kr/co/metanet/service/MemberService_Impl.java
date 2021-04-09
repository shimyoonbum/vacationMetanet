package kr.co.metanet.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.dao.MemberDAO;
import kr.co.metanet.dto.AccountDTO;
import kr.co.metanet.dto.ApproveWrapperDTO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;
import kr.co.metanet.dto.VacationCommonViewDTO;
import kr.co.metanet.dto.VacationDaysManageDTO;

@Service
public class MemberService_Impl implements MemberService{
	@Autowired
    MemberDAO dao;
    
    @Override
    public AccountDTO login(AccountDTO dto) throws Exception{
    	return dao.login(dto);
    }
    @Override
    public void logout(HttpSession session) throws Exception{
    	session.invalidate();
    }
	@Override
	public void vacationApply(VacationApplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		dao.vacationApply(dto);
	}
	@Override
	public VacationDaysManageDTO vacationDaysManage(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.vacationDaysManage(dto);
	}
	@Override
	public List<VacationCommonViewDTO> vacationApplyList(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.vacationApplyList(dto);
	}
	@Override
	public List<VacationCommonViewDTO> vacationApplyApprove(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.vacationApplyApprove(dto);
	}
	@Override
	public VacationCommonViewDTO vacationApplyDetail(String index) throws Exception {
		// TODO Auto-generated method stub
		return dao.vacationApplyDetail(index);
	}
	@Override
	public int vacationApprove(ApproveWrapperDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.vacationApprove(dto.getIndexArray());
	}
	@Override
	public int vacationReject(VacationApplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.vacationReject(dto);
		
	}
	@Override
	public AuthorityDTO mapping(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.mapping(dto);
	}
	@Override
	public EmployeeDTO getprofile(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.getprofile(dto);
	}
	@Override
	public int selectCount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectcount(dto);
	}
	@Override
	public int selectApproveCount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectapprovecount(dto);
	}
	@Override
	public int selectRejectCount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectrejectcount(dto);
	}
	@Override
	public int selectStayCount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectstaycount(dto);
	}
	@Override
	public int deleteSubmit(ApproveWrapperDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.deletesubmit(dto.getIndexArray());
	}
	@Override
	public int applyModify(VacationApplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.applyModify(dto);
	}
	
    
}

