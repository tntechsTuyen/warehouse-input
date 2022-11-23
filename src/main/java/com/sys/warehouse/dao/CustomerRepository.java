package com.sys.warehouse.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sys.warehouse.dto.Customer;

@Repository("customerRepository")
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

}
