package com.example.quatang.service;

import com.example.quatang.entity.Product;
import com.example.quatang.entity.enums.RegionType;
import com.example.quatang.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private static final int PAGE_SIZE = 12;

    /**
     * Lấy danh sách sản phẩm theo region, có phân trang.
     */
    public Page<Product> getProductsByRegion(RegionType region, int page) {
        PageRequest pageable = PageRequest.of(page, PAGE_SIZE, Sort.by("createdAt").descending());
        return productRepository.findByRegion(region, pageable);
    }

    /**
     * Lấy tất cả sản phẩm active (product-list page).
     */
    public Page<Product> getAllProducts(int page) {
        PageRequest pageable = PageRequest.of(page, PAGE_SIZE, Sort.by("createdAt").descending());
        return productRepository.findByIsActiveTrue(pageable);
    }

    /**
     * Lấy chi tiết 1 sản phẩm.
     */
    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }
}
