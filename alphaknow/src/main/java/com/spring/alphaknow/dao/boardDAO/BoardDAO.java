package com.spring.alphaknow.dao.boardDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.alphaknow.dto.boardDTO.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List selectBoardList() {
		// select 실행
		List list = sqlSession.selectList("mapper.board.boardSelect");
		return list;
	}
	
	public BoardDTO insertBoard(BoardDTO dto) {	
        // insert 실행
        sqlSession.insert("mapper.board.boardInsert", dto);
        
        return dto;
    }
	
	public int deleteBoard(int boardno) {	
        // delete 실행
        sqlSession.delete("mapper.board.boardDelete", boardno);
        
        return boardno;
    }
	
	// Ajax 부분입니다 ----------------------------------------------------
	
	public List<BoardDTO> selectBoardDetail(BoardDTO dto) {
		// ajax select문 실행		
		List<BoardDTO> list = sqlSession.selectList("mapper.board.boardAjax", dto);
		
		// 조회수 증가
		sqlSession.update("mapper.board.increaseBoardViews", dto);
		
		return list;
	}
	
	public BoardDTO updateBoardDetail(BoardDTO dto) {
		// ajax update문 실행		
		sqlSession.update("mapper.board.boardAjaxUpdate", dto);

		return dto;
	}
	
}
