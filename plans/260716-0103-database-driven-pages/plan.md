---
title: Database-Driven Pages
description: Thay dữ liệu hardcoded trong HTML bằng dữ liệu từ TiDB Cloud database
status: completed
priority: high
effort: medium
branch: feat/database-driven-pages
tags: [spring-boot, thymeleaf, jpa, flyway, database]
created: 2026-07-16T01:03:00+07:00
---

# Database-Driven Pages

Kết nối 5 trang HTML đang dùng dữ liệu hardcoded với TiDB Cloud database qua Spring Data JPA + Thymeleaf SSR.

## Phases

| Phase | Tên | Status | Files |
|---|---|---|---|
| 01 | DB Migration (V3) | completed | V3__add_product_regions.sql |
| 02 | Backend Layer | completed | RegionType, Product, ProductRepository, ProductService |
| 03 | Controller Layer | completed | HomeController, ProductController |
| 04 | Template Layer | completed | 6 HTML files |

## Dependencies

- Phase 02 phụ thuộc Phase 01 (entity map với schema mới)
- Phase 03 phụ thuộc Phase 02 (service cần có trước)
- Phase 04 phụ thuộc Phase 03 (template cần biết model attributes)
- Phases phải chạy tuần tự

## Key Decisions

- Region: many-to-many qua bảng `product_regions` (junction table)
- Mapping: `@ElementCollection` + `@CollectionTable` trên `Product` entity
- Query: `findByRegionsContaining(RegionType, Pageable)`
- Pagination: 12 items/page, Spring Data `Page<Product>`
- Rendering: Thymeleaf SSR thuần

## Files

- [phase-01-db-migration.md](./phase-01-db-migration.md)
- [phase-02-backend-layer.md](./phase-02-backend-layer.md)
- [phase-03-controller-layer.md](./phase-03-controller-layer.md)
- [phase-04-template-layer.md](./phase-04-template-layer.md)
- [reports/scout-database-driven-pages.md](./reports/scout-database-driven-pages.md)
