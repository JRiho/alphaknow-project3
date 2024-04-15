package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    List<BoardDTO> boardList = getBoardListFromDatabase();
//	    
//	    request.setAttribute("boardList", boardList);
	    
//	    RequestDispatcher dispatcher = request.getRequestDispatcher("project_board.jsp");
//	    dispatcher.forward(request, response);
	    
	    response.sendRedirect("/alphaknow/select");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");

	    String title = request.getParameter("boardTitle");
	    String writer = request.getParameter("boardWriter");
	    String employee_code = request.getParameter("employee_code");
	    String content = request.getParameter("boardContent");
	    System.out.println("title: " + title);
	    System.out.println("writer: " + writer);
	    System.out.println("employee_code: " + employee_code);
	    System.out.println("content: " + content);
	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        String driver = "oracle.jdbc.driver.OracleDriver";
	        String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
	        String id = "alphaknow";
	        String pw = "qwer1234";
	        
	        Class.forName(driver);
	        System.out.println("오라클 driver 로딩 성공");
	        
	        conn = DriverManager.getConnection(url, id, pw);
	        System.out.println("커넥션 생성 성공");
	        
	        String sql = " INSERT INTO board_post (boardNum, boardTitle, boardWriter, employee_code, boardContent) VALUES (board_trigger.nextval, ?, ?, ?, ?)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, title);
	        pstmt.setString(2, writer);
	        pstmt.setString(3, employee_code);
	        pstmt.setString(4, content);
	        pstmt.executeUpdate();
	        pstmt.close();
	        
	        sql = " INSERT INTO board_list (boardNum, boardTitle, employee_code, boardWriter, boardViews) VALUES (board_trigger.nextval, ?, ?, ?, 0)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, title);
	        pstmt.setString(2, employee_code);
	        pstmt.setString(3, writer);
	        System.out.println(sql);
	        pstmt.executeUpdate();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
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

	    // 데이터베이스에 저장 후, 게시글 목록을 다시 불러와서 페이지를 로드합니다.
	    doGet(request, response);
	}

//	private List<BoardDTO> getBoardListFromDatabase() {
//		List<BoardDTO> boardList = new ArrayList<>();
//	    Connection conn = null;
//	    PreparedStatement pstmt = null;
//	    ResultSet rs = null;
//	    
//	    try {
//	        // 데이터베이스 연결
//	        String driver = "oracle.jdbc.driver.OracleDriver";
//	        String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
//	        String id = "alphaknow";
//	        String pw = "qwer1234";
//	        
//	        Class.forName(driver);
//	        conn = DriverManager.getConnection(url, id, pw);
//	        
//	        // 쿼리 실행
//	        String sql = "SELECT boardNum, boardTitle, boardWriter, created_date, boardViews FROM board_list";
//	        pstmt = conn.prepareStatement(sql);
//	        rs = pstmt.executeQuery();
//	        
//	        // 결과 처리
//	        while (rs.next()) {
//	            BoardDTO board = new BoardDTO();
//	            board.setBoardNum(rs.getInt("boardNum"));
//	            board.setBoardTitle(rs.getString("boardTitle"));
//	            board.setBoardWriter(rs.getString("boardWriter"));
//	            board.setCreated_date(rs.getDate("created_date"));
//	            board.setBoardViews(rs.getInt("boardViews"));
//	            boardList.add(board);
//	        }
//	    } catch (ClassNotFoundException | SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        // 리소스 해제
//	        if (rs != null) {
//	            try {
//	                rs.close();
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        }
//	        if (pstmt != null) {
//	            try {
//	                pstmt.close();
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        }
//	        if (conn != null) {
//	            try {
//	                conn.close();
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        }
//	    }
//	    
//	    return boardList;
//	}

}
