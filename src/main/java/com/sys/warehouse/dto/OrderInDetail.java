package com.sys.warehouse.dto;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "order_in_detail")
public class OrderInDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_order_in")
    private Integer idOrderIn;

    @Column(name = "id_product")
    private Integer idProduct;

    @Column(name = "qty")
    private Integer qty;

    @Column(name = "price")
    private Double price;

}
