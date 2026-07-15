package com.example.quatang.repository;

import com.example.quatang.entity.Product;
import com.example.quatang.entity.enums.RegionType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    // Lấy products theo region có pagination
    @Query("SELECT p FROM Product p JOIN p.regions r WHERE r = :region AND p.isActive = true")
    Page<Product> findByRegion(@Param("region") RegionType region, Pageable pageable);

    // Lấy tất cả products active (dùng cho product-list page)
    Page<Product> findByIsActiveTrue(Pageable pageable);
}
