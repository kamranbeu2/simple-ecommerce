package com.example.simple_ecommerce.product.controller;

import com.example.simple_ecommerce.product.model.Product;
import com.example.simple_ecommerce.product.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(ProductController.class)
public class ProductControllerTest {

        @Autowired
        private MockMvc mockMvc;

        @MockitoBean
        private ProductRepository productRepository;

        @Test
        public void testGetAllProducts() throws Exception {
                Product product = new Product(1L, "Test Product", "Test Description", new BigDecimal("99.99"),
                                LocalDateTime.now());
                when(productRepository.findAll()).thenReturn(Arrays.asList(product));

                mockMvc.perform(get("/api/products/"))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$[0].name").value("Test Product"));
        }

        @Test
        public void testGetProductById_Found() throws Exception {
                Product product = new Product(1L, "Test Product", "Test Description", new BigDecimal("99.99"),
                                LocalDateTime.now());
                when(productRepository.findById(anyLong())).thenReturn(Optional.of(product));

                mockMvc.perform(get("/api/products/1"))
                                .andExpect(status().isOk())
                                .andExpect(jsonPath("$.name").value("Test Product"));
        }

        @Test
        public void testGetProductById_NotFound() throws Exception {
                when(productRepository.findById(anyLong())).thenReturn(Optional.empty());

                mockMvc.perform(get("/api/products/999"))
                                .andExpect(status().isNotFound());
        }
}