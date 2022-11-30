package com.sys.warehouse.service;

import com.sys.warehouse.dto.Product;

import javax.persistence.EntityExistsException;
import java.util.List;

public interface IProductService {

    List<Product> getList(Product product);

    Product save(Product product) throws Exception;

    String test();
}
