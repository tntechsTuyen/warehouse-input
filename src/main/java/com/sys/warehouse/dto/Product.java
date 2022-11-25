package com.sys.warehouse.dto;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_supplier")
    private Integer idSupplier;

    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "qty")
    private Integer qty;

}
