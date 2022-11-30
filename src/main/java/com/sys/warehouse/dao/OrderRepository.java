package com.sys.warehouse.dao;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("orderRepository")
public interface OrderRepository extends JpaRepository<OrderIn, Integer> {

    @Query(" SELECT oi " +
            " FROM OrderIn oi " +
            " WHERE (:idSupplier = 0 OR oi.idSupplier = :idSupplier) ")
    List<OrderIn> selectList(@Param("idSupplier") Integer idSupplier);

    @Modifying
    @Transactional
    @Query(" UPDATE OrderIn " +
            " SET totalPrice = ( " +
            " SELECT SUM(p.price * oid.qty) " +
            " FROM OrderInDetail oid " +
            " INNER JOIN Product p ON oid.idProduct = p.id " +
            " WHERE oid.idOrderIn = :id " +
            " ) " +
            " WHERE id = :id ")
    void updatePrice(@Param("id") Integer id);
}
