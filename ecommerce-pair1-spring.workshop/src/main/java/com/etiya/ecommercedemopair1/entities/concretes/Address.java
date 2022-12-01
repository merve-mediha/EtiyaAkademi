package com.etiya.ecommercedemopair1.entities.concretes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="addresses")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="postalcode")
    private int postalcode;

    @Column(name="street")
    private String street;

    @Column(name="title")
    private String title;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @OneToOne
    @JoinColumn(name="city_id")
    private City city;

    @OneToOne
    @JoinColumn(name="country_id")
    private Country country;

    @OneToMany(mappedBy = "address")
    private List<Order> orders;






}
