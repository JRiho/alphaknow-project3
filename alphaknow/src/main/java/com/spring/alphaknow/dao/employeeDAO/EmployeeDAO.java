package com.spring.alphaknow.dao.employeeDAO;

import java.util.List;
import java.util.Map;

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
	
	public int deleteEmployee(int empno) {	
        // delete 실행
        sqlSession.delete("mapper.employee.employeeDelete", empno);
        
        return empno;
    }
	
	// Ajax 부분입니다 ----------------------------------------------------
	
	public List<EmployeeDTO> selectEmployeeDetail(EmployeeDTO dto) {
		// ajax select문 실행		
		List<EmployeeDTO> list = sqlSession.selectList("mapper.employee.employeeAjax", dto);
		return list;
	}
	
	public EmployeeDTO updateEmployeeDetail(EmployeeDTO dto) {
		// ajax update문 실행		
		sqlSession.update("mapper.employee.employeeAjaxUpdate", dto);

		return dto;
	}
	
}
