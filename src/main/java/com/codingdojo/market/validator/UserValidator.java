package com.codingdojo.market.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.market.models.User;
import com.codingdojo.market.repositories.UserRepository;

@Component
public class UserValidator implements Validator {
	
	@Autowired
	private UserRepository uRepo;
	

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		User user = (User) target;
		if (!user.getConfirm().equals(user.getPassword())) {
			errors.rejectValue("password", "Not Found", "Password does not match");
		}
		
		if (uRepo.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "dup", "Email already exists");
		}		
	}
}
