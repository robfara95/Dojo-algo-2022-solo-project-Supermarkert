package com.codingdojo.market.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.market.models.Item;
import com.codingdojo.market.repositories.ItemRepository;

@Service
public class ItemService {
	@Autowired
	private ItemRepository repository;
	
	public List<Item> getAll() {
		return repository.findAll();
	}
	
	public List<Item> getAllByName() {
		return repository.findAllByOrderByItemDescriptionAsc();
	}
	
	public List<Item> getBySpecificItem(String item) {
		return repository.getItemWhereItemDescription(item);
	}
	
	public List<Item> getBySpecificCategory(String item) {
		return repository.getItemWhereCategory(item);
	}
	
	public Item create(Item item) {
		return repository.save(item);
	}   
	
	public Item findById(Long id) {		
		Optional<Item> result = repository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
	public Item update(Item item) {
		return repository.save(item);
	}
	
	public void delete(Long id) {
		repository.deleteById(id);		
	}
}
