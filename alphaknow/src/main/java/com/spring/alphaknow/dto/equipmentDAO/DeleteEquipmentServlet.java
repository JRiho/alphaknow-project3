package process;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteEquipmentServlet")
public class DeleteEquipmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String driver = "oracle.jdbc.driver.OracleDriver";
    private static final String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
    private static final String user = "alphaknow";
    private static final String password = "qwer1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedEquipments = request.getParameterValues("selectedEquipment");
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);

            String query = "DELETE FROM Equipment WHERE equipment_Code = ?";
            pstmt = conn.prepareStatement(query);

            if (selectedEquipments != null) {
                for (String code : selectedEquipments) {
                    pstmt.setInt(1, Integer.parseInt(code)); // 문자열을 int 타입으로 변환하고 PreparedStatement에 설정
                    pstmt.addBatch(); // 배치에 추가
                }
                int[] counts = pstmt.executeBatch(); // 배치 실행

                // 모든 삭제 작업이 성공적으로 수행되었는지 확인
                boolean allSuccess = true;
                for (int count : counts) {
                    if (count != 1) {
                        allSuccess = false;
                        break;
                    }
                }

                if (allSuccess) {
                    conn.commit();
                    System.out.println("삭제 작업이 성공적으로 커밋되었습니다.");
                } else {
                    throw new SQLException("일부 삭제 작업이 실패했습니다.");
                }
            }
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                    System.out.println("삭제 작업이 롤백되었습니다.");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            request.setAttribute("errorMessage", "삭제 중 에러가 발생했습니다: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response); // 오류 페이지로 리디렉션
            return;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("equipment");
    }
    
}

