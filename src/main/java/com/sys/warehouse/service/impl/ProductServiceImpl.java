package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.ProductRepository;
import com.sys.warehouse.dto.Product;
import com.sys.warehouse.dto.Supplier;
import com.sys.warehouse.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityExistsException;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getList(Product product) {
        return productRepository.selectList(product.getIdSupplier(), "");
    }

    @Override
    public Product save(Product product) throws Exception {
        if(product.getCode() == null
                || product.getName() == null){
            throw new Exception("Thông tin không được trống");
        }
        List<Product> tmpData = productRepository.selectList(0, product.getCode());
        if(tmpData.size() > 0){
            throw new Exception("Thông tin đã tồn tại");
        }
        productRepository.save(product);
        return product;
    }

    @Override
    public String test() {
        return "test";
    }
}
