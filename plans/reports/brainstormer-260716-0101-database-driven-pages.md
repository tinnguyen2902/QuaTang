# Brainstorm: Thay Dữ Liệu Tĩnh Bằng Database

**Date**: 2026-07-16 | **Scope**: All product pages

---

## Problem Statement

Các trang hiện tại (`domestic`, `international`, `local`, `product-list`, `product-detail`) đang dùng **dữ liệu hardcoded trong HTML**. Controllers/Services đều là placeholder rỗng. DB đã có schema (Flyway V1+V2) nhưng chưa được dùng để render.

---

## Quyết Định Xác Nhận

| # | Quyết định | Kết quả |
|---|---|---|
| 1 | Phạm vi trang | Tất cả: domestic, international, local, product-list, product-detail |
| 2 | Phân loại region | Thêm cột `region` vào bảng `products` |
| 3 | Cardinality region | Many-to-many (1 sản phẩm → nhiều region) |
| 4 | Pagination | Có – 12 sản phẩm/trang |
| 5 | Product detail data | Đầy đủ: tên, giá, mô tả, ảnh, category, reviews |
| 6 | Migration strategy | Flyway V3 mới |
| 7 | Rendering | Thymeleaf SSR thuần |

---

## Kiến Trúc Đề Xuất

### 1. Database Schema (Flyway V3)

Do region là Many-to-many, dùng bảng junction thay vì cột đơn:

```sql
CREATE TABLE product_regions (
  product_id BIGINT NOT NULL,
  region     ENUM('LOCAL', 'DOMESTIC', 'INTERNATIONAL') NOT NULL,
  PRIMARY KEY (product_id, region),
  FOREIGN KEY (product_id) REFERENCES products(id)
);
-- Seed region cho sản phẩm hiện có + thêm sản phẩm mới đủ 3 region
```

### 2. Entity Layer

Dùng `@ElementCollection` trên `Product` – không cần entity riêng:

```java
@ElementCollection(targetClass = RegionType.class)
@CollectionTable(name = "product_regions", joinColumns = @JoinColumn(name = "product_id"))
@Enumerated(EnumType.STRING)
@Column(name = "region")
private Set<RegionType> regions = new HashSet<>();
```

### 3. Repository → Service → Controller

```
ProductRepository.findByRegionsContaining(region, pageable)
  → ProductService.getProductsByRegion(region, page, size): Page<Product>
  → HomeController.domesticPage(model, page) → model.addAttribute("products", ...)
  → Thymeleaf th:each render
```

### 4. Template Changes

Thay hardcoded HTML bằng Thymeleaf:

```html
<div th:each="product : ${products.content}" class="showcase-card">
  <h3 th:text="${product.name}"></h3>
  <p th:text="${product.price} + 'đ'"></p>
  <a th:href="@{/products/{id}(id=${product.id})}">Xem thêm</a>
</div>
<!-- Pagination -->
<a th:each="i : ${#numbers.sequence(0, products.totalPages-1)}"
   th:href="@{/domestic(page=${i})}" th:text="${i+1}"></a>
```

---

## Risks & Mitigations

| Risk | Mitigation |
|---|---|
| V2 seed không có region → trang rỗng | V3 gán region cho toàn bộ sản phẩm hiện có |
| N+1 query với @ElementCollection ở list page | Dùng JOIN FETCH hoặc DTO projection |
| Product detail thiếu review → NPE | Service null-safe, template dùng th:if |

---

## Implementation Phases

- **Phase 1**: Flyway V3 – bảng `product_regions` + seed data
- **Phase 2**: Backend – `RegionType` enum, update `Product` entity, `ProductRepository`, `ProductService`
- **Phase 3**: Controllers – update `HomeController`, `ProductController`
- **Phase 4**: Templates – update 5 trang HTML

---

## Success Criteria

- [ ] /domestic, /local, /international hiển thị đúng sản phẩm từ DB
- [ ] Pagination 12 items/trang hoạt động
- [ ] /products/{id} hiển thị đầy đủ thông tin từ DB
- [ ] Không còn hardcoded data trong HTML
- [ ] Không có N+1 query
