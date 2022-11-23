package com.sys.warehouse.service;

import java.util.List;

import com.sys.warehouse.exception.ResourceNotFoundException;
import com.sys.warehouse.dto.Customer;

public interface CustomerService {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theId) throws ResourceNotFoundException;

	public void deleteCustomer(int theId) throws ResourceNotFoundException;
	
}
