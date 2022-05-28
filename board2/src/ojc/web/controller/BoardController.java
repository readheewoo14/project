package ojc.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ojc.board.model.BoardVo;
import ojc.board.repository.BoardService;
import ojc.login.dto.Login;
import ojc.user.model.User;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;	
	
	@RequestMapping(value = "/boards", method = { RequestMethod.GET })	
	public String boardView(HttpSession session, Login login) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return session.getServletContext().getContextPath() + "login";
		}
		return "board_list"; 
	}
	
	@RequestMapping(value = "/getWeekJobList", method = { RequestMethod.POST})	
	public String getWeekJobList(ModelMap model, Login login, @RequestBody BoardVo boardVo) {
		Object boardList = boardService.getWeekJobList(boardVo);
		model.addAttribute("boardList", boardList);
		
		return "jsonView"; 
	}
	
	@RequestMapping(value = "/setReport", method = { RequestMethod.POST})	
	public String setReport(ModelMap model, Login login, @RequestBody BoardVo boardVo) {
		if("1".equals(boardVo.getFlag())) {
			boardService.setReport(boardVo);
			boardService.setReportD(boardVo);			
		}
		return "jsonView"; 
	}
	
	@RequestMapping(value = "/setReportImsi", method = { RequestMethod.POST})	
	public String setReportImsi(ModelMap model, Login login, @RequestBody BoardVo boardVo) {
		if("1".equals(boardVo.getFlag())) {
			boardService.setReportImsi(boardVo);
			boardService.setReportDImsi(boardVo);
		}
		return "jsonView"; 
	}
	
	@RequestMapping(value = "/setReportUp", method = { RequestMethod.POST})	
	public String setReportUp(ModelMap model, Login login, @RequestBody BoardVo boardVo) {
		boardService.setReportUpD(boardVo);	
		return "jsonView"; 
	}
	
	@RequestMapping(value = "/setWeekDel", method = { RequestMethod.POST})	
	public String setWeekDel(ModelMap model, Login login, @RequestBody List<BoardVo> boardVo) {
		BoardVo resultData = new BoardVo();
		
		for(BoardVo paramData : boardVo) {
			resultData.setWeekId(paramData.getWeekId());
			boardService.setWeekDel(resultData);	
		}
		
		return "jsonView"; 
	}
	
	@RequestMapping(value = "/test", method = { RequestMethod.GET })	
	public String testView(HttpSession session, Login login) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return session.getServletContext().getContextPath() + "login";
		}
		
		return "test"; 
	}
	
}
