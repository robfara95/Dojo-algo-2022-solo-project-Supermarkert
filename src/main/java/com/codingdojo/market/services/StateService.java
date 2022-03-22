package com.codingdojo.market.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.market.models.State;
import com.codingdojo.market.repositories.StateRepository;

@Service
public class StateService {
	@Autowired
	StateRepository repository;
	
	public List<State> getAll() {
		return repository.findAll();
	}
	
	public State findByStateCode(String state) {
		return repository.findByAbv(state);
	}
	

}
