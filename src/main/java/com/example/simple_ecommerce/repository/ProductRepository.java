package com.example.simple_ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.simple_ecommerce.model.Product;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findByName(String name);

    boolean existsByName(String name);

    <S extends Product> S save(S product);

    void deleteById(Long id);
}
