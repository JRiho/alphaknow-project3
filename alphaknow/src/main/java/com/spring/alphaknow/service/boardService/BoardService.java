package com.spring.alphaknow.service.boardService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alphaknow.dao.boardDAO.BoardDAO;
import com.spring.alphaknow.dto.boardDTO.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	public List boardList() {
		return boardDAO.selectBoardList();
	}
	
	public BoardDTO boardInsert(BoardDTO dto) {
		return boardDAO.insertBoard(dto);
	}
	
	public int boardDelete(int boardno) {
		return boardDAO.deleteBoard(boardno);
	}
	
	// Ajax ----------------------------------------------------
	
	public List<BoardDTO> boardDetailList(BoardDTO dto) {
		return boardDAO.selectBoardDetail(dto);
	}
	
	public BoardDTO boardUpdate(BoardDTO dto) {
		return boardDAO.updateBoardDetail(dto);
	}

}
