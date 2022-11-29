package com.sys.warehouse.service;

import com.sys.warehouse.dto.Product;

import java.util.List;

public interface IProductService {

    List<Product> getList(Product product);
}
