package ppmController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ppmDTO.ProductPlanManagementDTO;

@WebServlet("/ppms")
public class ProductionPlanManagementSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		selector(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		selector(request, response);
	}

	protected void selector(HttpServletRequest request, HttpServletResponse response) {
		List list = new ArrayList();
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

			// SQL 작성
			String query = "SELECT ";
			query += "production_plan_code, ";
			query += "item_code, ";
			query += "item_name, ";
			query += "delivery_place, ";
			query += "delivery_amount, ";
			query += "expected_production_amount, ";
			query += "expected_remain_amount, ";
			query += "TO_DATE(expected_start_date, 'YY-MM-DD') AS expected_start_date, ";
			query += "TO_DATE(expected_end_date, 'YY-MM-DD') AS expected_end_date ";
			query += "FROM production_plan_temp";
			System.out.println("select문 작성 성공");

			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);
			System.out.println("sql 실행 준비");

			// SQL 실행, ResultSet으로 결과 확보
			ResultSet rs = ps.executeQuery();
			System.out.println("sql 실행 . . .");
			System.out.println("결과 확보 완료");

			// DB값 활용하기
			while (rs.next()) {
//				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

				String ppc = rs.getString("production_plan_code");
				int itemCode = rs.getInt("item_code");
				String itemName = rs.getString("item_name");
				String deliveryPlace = rs.getString("delivery_place");
				int deliveryAmount = rs.getInt("delivery_amount");
				int productionAmount = rs.getInt("expected_production_amount");
				int remainAmount = rs.getInt("expected_remain_amount");
				Date startDate = rs.getDate("expected_start_date");
				Date endDate = rs.getDate("expected_end_date");

				ProductPlanManagementDTO dto = new ProductPlanManagementDTO();
				dto.setPpc(ppc);
				dto.setItemCode(itemCode);
				dto.setItemName(itemName);
				dto.setDeliveryPlace(deliveryPlace);
				dto.setDeliveryAmount(deliveryAmount);
				dto.setProductionAmount(productionAmount);
				dto.setRemainAmount(remainAmount);
				dto.setStartdate(startDate);
				dto.setEnddate(endDate);				

				list.add(dto);
				System.out.println(dto.toString());
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getContextPath());

		try {
			request.getRequestDispatcher("productionplan/production_plan_management.jsp").forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/productionplan/production_plan_management.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}