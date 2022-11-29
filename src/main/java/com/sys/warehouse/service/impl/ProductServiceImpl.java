package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.ProductRepository;
import com.sys.warehouse.dto.Product;
import com.sys.warehouse.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getList(Product product) {
        return productRepository.selectList(product.getIdSupplier());
    }
}
