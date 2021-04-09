package kr.co.metanet.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.metanet.dto.AccountDTO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;
import kr.co.metanet.dto.VacationCommonViewDTO;
import kr.co.metanet.dto.VacationDaysManageDTO;

@Repository
public class MemberDAO_Impl implements MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO_Impl.class);
    
	public static final String NAMESPACE ="Member";
	@Autowired
	SqlSession sql;
    
	@Override
	public AccountDTO login(AccountDTO dto) throws Exception{
		return sql.selectOne(NAMESPACE+".login", dto);
	}

	/* 휴가 신청 */
	@Override
	public void vacationApply(VacationApplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(NAMESPACE+".vacationapply",dto);
	}
	

	@Override
	public VacationDaysManageDTO vacationDaysManage(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".vacationdaysmanage",dto);
	}

	@Override
	public List<VacationCommonViewDTO> vacationApplyList(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE+".vacationapplylist",dto);
	}

	@Override
	public List<VacationCommonViewDTO> vacationApplyApprove(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(NAMESPACE+".vacationapplyapprove",dto );
	}

	@Override
	public VacationCommonViewDTO vacationApplyDetail(String index) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".vacationapplydetail",index);
	}

	@Override
	public int vacationApprove(ArrayList<String> va_code) throws Exception {
		// TODO Auto-generated method stub
		int i = 0;
		for (String string : va_code) {
			i += sql.update(NAMESPACE+".vacationapprove", string);
			VacationCommonViewDTO dto = sql.selectOne("vacationapplydetail",string);
			if(dto.getVk_code().equals("VK1")||dto.getVk_code().equals("VK2")) {
				sql.update(NAMESPACE+".daysmanageUpdate", dto);
			}
		}
	
		return i;
	}

	@Override
	public int vacationReject(VacationApplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.update(NAMESPACE+".test",dto);
			
	}
	@Override
	public EmployeeDTO getprofile(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".profile", dto);
	}
	@Override
	public AuthorityDTO mapping(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".authority",dto);
	}
	@Override
	public int selectcount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".submit", dto);
	}

	@Override
	public int selectapprovecount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".approve", dto);
	}

	@Override
	public int selectrejectcount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".reject", dto);
	}

	@Override
	public int selectstaycount(AccountDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(NAMESPACE+".stay", dto);
	}


	@Override
	public int deletesubmit(ArrayList<String> va_code) throws Exception {
		// TODO Auto-generated method stub
		int i = 0;
		for (String string : va_code) {
			i += sql.delete(NAMESPACE+".delete", string);
		}
		return i;
	}

	@Override
	public int applyModify(VacationApplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sql.update(NAMESPACE+".applyModify",dto);
	}


}