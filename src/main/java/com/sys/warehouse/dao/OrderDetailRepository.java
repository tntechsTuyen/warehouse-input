package com.sys.warehouse.dao;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.OrderInDetail;
import com.sys.warehouse.dto.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("orderDetailRepository")
public interface OrderDetailRepository extends JpaRepository<OrderInDetail, Integer> {

    @Query(" SELECT p.id AS id " +
            " , p.code AS code " +
            " , p.name AS name " +
            " , p.price AS price " +
            " , oid.qty AS qty " +
            " , oid.id AS oidId " +
            " FROM OrderInDetail oid " +
            " INNER JOIN Product p ON oid.idProduct = p.id " +
            " WHERE (:idOrder = 0 OR oid.idOrderIn = :idOrder) ")
    List<Map<String, Object>> selectList(@Param("idOrder") Integer idOrder);

}
