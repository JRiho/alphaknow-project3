package com.spring.alphaknow.dao.ppmDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductionPlanManagementDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List selectPpmList() {
		List list = sqlSession.selectList("mapper.ppm.ppmSelect");
		return list;
	}
}
