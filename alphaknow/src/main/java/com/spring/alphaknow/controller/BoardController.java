package com.spring.alphaknow.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alphaknow.dto.boardDTO.BoardDTO;

@Controller
public class BoardController {
	 @RequestMapping(value="/board/select", method=RequestMethod.GET)
	    public String board(Model model, @RequestParam(required = false) Integer boardNum) {
	        if (boardNum != null) {
	            List<BoardDTO> boardDetail = getBoardDetail(boardNum);
	            model.addAttribute("boardDetail", boardDetail);
	        } else {
	            List<BoardDTO> boardList = getBoardList();
	            model.addAttribute("boardList", boardList);
	        }
	        return "board";
	    }

	    @RequestMapping(value="/board/select", method=RequestMethod.POST)
	    public String boardDetail(Model model, @RequestParam int boardNum) {
	        List<BoardDTO> boardDetail = getBoardDetail(boardNum);
	        model.addAttribute("boardDetail", boardDetail);
	        return "board";
	    }
	

	private List<BoardDTO> getBoardList() {
        List<BoardDTO> boardList = new ArrayList<BoardDTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 데이터베이스 연결
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
            String id = "alphaknow";
            String pw = "qwer1234";

            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);

            // 쿼리 실행
            String sql = "SELECT boardNum, boardTitle, employee_code, boardWriter, created_date, boardViews FROM board_list";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setBoardNum(rs.getInt("boardNum"));
                board.setBoardTitle(rs.getString("boardTitle"));
                board.setEmployee_code(rs.getString("employee_code"));
                board.setBoardWriter(rs.getString("boardWriter"));
                board.setCreated_date(rs.getDate("created_date"));
                board.setBoardViews(rs.getInt("boardViews"));
                boardList.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return boardList;
    }
	
	private List<BoardDTO> getBoardDetail(int boardNum) {
        List<BoardDTO> boardDetail = new ArrayList<BoardDTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 데이터베이스 연결
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
            String id = "alphaknow";
            String pw = "qwer1234";

            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);

            // 쿼리 실행
            String sql = "SELECT boardNum, boardTitle, employee_code, boardContent FROM board_post where boardNum = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardNum);
            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setBoardNum(rs.getInt("boardNum"));
                board.setBoardTitle(rs.getString("boardTitle"));
                board.setEmployee_code(rs.getString("employee_code"));
                board.setBoardWriter(rs.getString("boardWriter"));
                board.setBoardWriter(rs.getString("boardContent"));
                boardDetail.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return boardDetail;
    }
	
}
