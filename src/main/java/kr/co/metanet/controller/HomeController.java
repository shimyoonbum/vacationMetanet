package kr.co.metanet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.dto.AccountDTO;
import kr.co.metanet.dto.ApproveWrapperDTO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;
import kr.co.metanet.dto.VacationCommonViewDTO;
import kr.co.metanet.dto.VacationDaysManageDTO;
import kr.co.metanet.service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	MemberService service;
	
	
	/*
	@ExceptionHandler(value=DemoException.class)
    public String handleDemoException(DemoException e) {
        log.error(e.getMessage());
        return "/error/404";
    }
    */
	
	
	/* 휴가 수정 기능*/
	
	@RequestMapping(value="/apply/moifying",method = RequestMethod.POST)
	@ResponseBody
	public int applyModify(@RequestBody VacationApplyDTO dto,@SessionAttribute("account") AccountDTO account ) throws Exception{
		
		dto.setApply_Emp_code(account.getEmp_code());
		VacationDaysManageDTO manage = service.vacationDaysManage(account);
		double days = Double.parseDouble(manage.getRes_Days_Num());
		double days2 = dto.getVa_days_num();
		String code = dto.getVk_code();
		
		if(days-days2 >= 0 && (code.equals("VK1")||code.equals("VK2"))) {
			service.applyModify(dto);
			return 1;
		}
		else if(!(code.equals("VK1")||code.equals("VK2"))) {
			service.applyModify(dto);
			return 1;
		}
		else {
			return 0; 
			
		}
		
	}
	
	
	
	/* 휴가 수정 화면 */
	@RequestMapping(value="/apply/modify",method = RequestMethod.POST)
	public ModelAndView applyModify(String index,ModelAndView model) throws Exception{
		logger.info(index);
		VacationApplyDTO dto = service.vacationApplyDetail(index);
		model.addObject("apply", dto);
		model.setViewName("/mobile/applyModify");
		return model;
	}
	
	/* 휴가 승인 기능 */
	@RequestMapping(value= "/approve", method = RequestMethod.POST)
	@ResponseBody
	public int approve(@RequestBody ApproveWrapperDTO dto) throws Exception{
		int ret = service.vacationApprove(dto);
		return ret;
	}
	
	
	/* 휴가 신청 기능 */
	@RequestMapping(value= "/vacation/submit", method = RequestMethod.POST)
	@ResponseBody
	public int VacationSubmit(@RequestBody VacationApplyDTO dto,@SessionAttribute("account") AccountDTO account) throws Exception {
		
		dto.setApply_Emp_code(account.getEmp_code());
		VacationDaysManageDTO manage = service.vacationDaysManage(account);
		double days = Double.parseDouble(manage.getRes_Days_Num());
		double days2 = dto.getVa_days_num();
		String code = dto.getVk_code();
		logger.info(dto.getVa_start_date()+" "+dto.getVa_end_date());
		if(days-days2 >= 0 && (code.equals("VK1")||code.equals("VK2"))) {
			service.vacationApply(dto);
			return 1;
		}
		else if(!(code.equals("VK1")||code.equals("VK2"))) {
			service.vacationApply(dto);
			return 1;
		}
		else {
			return 0; 
			
		}
		
	}
	
	/* 루트 시작 경로 */
	@RequestMapping(value = "/")
	public String root(ModelAndView model) {
		return "login/login";
	}
	
	/* 로그인 화면 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView model) {
		model.setViewName("/login/login");
		return model;
	}

	// login 기능
	@SuppressWarnings("unused")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(AccountDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		HttpSession session = req.getSession(true);
		AccountDTO login = service.login(dto);
		if (login == null) {
			session.setAttribute("account", null);
			 rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호를 확인해주세요.");

		} else {
			session.setAttribute("account", login);
			AuthorityDTO authority = service.mapping(login);
			logger.info(authority.getAG0001()+authority.getAG0002());
			session.setAttribute("authority",authority);
			AuthorityDTO authority2 =  (AuthorityDTO)session.getAttribute("authority");
			logger.info(authority2.getAG0001()+authority2.getAG0002());
			return "redirect:/main";

		}
		return "redirect:/login";
	}
	
	
	//logout
	@RequestMapping(value = "/logout")
	public String signout(HttpServletRequest req) throws Exception {
	 HttpSession session = req.getSession(true);
	 service.logout(session);
	 return "redirect:/login";
	}
	
	/*
	 * 메인화면
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/main")
	public ModelAndView main(@SessionAttribute("account") AccountDTO account,@SessionAttribute("authority") AuthorityDTO authority, ModelAndView model) throws Exception{
		String mail = account.getId();
		try {
			int index = mail.indexOf("@");
			String id = mail.substring(0, index);
			account.setId(id);	
		}catch(Exception e) {}
		finally{
				int count = 0;
				
				count = service.selectCount(account);
				
				int count2 = 0;
				count2 = service.selectApproveCount(account);
				
				int count3 = 0;
				count3 = service.selectRejectCount(account);
				
				int count4 = 0;
				count4 = service.selectStayCount(account);
				logger.info(authority.getAG0001()+authority.getAG0002());
				model.addObject("authority", authority);
				model.addObject("accountDTO", account);
				model.addObject("count", count);
				model.addObject("count2",count2);
				model.addObject("count3", count3);
				model.addObject("count4", count4);
				model.setViewName("mobile/main");
				return model;
		}
	}
	
	/*
	 * 프로필
	 */
	@RequestMapping(value = "/profile")
	public ModelAndView profile(@SessionAttribute("account") AccountDTO account, ModelAndView model) throws Exception{
		EmployeeDTO profile = service.getprofile(account);
		model.addObject("EmployeeDTO", profile);
		model.setViewName("mobile/profile");
		return model;
	}

	/*
	 * 휴가신청
	 */
	@RequestMapping(value = "/vacationSubmit")
	public String vacationSubmit() {
		return "mobile/VacationSubmit";
	}
	
	/*
	 * 휴가승인
	 */
	@RequestMapping(value = "/approveVacation")
	@ResponseBody
	public ModelAndView approveVacation(@SessionAttribute("account") AccountDTO account, ModelAndView model) throws Exception{
		List<VacationCommonViewDTO> applyDTO = service.vacationApplyApprove(account);
		model.addObject("applyDTO", applyDTO);
		model.setViewName("mobile/approveVacation");
		return model;
	}
	
	/*
	 * 휴가승인 화면 비동기 처리
	 */
	@RequestMapping(value="/approvevacation",method = RequestMethod.POST)
	public @ResponseBody List<VacationCommonViewDTO> approveVacationAjax(@ModelAttribute("account") AccountDTO account) throws Exception{
		List<VacationCommonViewDTO> applyDTO = service.vacationApplyApprove(account);
		return applyDTO;
	}
	
	/*
	 * 휴가관리
	 */
	@RequestMapping(value = "/manage")
	public ModelAndView manage(@SessionAttribute("account") AccountDTO account, ModelAndView model) throws Exception {
		VacationDaysManageDTO manageDTO = service.vacationDaysManage(account);
		List<VacationCommonViewDTO> applyDTO = service.vacationApplyList(account);
		model.addObject("manageDTO", manageDTO);
		model.addObject("applyDTO",applyDTO);
		model.setViewName("mobile/management");
		return model;
	}

	@RequestMapping(value = "/reject", method = RequestMethod.POST)
	@ResponseBody
	public int reject(@RequestBody VacationApplyDTO dto) throws Exception {
		
		int value = service.vacationReject(dto);
		return value;
	}

	/*
	 * 특정 테이블 행을 선택하면 그에 해당하는 리스트로 가게 해줌
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView findList(String index,HttpServletRequest req,ModelAndView model) throws Exception {
		VacationCommonViewDTO dto = service.vacationApplyDetail(index);
		model.addObject("detailDTO", dto);
		model.setViewName("mobile/list");
		return model;
	}
	/* 휴가 신청 삭제 */
	@RequestMapping(value= "/delete", method = RequestMethod.POST)
	@ResponseBody
	public int delete(@RequestBody ApproveWrapperDTO dto) throws Exception{		
		int ret = service.deleteSubmit(dto);		
		return ret;
	}
	
		

	

	
}
