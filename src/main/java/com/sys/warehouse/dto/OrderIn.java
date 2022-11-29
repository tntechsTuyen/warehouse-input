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

    @Column(name = "code")
    private String code;

    @Column(name = "id_supplier")
    private Integer idSupplier = 0;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "id_status")
    private Integer idStatus;

    @Column(name = "total_price")
    private Double totalPrice;

    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    private Date createdDate;

}
