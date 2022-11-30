package com.sys.warehouse.dto;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "supplier")
public class Supplier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "code", unique=true)
    private String code = "";

    @Column(name = "name")
    private String name = "";

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    public Supplier(){}

    public Supplier(String code, String name){
        this.code = code;
        this.name = name;
    }

    public Supplier(String code, String name, String address, String phone) {
        this.code = code;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }
}
