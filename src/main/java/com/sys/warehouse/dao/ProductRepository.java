package com.sys.warehouse.dao;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productRepository")
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(" SELECT p " +
            " FROM Product p " +
            " WHERE (:idSupplier = 0 OR p.idSupplier = :idSupplier) ")
    List<Product> selectList(@Param("idSupplier") Integer idSupplier);

}
