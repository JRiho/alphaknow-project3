package ppmController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ppmu")
public class ProductionPlanManagementUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		updater(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		updater(request, response);
	}

	protected void updater(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8;");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "alphaknow";
		String password = "qwer1234";

		try {
			// driver 로딩
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			// DB 접속
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");

			// 데이터 변수 지정
			String itemCode = request.getParameter("itemCodeUpdate");
			String itemName = request.getParameter("itemNameUpdate");
			String deliveryPlace = request.getParameter("deliveryPlaceUpdate");
			String deliveryAmount = request.getParameter("deliveryAmountUpdate");
			String productionAmount = request.getParameter("productionAmountUpdate");
			String remainAmount = request.getParameter("remainAmountUpdate");
			String startdate = request.getParameter("startdateUpdate");
			String enddate = request.getParameter("enddateUpdate");
			String ppc = request.getParameter("chkChild");

			System.out.println("itemCode: " + itemCode);
			System.out.println("itemName: " + itemName);
			System.out.println("deliveryPlace: " + deliveryPlace);
			System.out.println("deliveryAmount: " + deliveryAmount);
			System.out.println("productionAmount: " + productionAmount);
			System.out.println("remainAmount: " + remainAmount);
			System.out.println("startdate: " + startdate);
			System.out.println("enddate: " + enddate);
			System.out.println("ppc: " + ppc);
			
			// 변수 타입 변환
			int itemCodeInt = Integer.parseInt(itemCode);
			int deliveryAmountInt = Integer.parseInt(deliveryAmount);
			int productionAmountInt = Integer.parseInt(productionAmount);
			int remainAmountInt = Integer.parseInt(remainAmount);
			Date cvStartdate = Date.valueOf(startdate);
			Date cvEnddate = Date.valueOf(enddate);
			

			// SQL 작성
			String query = "";
			query += " UPDATE production_plan_temp";
			query += " SET";
			query += " item_code = ?,";
			query += " item_name = ?,";
			query += " delivery_place = ?,";
			query += " delivery_amount = ?,";
			query += " expected_production_amount = ?,";
			query += " expected_remain_amount = ?,";
			query += " expected_start_date = TO_DATE(?, 'YYYY-MM-DD'),";
			query += " expected_end_date = TO_DATE(?, 'YYYY-MM-DD')";
			query += " WHERE";
			query += " production_plan_code = ?";
			System.out.println("production_plan_temp update문 작성 성공");
			System.out.println(query);

			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);
			System.out.println("sql 실행 준비");

			// 데이터 가져오기
			System.out.println("데이터 가져오는 중...");
			
			ps.setInt(1, itemCodeInt);
			ps.setString(2, itemName);
			ps.setString(3, deliveryPlace);
			ps.setInt(4, deliveryAmountInt);
			ps.setInt(5, productionAmountInt);
			ps.setInt(6, remainAmountInt);
			ps.setDate(7, cvStartdate);
			ps.setDate(8, cvEnddate);
			ps.setString(9, ppc);
			// SQL 실행
			ps.executeUpdate();

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
//			request.getRequestDispatcher("/ppms").forward(request, response);
			response.sendRedirect("/alphaknow/ppms");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
