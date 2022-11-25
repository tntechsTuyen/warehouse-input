package com.sys.warehouse.dao;

import com.sys.warehouse.dto.Supplier;
import com.sys.warehouse.dto.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("supplierRepository")
public interface SupplierRepository extends JpaRepository<Supplier, Integer> {

}
