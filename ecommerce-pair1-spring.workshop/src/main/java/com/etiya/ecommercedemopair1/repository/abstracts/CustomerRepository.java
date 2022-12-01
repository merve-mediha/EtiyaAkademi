package com.etiya.ecommercedemopair1.repository.abstracts;

import com.etiya.ecommercedemopair1.entities.concretes.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {
}
