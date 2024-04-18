//package com.spring.alphaknow.dao.ppmDAO;
//
//import java.sql.Date;
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO;
//
//@Repository
//public class ProductionPlanManagementDAO {
//	@Autowired
//	private SqlSession sqlSession;
//	
//	public List selectPpmList() {
//		// select 실행
//		List list = sqlSession.selectList("mapper.ppm.ppmSelect");
//		return list;
//	}
//	
//	public ProductPlanManagementDTO insertProductionPlan(ProductPlanManagementDTO dto) {	
//        // insert 실행
//        sqlSession.insert("mapper.ppm.ppmInsert", dto);
//        
//        return dto;
//    }
//	
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
//	
//}
