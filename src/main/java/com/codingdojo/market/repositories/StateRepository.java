package com.codingdojo.market.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.market.models.State;

@Repository
public interface StateRepository extends CrudRepository<State, Long> {
	List<State> findAll();
	State findByAbv(String abv);
}
