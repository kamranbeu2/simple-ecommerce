package com.example.simple_ecommerce.repository;

import com.example.simple_ecommerce.model.User;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByEmail(String email);

    boolean existsByUsername(String username);

    Optional<User> findById(Long id);

    <S extends User> S save(S user);

    void deleteById(Long id);

}
