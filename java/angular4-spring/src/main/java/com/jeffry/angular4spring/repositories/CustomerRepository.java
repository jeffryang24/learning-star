package com.jeffry.angular4spring.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.jeffry.angular4spring.models.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long> {
	List<Customer> findByLastName(String lastName);
}
