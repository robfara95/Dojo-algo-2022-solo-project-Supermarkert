package com.codingdojo.market.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.codingdojo.market.models.Supermarket;
import com.codingdojo.market.repositories.StateRepository;
import com.codingdojo.market.repositories.SupermarketRepository;

@Service
public class SupermarketService {
	@Autowired
	SupermarketRepository repository;	
	@Autowired
	private StateRepository stateRepository;
	
	public void validate (Supermarket supermarket, Errors errors) {
		if (errors.getErrorCount() > 0 ) {
			return;
		}	
		
		if (stateRepository.findByAbv(supermarket.getState()) == null) {
			errors.rejectValue("state", "Not Found", "State abv is not valid");
		}
		
		List <Supermarket> superm = repository.findByNameAndCity(supermarket.getName(), supermarket.getCity());
		for (Supermarket sup : superm) {
			if (supermarket.getId() != sup.getId()) {
				errors.rejectValue("name", "Duplicate", "Supermarket already exist for this city");
				break;
			}			
		}	
		
	}
	
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
