package process;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classDirectory.Equipment;

@WebServlet("/equipment")
public class EquipmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EquipmentDAO equipmentDAO = new EquipmentDAOsql();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Equipment> equipmentList = equipmentDAO.getAllEquipments();
			request.setAttribute("equipmentList", equipmentList);
			request.getRequestDispatcher("process/process_equipment.jsp").forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		// 폼 데이터 추출
		if ("add".equals(action)) {
			String equipmentCodeStr = request.getParameter("equipment_code");
			int equipmentCode = 0; // 기본값 설정
			if (equipmentCodeStr != null && !equipmentCodeStr.isEmpty()) {
				try {
					equipmentCode = Integer.parseInt(equipmentCodeStr);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}

			String equipmentName = request.getParameter("equipment_name");
			String managementNumber = request.getParameter("management_number");
			String manufacturer = request.getParameter("manufacturer");
			String purchasingCompanyName = request.getParameter("purchasing_company_name");
			String repairCompanyName = request.getParameter("repair_company_name");
			String manager = request.getParameter("manager");
			String location = request.getParameter("location");
			String usage = request.getParameter("usage");
			String usageStatus = request.getParameter("usage_status");
			String purchaseDate = request.getParameter("purchase_date");
			String historyRegistrationDate = request.getParameter("history_registration_date");

			// Equipment 객체 생성
			Equipment equipment = new Equipment(equipmentCode, equipmentName, managementNumber, manufacturer,
					purchasingCompanyName, repairCompanyName, manager, location, usage, usageStatus, purchaseDate,
					historyRegistrationDate);

			try {
				// EquipmentDAO를 사용하여 데이터베이스에 저장
				equipmentDAO.addEquipment(equipment);
				response.sendRedirect("equipment"); // 성공적으로 추가한 후, 장비 목록 페이지로 리다이렉트
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("delete".equals(action)) {
		    String[] equipmentCodes = request.getParameterValues("equipment_code");
		    if (equipmentCodes != null) {
		        for (String codeStr : equipmentCodes) {
		            int equipmentCode = Integer.parseInt(codeStr);
		            try {
		                equipmentDAO.deleteEquipment(equipmentCode);
		            } catch (Exception e) {
		                e.printStackTrace(); // 오류 처리
		            }
		        }
		        response.sendRedirect("equipment"); // 삭제 후 페이지 리다이렉트
		    }
		} else if ("update".equals(action)) {
			// 장비 정보 추출 (폼 데이터)
			String equipmentCodeStr = request.getParameter("equipment_code");
			
			int equipmentCode = Integer.parseInt(request.getParameter("equipment_code"));
			String equipmentName = request.getParameter("equipment_name");
			String managementNumber = request.getParameter("management_number");
			String manufacturer = request.getParameter("manufacturer");
			String purchasingCompanyName = request.getParameter("purchasing_company_name");
			String repairCompanyName = request.getParameter("repair_company_name");
			String manager = request.getParameter("manager");
			String location = request.getParameter("location");
			String usage = request.getParameter("usage");
			String usageStatus = request.getParameter("usage_status");
			String purchaseDate = request.getParameter("purchase_date");
			String historyRegistrationDate = request.getParameter("history_registration_date");

			
			Equipment equipment = new Equipment();
			equipment.setEquipmentCode(equipmentCode); // 장비 코드 설정
			equipment.setEquipmentName(equipmentName); // 장비 이름 설정
			equipment.setManagementNumber(managementNumber); // 관리 번호 설정
			equipment.setManufacturer(manufacturer); // 제조사 설정
			equipment.setPurchasingCompanyName(purchasingCompanyName); // 구입 업체명 설정
			equipment.setRepairCompanyName(repairCompanyName); // 수리 업체명 설정
			equipment.setManager(manager); // 관리자 설정
			equipment.setLocation(location); // 위치 설정
			equipment.setUsage(usage); // 용도 설정
			equipment.setUsageStatus(usageStatus); // 사용 여부 설정 ('T' 또는 'F')
			equipment.setPurchaseDate(purchaseDate); // 구매일 설정
			equipment.setHistoryRegistrationDate(historyRegistrationDate); // 이력 등록일 설정
			try {
				equipmentDAO.updateEquipment(equipment);
				response.sendRedirect("equipment");
			} catch (Exception e) {
				e.printStackTrace();
				// 오류 처리 로직
			}
		}
	}
}
