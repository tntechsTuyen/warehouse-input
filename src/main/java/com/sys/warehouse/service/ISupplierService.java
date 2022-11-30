package com.sys.warehouse.service;

import com.sys.warehouse.dto.Supplier;

import javax.persistence.EntityExistsException;
import java.util.List;

public interface ISupplierService {
    List<Supplier> getAll();
    List<Supplier> getList(Supplier supplier);
    Supplier save(Supplier supplier) throws Exception;
}
