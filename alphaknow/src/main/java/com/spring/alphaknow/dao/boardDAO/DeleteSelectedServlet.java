package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteSelectedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedBoards = request.getParameterValues("selectedBoards");
        if (selectedBoards != null) {
            for (String boardId : selectedBoards) {
                // 게시글 삭제 로직을 수행합니다.
                deleteBoard(Integer.parseInt(boardId));
            }
            // 삭제가 성공적으로 이루어졌음을 클라이언트에게 알립니다.
            response.getWriter().write("게시글이 성공적으로 삭제되었습니다.");
        } else {
            // 선택된 게시글이 없는 경우에 대한 처리를 합니다.
            response.getWriter().write("삭제할 게시글을 선택해주세요.");
        }
    }

    // 게시글 삭제 로직을 수행하는 메서드
    private void deleteBoard(int boardId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
            String id = "alphaknow";
            String pw = "qwer1234";
            
            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);

            // 쿼리 실행
            String sql = "DELETE FROM board_list WHERE boardNum = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardId);
            pstmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
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
    }
}
