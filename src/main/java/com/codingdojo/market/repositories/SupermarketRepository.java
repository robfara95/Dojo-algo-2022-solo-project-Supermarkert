package com.codingdojo.market.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.market.models.Supermarket;

@Repository
public interface SupermarketRepository extends CrudRepository <Supermarket, Long> {
	List<Supermarket> findAll();
	List<Supermarket> findByNameAndCity(String name, String city);
	List<Supermarket> findAllByOrderByNameAscCityAsc();
	//List<Supermarket> findAllByOrderByNameAscCityAsc();
	
}
