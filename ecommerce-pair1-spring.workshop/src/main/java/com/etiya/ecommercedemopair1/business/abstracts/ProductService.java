package com.etiya.ecommercedemopair1.business.abstracts;

import com.etiya.ecommercedemopair1.entities.concretes.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAll();
    Product getById(int id);
}
