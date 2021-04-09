package kr.co.metanet.common;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import kr.co.metanet.dto.AccountDTO;

/*
 * 로그인 세션, 메뉴 권한 인터셉터
 */
public class AuthInterceptor extends WebContentInterceptor {
	protected Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	AccountDTO sessionVo = null;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
    	try {
    		HttpSession session = request.getSession();
            sessionVo = (AccountDTO) session.getAttribute("account");
            
            if (sessionVo != null && sessionVo.getId() != null) {
                logger.info("세션이 있습니다.");
            	return true;
            } else {
            	logger.info("세션이 만료 되었습니다.");
                ModelAndView modelAndView = new ModelAndView("redirect:/login");
                //modelAndView.addObject("msg", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
                throw new ModelAndViewDefiningException(modelAndView);
            }
        } catch (Exception e) {
        	logger.info("세션이 만료 되었습니다.");
            ModelAndView modelAndView = new ModelAndView("redirect:/login");
            //modelAndView.addObject("msg", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
            throw new ModelAndViewDefiningException(modelAndView);
        }	
            
   
    }
      
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	
    	
    }
	
	
}
