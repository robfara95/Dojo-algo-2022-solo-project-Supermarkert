package com.codingdojo.market.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.market.models.Category;
import com.codingdojo.market.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	CategoryRepository repository;
	
	public List<Category> getAll() {
		return repository.findAllByOrderByCategoryAsc();
	}
	
	public Category findByName(String item) {
		return repository.findByCategory(item);
	}
}
