# Phase 02: Backend Layer

## Overview
- Priority: HIGH
- Status: pending
- Effort: ~45 phút
- Depends on: Phase 01 (V3 migration)

## Context Links
- [Product.java](../src/main/java/com/example/quatang/entity/Product.java)
- [ProductRepository.java](../src/main/java/com/example/quatang/repository/ProductRepository.java)
- [ProductService.java](../src/main/java/com/example/quatang/service/ProductService.java)

## Implementation Steps

### Step 1: Tạo enum RegionType

**File**: `src/main/java/com/example/quatang/entity/enums/RegionType.java`

```java
package com.example.quatang.entity.enums;

public enum RegionType {
    LOCAL,
    DOMESTIC,
    INTERNATIONAL
}
```

### Step 2: Update Product entity — thêm @ElementCollection

**File**: `src/main/java/com/example/quatang/entity/Product.java`

Thêm import và field sau `isActive`:

```java
import com.example.quatang.entity.enums.RegionType;
import java.util.HashSet;
import java.util.Set;

// Trong class Product, thêm field:
@ElementCollection(targetClass = RegionType.class, fetch = FetchType.LAZY)
@CollectionTable(
    name = "product_regions",
    joinColumns = @JoinColumn(name = "product_id")
)
@Enumerated(EnumType.STRING)
@Column(name = "region")
@Builder.Default
private Set<RegionType> regions = new HashSet<>();
```

> **Quan trọng**: Dùng `FetchType.LAZY` để tránh load regions mỗi khi lấy product ở list page. Chỉ fetch khi cần.

### Step 3: Update ProductRepository

**File**: `src/main/java/com/example/quatang/repository/ProductRepository.java`

```java
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
```

> **Tại sao dùng @Query thay vì `findByRegionsContaining`?**
> Spring Data không hỗ trợ tốt `@ElementCollection` với derived query. Dùng JPQL tường minh an toàn hơn và dễ kiểm soát.

### Step 4: Implement ProductService

**File**: `src/main/java/com/example/quatang/service/ProductService.java`

```java
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
```

## Todo

- [ ] Tạo `entity/enums/RegionType.java`
- [ ] Update `entity/Product.java` — thêm `regions` field
- [ ] Update `repository/ProductRepository.java` — thêm 2 query methods
- [ ] Implement `service/ProductService.java` — 3 methods
- [ ] Chạy `./gradlew compileJava` kiểm tra compile không lỗi

## Success Criteria

- `./gradlew compileJava` không có error
- JPA entity map đúng với schema `product_regions` table
- ProductService inject được ProductRepository
