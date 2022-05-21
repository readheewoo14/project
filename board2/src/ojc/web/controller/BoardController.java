package ojc.web.controller;

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
	
	@RequestMapping(value = "/getBoardList", method = { RequestMethod.POST})	
	public String getBoardList(ModelMap model, Login login, @RequestBody BoardVo boardVo) {
		Object boardList = boardService.getBoardList(boardVo);
		model.addAttribute("boardList", boardList);
		
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
