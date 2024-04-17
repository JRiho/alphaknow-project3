package com.spring.alphaknow.dao.pppDAO;

import java.io.Reader;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.spring.alphaknow.dto.pppDTO.ProductionPlanPerformanceDTO;

public class ProductionPlanPerformanceDAO {
	private static SqlSessionFactory sqlMapper = null;

	public static SqlSessionFactory getInstance() {
		if(sqlMapper == null) {
			try {
				String res = "mybatis/SqlMapConfig.xml";
				Reader reader = Resources.getResourceAsReader(res);
				
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				sqlMapper = ssfb.build(reader);
				
				reader.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return sqlMapper;
	}

	public List<ProductionPlanPerformanceDTO> selectChartList() {
		List<ProductionPlanPerformanceDTO> chartList = null;

		 try {
			// DB 접속 정보 읽기
			sqlMapper = getInstance();
			// DB 접속
			SqlSession sqlSession = sqlMapper.openSession();
			
			System.out.println("select 시작");
			
			chartList = sqlSession.selectList("mapper.pppChart.selectChartList");				
			System.out.println("chartList : " + chartList);
		 } catch (Exception e) {
			 e.printStackTrace();
	     }
		

		return chartList;
	}

	public int insertProductionData() {
		int result = -1;
		SqlSession sqlSession = null;
		
		Random random = new Random();
		Calendar calendar = Calendar.getInstance();
		
		try {
		// DB 접속 정보 읽기
		sqlMapper = getInstance();

		// DB 접속
		sqlSession = sqlMapper.openSession();

		System.out.println("insert 시작");
		for (int year = 2023; year <= 2024; year++) {
            int maxMonth = (year == 2024) ? 4 : 12; // 2023년은 12월까지, 2024년은 4월까지

            for (int month = 1; month <= maxMonth; month++) {
                calendar.set(year, month - 1, 1); // 해당 연도와 월의 첫째 날 설정
                int maxWeeksInMonth = calendar.getActualMaximum(Calendar.WEEK_OF_MONTH);

                for (int week = 1; week <= maxWeeksInMonth; week++) {
                    int startDayOfWeek = (week - 1) * 7 + 1;
                    int endDayOfWeek = Math.min(startDayOfWeek + 6, maxDaysInMonth(month, year));

                    for (int day = startDayOfWeek; day <= endDayOfWeek; day++) {
                        for (int itemNumber = 1; itemNumber <= 3; itemNumber++) {
                            String itemName = "Item" + itemNumber;
                            int productionAmount = 10000;
                            double makeAmount = productionAmount * (0.9 + random.nextDouble() * 0.1);
                            double achievementRate = (makeAmount / productionAmount) * 100;
                            double defectRate = 100 - achievementRate;

                            ProductionPlanPerformanceDTO dto = new ProductionPlanPerformanceDTO();
                            dto.setWorkYear(year);
                            dto.setWorkMonth(month);
                            dto.setWorkWeek(week);
                            dto.setWorkDay(day);
                            dto.setItemName(itemName);
                            dto.setProductionAmount(productionAmount);
                            dto.setMakeAmount(makeAmount);
                            dto.setAchievementRate(achievementRate);
                            dto.setDefectRate(defectRate);

                            sqlSession.insert("mapper.pppChart.insertProductionData", dto);
                        }
                    }
                }
            }
        }
		sqlSession.commit();
		result = 1;
	}catch(Exception e) {
		if(sqlSession != null) {
			sqlSession.rollback();
			result = 0;
		}
		e.printStackTrace();
	}
		return result;
	}
	
	private int maxDaysInMonth(int month, int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1); // 해당 연도와 월의 첫째 날 설정
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

}
