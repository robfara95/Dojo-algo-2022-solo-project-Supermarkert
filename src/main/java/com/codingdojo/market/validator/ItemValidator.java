package com.codingdojo.market.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.market.models.Item;
import com.codingdojo.market.repositories.CategoryRepository;

@Component
public class ItemValidator implements Validator{
	@Autowired
	private CategoryRepository categoryRepository;
	

	@Override
	public boolean supports(Class<?> clazz) {
		return Item.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Item item = (Item) target;		
		
		if (categoryRepository.findByCategory(item.getCategory()) == null) {
			errors.rejectValue("category", "Not Found", "Category is not valid");
		}		
		
		if (item.getSupermarket() == null) {
			errors.rejectValue("supermarket", "Required", "Supermarket selection is required");
		}
		
	}

}
