package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public RealEstate selectRealEstateById(int id); 

	public List<RealEstate> selectRealEstateByRentPrice(int rentPrice); 
	
	//@Param이 하나의 Map을 만들어줌
	//@Param은 repository DAO에서만 사용
	public List<RealEstate> selectRealEstateByAreaAndPrice(
			@Param("area") int area, @Param("price") int price);
	
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("rentPrice") Integer rentPrice);
	
	
	public int updateRealEstateById(
			@Param("id") int id,
			@Param("price") int price,
			@Param("type") String type); 
	
}
