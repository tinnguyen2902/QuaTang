# Scout Report: Database-Driven Pages

## Files To Modify

### Backend
| File | Action | Note |
|---|---|---|
| `src/.../entity/Product.java` | MODIFY | Add @ElementCollection regions |
| `src/.../repository/ProductRepository.java` | MODIFY | Add query methods |
| `src/.../service/ProductService.java` | MODIFY | Implement business logic |
| `src/.../controller/HomeController.java` | MODIFY | Pass model to region pages |
| `src/.../controller/ProductController.java` | MODIFY | Pass product to detail page |

### New Files
| File | Action | Note |
|---|---|---|
| `src/.../entity/enums/RegionType.java` | NEW | Enum: LOCAL, DOMESTIC, INTERNATIONAL |

### Database
| File | Action | Note |
|---|---|---|
| `src/main/resources/db/migration/V3__add_product_regions.sql` | NEW | Junction table + seed data |

### Templates
| File | Action | Note |
|---|---|---|
| `templates/regions/domestic.html` | MODIFY | Replace hardcoded products với th:each |
| `templates/regions/local.html` | MODIFY | Replace hardcoded products với th:each |
| `templates/regions/international.html` | MODIFY | Replace hardcoded products với th:each |
| `templates/product/product-detail.html` | MODIFY | Replace hardcoded data với th:text |
| `templates/product/product-list.html` | MODIFY | Replace product-card(null) với th:each |
| `templates/fragments/product-card.html` | MODIFY | Accept Product object thay vì null |

## Current State Analysis

### product-card.html fragment
- Nhận tham số `productMock` nhưng không dùng → hardcoded text
- Cần refactor để nhận `Product` entity và render dynamic

### Region pages (domestic/local/international)
- Giống hệt nhau về structure
- 4 showcase-card hardcoded
- "Chọn Nhóm Sản Phẩm" section → hardcoded categories

### product-detail.html
- Toàn bộ content bị comment → chỉ có 1 static template hiển thị
- Cần uncomment + wire với DB data

### product-list.html
- Dùng `product-card(null)` × 8 → tất cả null/hardcoded
- Sidebar filter categories cũng hardcoded

## Key Constraints
- Spring Data JPA (JpaRepository pattern) đã được dùng
- Thymeleaf SSR, không có REST endpoint
- `@ElementCollection` cho Many-to-many region → join table `product_regions`
- Pagination: Spring Data `Pageable` + `Page<Product>`
