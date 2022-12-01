package com.etiya.ecommercedemopair1.business.abstracts;

import com.etiya.ecommercedemopair1.entities.concretes.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getAll();
    Customer getById(int id);
}
