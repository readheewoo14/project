package ojc.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ojc.login.dto.Login;
import ojc.user.model.User;

/**
 * 최초 localhost:8080 으로 요청이 오는 경우 처리
 * @author jclee
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {
	@GetMapping
	public String getHomeView(HttpServletRequest request) {
		return "login";
	}

	@GetMapping("/404.html")
	public String get404View() {
		return "error/404";
	}

	@GetMapping("/throw")
	public String testControllerAdvice() {
		throw new RuntimeException("Error Test In Controller.");
	}
	
	// 주 월간 업무 화면
	@RequestMapping(value = "/myworkRp", method = { RequestMethod.GET })	
	public String myworkRpView(HttpSession session, Login login) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return session.getServletContext().getContextPath() + "login";
		}
		return "myworkRp"; 
	}

	// 주요업무계획 화면
	@RequestMapping(value = "/majorBnPlan", method = { RequestMethod.GET })	
	public String majorBnPlanView(HttpSession session, Login login) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return session.getServletContext().getContextPath() + "login";
		}
		return "majorBnPlan"; 
	}
	
	// 업무공유 화면
	@RequestMapping(value = "/workSh", method = { RequestMethod.GET })	
	public String workShView(HttpSession session, Login login) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return session.getServletContext().getContextPath() + "login";
		}
		return "workSh"; 
	}
}
