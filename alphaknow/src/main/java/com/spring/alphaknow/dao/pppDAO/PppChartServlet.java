package com.spring.alphaknow.dao.pppDAO;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.alphaknow.dto.pppDTO.ProductionPlanPerformanceDTO;

@WebServlet("/ppp.do")
public class PppChartServlet extends HttpServlet {
	
	ProductionPlanPerformanceDAO pppDAO = new ProductionPlanPerformanceDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 값 가져오기
		String select = request.getParameter("select");
		if("all".equals(select)) {
			
			List<ProductionPlanPerformanceDTO> pppList = pppDAO.selectChartList();
			
			for(int i=0; i<pppList.size(); i++) {
				ProductionPlanPerformanceDTO dto = pppList.get(i);
				System.out.println("["+ i +"/toString]"+ dto.toString());
			}
			
			System.out.println("select 완료");
			request.setAttribute("list", pppList);
			request.getRequestDispatcher("productionperf/production_performance_chart.jsp").forward(request, response);			
		}
		
		// 차트 임의의 값 insert
		String insert = request.getParameter("insert");
		if("all".equals(insert)) {
			int result = pppDAO.insertProductionData();
			if(result == 1) {
				System.out.println("insert 완료");				
			} else {
				System.out.println("insert 실패");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
