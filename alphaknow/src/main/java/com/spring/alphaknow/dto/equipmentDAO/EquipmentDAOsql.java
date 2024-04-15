package process;

import classDirectory.Equipment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipmentDAOsql implements EquipmentDAO {
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
	private static final String user = "alphaknow";
	private static final String password = "qwer1234";

	@Override
	public List<Equipment> getAllEquipments() throws Exception {
		List<Equipment> equipmentList = new ArrayList<>();
		Class.forName(driver);
		try (Connection conn = DriverManager.getConnection(url, user, password);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM Equipment")) {

			while (rs.next()) {
				Equipment equipment = new Equipment(rs.getInt("equipment_code"), rs.getString("equipment_name"),
						rs.getString("management_number"), rs.getString("manufacturer"),
						rs.getString("purchasing_company_name"), rs.getString("repair_company_name"),
						rs.getString("manager"), rs.getString("location"), rs.getString("usage"),
						rs.getString("usage_status"), rs.getString("purchase_date"),
						rs.getString("history_registration_date"));
				equipmentList.add(equipment);
			}
		}
		return equipmentList;
	}

	@Override
	public void addEquipment(Equipment equipment) throws Exception {
		Class.forName(driver);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false); // 트랜잭션 시작

			// 시퀀스에서 다음 값을 가져옴
			String seqSql = "SELECT equipment_seq.NEXTVAL FROM DUAL";
			pstmt = conn.prepareStatement(seqSql);
			rs = pstmt.executeQuery();
			int equipmentCode = 0;
			if (rs.next()) {
				equipmentCode = rs.getInt(1); // SEQUENCE로부터 생성된 고유번호
			}
			rs.close();
			pstmt.close();

			// 새 Equipment 객체를 데이터베이스에 삽입
			String insertSql = "INSERT INTO Equipment (equipment_code, equipment_name, management_number, manufacturer, "
					+ "purchasing_company_name, repair_company_name, manager, location, usage, usage_status, "
					+ "purchase_date, history_registration_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'))";
			pstmt = conn.prepareStatement(insertSql);

			pstmt.setInt(1, equipmentCode);
			pstmt.setString(2, equipment.getEquipmentName());
			pstmt.setString(3, equipment.getManagementNumber());
			pstmt.setString(4, equipment.getManufacturer());
			pstmt.setString(5, equipment.getPurchasingCompanyName());
			pstmt.setString(6, equipment.getRepairCompanyName());
			pstmt.setString(7, equipment.getManager());
			pstmt.setString(8, equipment.getLocation());
			pstmt.setString(9, equipment.getUsage());
			pstmt.setString(10, equipment.getUsageStatus());
			pstmt.setString(11, equipment.getPurchaseDate()); // 'YYYY-MM-DD' 형식이라고 가정
			pstmt.setString(12, equipment.getHistoryRegistrationDate()); // 'YYYY-MM-DD' 형식이라고 가정

			pstmt.executeUpdate();

			conn.commit(); // 트랜잭션 커밋

		} catch (Exception e) {
			if (conn != null) {
				conn.rollback(); // 오류 발생 시 롤백
			}
			throw e; // 예외를 다시 던짐
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	@Override
	public void deleteEquipment(int equipmentCode) throws Exception {
		Class.forName(driver);
		try (Connection conn = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Equipment WHERE equipment_code = ?")) {

			// 삭제할 장비의 equipment_code를 설정
			pstmt.setInt(1, equipmentCode);

			// SQL 쿼리 실행
			int affectedRows = pstmt.executeUpdate();

			if (affectedRows == 0) {
				throw new SQLException("장비 삭제 실패: 해당 장비가 데이터베이스에 없습니다.");
			}
		}
	}
	
	@Override
	public void updateEquipment(Equipment equipment) throws Exception {
	    Class.forName(driver);
	    try (Connection conn = DriverManager.getConnection(url, user, password);
	            PreparedStatement pstmt = conn.prepareStatement(
	                "UPDATE Equipment SET equipment_name = ?, management_number = ?, manufacturer = ?, purchasing_company_name = ?, repair_company_name = ?, manager = ?, location = ?, usage = ?, usage_status = ?, purchase_date = TO_DATE(?, 'YYYY-MM-DD'), history_registration_date = TO_DATE(?, 'YYYY-MM-DD') WHERE equipment_code = ?")) {

	        pstmt.setString(1, equipment.getEquipmentName());
	        pstmt.setString(2, equipment.getManagementNumber());
	        pstmt.setString(3, equipment.getManufacturer());
	        pstmt.setString(4, equipment.getPurchasingCompanyName());
	        pstmt.setString(5, equipment.getRepairCompanyName());
	        pstmt.setString(6, equipment.getManager());
	        pstmt.setString(7, equipment.getLocation());
	        pstmt.setString(8, equipment.getUsage());
	        pstmt.setString(9, equipment.getUsageStatus());
	        pstmt.setString(10, equipment.getPurchaseDate());
	        pstmt.setString(11, equipment.getHistoryRegistrationDate());
	        pstmt.setInt(12, equipment.getEquipmentCode());

	        int affectedRows = pstmt.executeUpdate();

	        if (affectedRows == 0) {
	            throw new SQLException("장비 업데이트 실패: 해당 장비가 데이터베이스에 없습니다.");
	        }
	    }
	}



	

}
