package com.sys.warehouse.dao;

import com.sys.warehouse.dto.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("supplierRepository")
public interface SupplierRepository extends JpaRepository<Supplier, Integer> {

    @Query(" SELECT s FROM Supplier s " +
            " WHERE (:code = '' OR s.code = :code) " +
            " AND (:name = '' OR s.name LIKE %:name%) ")
    List<Supplier> selectList(@Param("code") String code, @Param("name") String name);

}
