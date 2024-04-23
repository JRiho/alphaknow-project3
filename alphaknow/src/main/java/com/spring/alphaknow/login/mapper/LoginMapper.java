package com.spring.alphaknow.login.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.alphaknow.login.model.Employee;

@Mapper
public interface LoginMapper {
    Employee authenticate(@Param("userId") String userId, @Param("password") String password);
}
