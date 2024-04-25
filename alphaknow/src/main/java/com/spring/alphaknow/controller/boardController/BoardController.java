package com.spring.alphaknow.controller.boardController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alphaknow.dto.boardDTO.BoardDTO;
import com.spring.alphaknow.service.boardService.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping("/board")
	public String employeeManagementPage(Model model, HttpServletRequest request) {
		List list = boardService.boardList();

		model.addAttribute("list", list);
		System.out.println("list : " + list);

		return "board";
	}

	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public String boardInsert(@RequestParam("boardTitle") String boardTitle,
			@RequestParam("employeeName") String employeeName, @RequestParam("employeeKey") int employeeKey,
			@RequestParam("boardContent") String boardContent) {

		// dto 에 담기
		BoardDTO dto = new BoardDTO();
		dto.setBoardTitle(boardTitle);
		dto.setEmployeeName(employeeName);
		dto.setEmployeeKey(employeeKey);
		dto.setBoardContent(boardContent);

		boardService.boardInsert(dto);

		return "redirect:/board";
	}

	@RequestMapping("/board/delete")
	public String boardDelete(@RequestParam("boardNum") int boardNum) {
		boardService.boardDelete(boardNum);

		return "redirect:/board";
	}

	// Ajax 게시글번호 받아서 상세정보 표시
	@RequestMapping("/board/ajax.doSelect")
	@ResponseBody
	public List<BoardDTO> boardAjax(@RequestParam("boardno") int boardNum, @RequestParam(value="employeeName", required=false) String employeeName, HttpSession session) {

		// dto 에 담기
		BoardDTO dto = new BoardDTO();
		dto.setBoardNum(boardNum);
		dto.setEmployeeName(employeeName);

		List<BoardDTO> list = boardService.boardDetailList(dto);
		return list;
	}

	// Ajax 게시글번호 받아서 해당 사원 정보 수정
	@RequestMapping("/board/ajax.doUpdate")
	@ResponseBody
	public BoardDTO boardAjaxUpdate(@RequestParam("boardNum") int boardNum,
			@RequestParam("boardTitle") String boardTitle, @RequestParam("boardContent") String boardContent) {

		// dto 에 담기
		BoardDTO dto = new BoardDTO();
		dto.setBoardNum(boardNum);
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);

		boardService.boardUpdate(dto);
		return dto;
	}
	
	

}
