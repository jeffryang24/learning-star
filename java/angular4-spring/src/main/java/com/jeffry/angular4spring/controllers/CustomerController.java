package com.jeffry.angular4spring.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jeffry.angular4spring.models.Customer;
import com.jeffry.angular4spring.repositories.CustomerRepository;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class CustomerController {
	@Autowired
	private CustomerRepository custRepo;
	
	@GetMapping(value = "/customer", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Customer> GetAll() {
		List<Customer> list = new ArrayList<>();
		Iterable<Customer> customers = custRepo.findAll();
		
		customers.forEach(list::add);
		return list;
	}
	
	@PostMapping(value = "/postcustomer")
	public Customer postCustomer(@RequestBody Customer cust) {
		custRepo.save(cust);
		return cust;
	}
	
	@GetMapping(value = "/findbylastname/{lastName}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Customer> findByLastName(@PathVariable String lastName) {
		List<Customer> cust = custRepo.findByLastName(lastName);
		
		return cust;
	}
	
	@DeleteMapping(value = "/customer/{id}")
	public void deleteCustomer(@PathVariable long id) {
		custRepo.delete(id);
	}
}
