package ppmController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ppmDTO.ProductPlanManagementDTO;

@WebServlet("/ppmi")
public class ProductionPlanManagementInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		insertItem(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		insertItem(request, response);
	}

	protected void insertItem(HttpServletRequest request, HttpServletResponse response) {
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
			String itemCode = request.getParameter("itemCodeAdd");
			String itemName = request.getParameter("itemNameAdd");
			String deliveryPlace = request.getParameter("deliveryPlaceAdd");
			String deliveryAmount = request.getParameter("deliveryAmountAdd");
			String productionAmount = request.getParameter("productionAmountAdd");
			String remainAmount = request.getParameter("remainAmountAdd");
			String startdate = request.getParameter("startdateAdd");
			String enddate = request.getParameter("enddateAdd");

			// 변수 타입 변환
			int ItemCodeInt = Integer.parseInt(itemCode);
			int deliveryAmountInt = Integer.parseInt(deliveryAmount);
			int productionAmountInt = Integer.parseInt(productionAmount);
			int remainAmountInt = Integer.parseInt(remainAmount);
			Date cvStartdate = Date.valueOf(startdate);
			Date cvEnddate = Date.valueOf(enddate);

			// SQL 작성
			String query = "INSERT INTO production_plan_temp (";
			query += "production_plan_code,";
			query += "item_code,";
			query += "item_name,";
			query += "delivery_place,";
			query += "delivery_amount,";
			query += "expected_production_amount,";
			query += "expected_remain_amount,";
			query += "expected_start_date,";
			query += "expected_end_date";
			query += ")";
			query += "VALUES (";
			query += "'PPC' || PPC_SEQ.nextval, ";
			query += "?, ";
			query += "?, ";
			query += "?, ";
			query += "?, ";
			query += "?, ";
			query += "?, ";
			query += "TO_DATE(?, 'YYYY-MM-DD'), ";
			query += "TO_DATE(?, 'YYYY-MM-DD')";
			query += ")";
			System.out.println("production_plan_temp insert문 작성 성공");
			System.out.println(query);

			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);
			System.out.println("sql 실행 준비");

			// 데이터 가져오기
			System.out.println("데이터 가져오는 중...");
			
			System.out.println("값 확인:");
			System.out.println("1: " + ItemCodeInt);
			System.out.println("2: " + itemName);
			System.out.println("3: " + deliveryPlace);
			System.out.println("4: " + deliveryAmountInt);
			System.out.println("5: " + productionAmountInt);
			System.out.println("6: " + remainAmountInt);
			System.out.println("7: " + cvStartdate);
			System.out.println("8: " + cvEnddate);

			ps.setInt(1, ItemCodeInt);
			ps.setString(2, itemName);
			ps.setString(3, deliveryPlace);
			ps.setInt(4, deliveryAmountInt);
			ps.setInt(5, productionAmountInt);
			ps.setInt(6, remainAmountInt);
			ps.setDate(7, cvStartdate);
			ps.setDate(8, cvEnddate);

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
