package com.codingdojo.market.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.market.models.Supermarket;
import com.codingdojo.market.repositories.SupermarketRepository;

@Service
public class SupermarketService {
	@Autowired
	SupermarketRepository repository;
	
	public List<Supermarket> getAll() {
		return repository.findAll();
	}
	
	public List<Supermarket> getAllByName() {
		return repository.findAllByOrderByNameAscCityAsc();
	}
	
	public Supermarket create(Supermarket item) {
		return repository.save(item);
	}    
	
	public Supermarket findById(Long id) {		
		Optional<Supermarket> result = repository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
	public Supermarket update(Supermarket item) {
		return repository.save(item);
	}
	
	public void delete(Long id) {
		repository.deleteById(id);		
	}	
}
