package com.sys.warehouse.dao;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Repository("orderRepository")
public interface OrderRepository extends JpaRepository<OrderIn, Integer> {

    @Query(" SELECT oi " +
            " FROM OrderIn oi " +
            " WHERE (:idSupplier = 0 OR oi.idSupplier = :idSupplier) ")
    List<OrderIn> selectList(@Param("idSupplier") Integer idSupplier);

    @Query(" SELECT oi.id AS orderId " +
            " , oi.code AS orderCode " +
            " , oi.idStatus AS orderIdStatus " +
            " , oi.createdDate AS orderCreatedDate " +
            " , u.fullName AS userName " +
            " , u.phone AS userPhone " +
            " , u.address AS userAddress " +
            " , s.name AS supplierName " +
            " , s.phone AS supplierPhone " +
            " , s.address AS supplierAddress " +
            " FROM OrderIn oi " +
            " INNER JOIN User u ON oi.idUser = u.id " +
            " INNER JOIN Supplier s ON oi.idSupplier = s.id " +
            " WHERE oi.id = :id ")
    Map<String, Object> selectInfoById(@Param("id") Integer id);

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
