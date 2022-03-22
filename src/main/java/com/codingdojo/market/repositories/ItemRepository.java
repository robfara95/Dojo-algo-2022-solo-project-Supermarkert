package com.codingdojo.market.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.market.models.Item;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long>{
	List<Item> findAll();
	List<Item> findAllByOrderByItemDescriptionAsc();
	@Query("SELECT d FROM Item d WHERE itemDescription = ?1")	
	List<Item> getItemWhereItemDescription(String item);
	@Query("SELECT d FROM Item d WHERE category = ?1")	
	List<Item> getItemWhereCategory(String item);
}
