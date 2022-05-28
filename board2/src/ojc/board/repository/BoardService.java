package ojc.board.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ojc.board.model.BoardVo;

@Service("boardService")
public class BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Object getWeekJobList(BoardVo boardVo) {
		return sqlSessionTemplate.selectList("getWeekJobList", boardVo);
	}

	public void setReport(BoardVo boardVo) {
		sqlSessionTemplate.insert("setReport", boardVo);
	}

	public void setReportD(BoardVo boardVo) {
		sqlSessionTemplate.insert("setReportD", boardVo);
	}

	public void setReportImsi(BoardVo boardVo) {
		sqlSessionTemplate.insert("setReport", boardVo);
	}

	public void setReportDImsi(BoardVo boardVo) {
		sqlSessionTemplate.insert("setReportDImsi", boardVo);
	}

	public void setReportUpD(BoardVo boardVo) {
		sqlSessionTemplate.update("setReportUpD", boardVo);
	}

	public void setWeekDel(BoardVo boardVo) {
		sqlSessionTemplate.update("setWeekDel", boardVo);
	}
	
	
}
