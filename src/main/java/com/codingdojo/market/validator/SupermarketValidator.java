package com.codingdojo.market.validator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.market.models.Supermarket;
import com.codingdojo.market.repositories.StateRepository;
import com.codingdojo.market.repositories.SupermarketRepository;

@Component
public class SupermarketValidator implements Validator{
	@Autowired
	private StateRepository stateRepository;
	@Autowired
	private SupermarketRepository supermarketRepository;

	@Override
	public boolean supports(Class<?> clazz) {
		return Supermarket.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Supermarket supermarket = (Supermarket) target;
		
		if (stateRepository.findByAbv(supermarket.getState()) == null) {
			errors.rejectValue("state", "Not Found", "State abv is not valid");
		}
		
		List <Supermarket> superm = supermarketRepository.findByNameAndCity(supermarket.getName(), supermarket.getCity());
		for (Supermarket sup : superm) {
			if (supermarket.getId() != sup.getId()) {
				errors.rejectValue("name", "Duplicate", "Supermarket already exist for this city");
				break;
			}			
		}	
	}
}
