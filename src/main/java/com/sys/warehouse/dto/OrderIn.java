package com.sys.warehouse.dto;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "order_in")
public class OrderIn {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_supplier")
    private Integer idSupplier;

    @Column(name = "id_product")
    private Integer idProduct;

    @Column(name = "total_price")
    private Double name;

    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    private Date createdDate;

}
