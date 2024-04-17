package com.spring.alphaknow.dao.employeeDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.alphaknow.dto.employeeDTO.EmployeeDTO;

@Repository
public class EmployeeDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List selectEmployeeList() {
		// select 실행
		List list = sqlSession.selectList("mapper.employee.employeeSelect");
		return list;
	}
	
	public EmployeeDTO insertEmployee(EmployeeDTO dto) {	
        // insert 실행
        sqlSession.insert("mapper.employee.employeeInsert", dto);
        
        return dto;
    }
	
//	public ProductPlanManagementDTO updateProductionPlan(ProductPlanManagementDTO dto) {	
//        // update 실행
//        sqlSession.update("mapper.ppm.ppmUpdate", dto);
//        
//        return dto;
//    }
//	
//	public String deleteProductionPlan(String ppc) {	
//        // delete 실행
//        sqlSession.update("mapper.ppm.ppmDelete", ppc);
//        
//        return ppc;
//    }
	
}
