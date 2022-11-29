package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.SupplierRepository;
import com.sys.warehouse.dto.Supplier;
import com.sys.warehouse.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierServiceImpl implements ISupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    @Override
    public List<Supplier> getAll() {
        return supplierRepository.findAll();
    }

    @Override
    public List<Supplier> getList(Supplier supplier) {
        return supplierRepository.selectByLikeName(supplier.getName());
    }

    @Override
    public Supplier save(Supplier supplier) {
        return supplierRepository.save(supplier);
    }
}
