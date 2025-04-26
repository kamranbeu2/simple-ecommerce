package com.example.simple_ecommerce.product.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.simple_ecommerce.product.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findByName(String name);

    boolean existsByName(String name);

    <S extends Product> S save(S product);

    void deleteById(Long id);
}
