package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.SupplierRepository;
import com.sys.warehouse.dto.Supplier;
import com.sys.warehouse.service.ISupplierService;
import org.hibernate.exception.DataException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
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
        return supplierRepository.selectList("", supplier.getName());
    }

    @Override
    public Supplier save(Supplier supplier) throws Exception {
        if(supplier.getCode() == null
                || supplier.getName() == null){
            throw new Exception("Thông tin không được rỗng");
        }
        List<Supplier> tmpData = supplierRepository.selectList(supplier.getCode(), "");
        if(tmpData.size() > 0){
            throw new Exception("Thông tin đã tồn tại");
        }
        return supplierRepository.save(supplier);
    }
}
