package ojc.board.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ojc.board.model.BoardVo;

@Service("boardService")
public class BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Object getBoardList(BoardVo boardVo) {
		return sqlSessionTemplate.selectList("getBoardList", boardVo);
	}
	
	
}
