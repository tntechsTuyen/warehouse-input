package com.sys.warehouse.dao;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderRepository")
public interface OrderRepository extends JpaRepository<OrderIn, Integer> {

    @Query(" SELECT oi " +
            " FROM OrderIn oi " +
            " WHERE (:idSupplier = 0 OR oi.idSupplier = :idSupplier) ")
    List<OrderIn> selectList(@Param("idSupplier") Integer idSupplier);

}
