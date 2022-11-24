package com.sys.warehouse.dto;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

@Data
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "username", unique=true)
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "birth")
    private Date birth;

    @Column(name = "gender")
    private Integer gender;

    @Column(name = "role")
    private String role;

    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    private Date createdDate;

}
