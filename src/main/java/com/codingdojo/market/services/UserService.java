package com.codingdojo.market.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;

import com.codingdojo.market.models.LoginUser;
import com.codingdojo.market.models.User;
import com.codingdojo.market.repositories.UserRepository;

@Service
public class UserService {    
    @Autowired
    private UserRepository repository;
    
	//Validate User for Duplicate email and password
	public void validate (User user, Errors errors) {
		if (errors.getErrorCount() > 0 ) {
			return;
		}
		
		if (!user.getConfirm().equals(user.getPassword())) {
			errors.rejectValue("password", "Not Found", "Password does not match confirm password");
		}
		
		if (repository.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "dup", "Email already exists");
		}	
	}
    
	// register user and has their password
	public User registerUser(User user) {
		String hashedPassword= BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashedPassword);
		//user.setName(user.getName().trim());
		
		return repository.save(user);		
	}
	
	//find user by email;
	public User findByEmail(String email) {
		return repository.findByEmail(email);
	}
	
	// find user by id
	public User findById (Long id) {
		return repository.findById(id).orElse(null);
	}
	// authenticate suer
	public boolean authenticateUser(String email, String password) {
		// first find the user by email
		User user = repository.findByEmail(email);
		//If we can't find it by email, return false
		if (user == null) {
			return false;
		} else {
			if (BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
     	User currentUser = findByEmail(newLoginObject.getEmail());
    	 
    	if (currentUser == null) {
    		result.rejectValue("email", "Present", "Email Does not exists");
    		return null;
    	}  
    	
    	// Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), currentUser.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	    return null;
    	}

    	return currentUser;  
    }
	
	
}
