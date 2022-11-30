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

    @Column(name = "code", unique = true)
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "qty")
    private Integer qty = 0;

    @Column(name = "price")
    private Integer price;

    public Product(){}

    public Product(Integer idSupplier){
        this.idSupplier = idSupplier;
    }

    public Product(Integer idSupplier, String code, String name, Integer qty, Integer price) {
        this.idSupplier = idSupplier;
        this.code = code;
        this.name = name;
        this.qty = qty;
        this.price = price;
    }
}
