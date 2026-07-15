# Phase 04: Template Layer

## Overview
- Priority: HIGH
- Status: pending
- Effort: ~60 phút
- Depends on: Phase 03 (Controllers pass model)

## Context Links
- Model attributes từ controllers:
  - Region pages: `products` (Page<Product>), `currentPage` (int), `region` (String)
  - Product list: `products` (Page<Product>), `currentPage` (int)
  - Product detail: `product` (Product, nullable)

## Implementation Steps

### Step 1: Update product-card.html fragment

**File**: `src/main/resources/templates/fragments/product-card.html`

Refactor fragment để nhận `Product` object thay vì `null`:

```html
<!DOCTYPE html>
<html lang="vi" xmlns:th="http://www.thymeleaf.org">
<body>

<div th:fragment="product-card(product)" class="product-card">
    <img th:src="${product?.imageUrl ?: 'https://via.placeholder.com/250'}"
         th:alt="${product?.name ?: 'Sản phẩm'}"
         class="product-image">
    <div class="product-info">
        <div class="product-category"
             th:text="${product?.category?.name ?: 'Quà Tặng'}">Tên Danh Mục</div>
        <h4 class="product-title"
            th:text="${product?.name ?: 'Tên Sản Phẩm'}">Tên Sản Phẩm Mẫu</h4>
        <div class="product-price"
             th:text="${#numbers.formatDecimal(product?.price ?: 0, 1, 'COMMA', 0, 'POINT')} + ' đ'">
            250,000 đ
        </div>
        <a th:href="@{/products/{id}(id=${product?.id})}" class="btn-add-to-cart">Xem chi tiết</a>
    </div>
</div>

</body>
</html>
```

### Step 2: Update product-list.html

**File**: `src/main/resources/templates/product/product-list.html`

Thay 8 dòng `product-card(null)` bằng `th:each`:

```html
<!-- Product Grid section — replace static cards -->
<section class="product-grid-wrapper">
    <h2 style="margin-top: 0;">Tất Cả Sản Phẩm</h2>
    <div class="product-grid">
        <div th:each="product : ${products.content}"
             th:replace="~{fragments/product-card :: product-card(${product})}">
        </div>
        <!-- Empty state -->
        <div th:if="${products.empty}" style="grid-column: 1/-1; text-align: center; padding: 40px;">
            <p>Chưa có sản phẩm nào.</p>
        </div>
    </div>
    <!-- Pagination -->
    <div class="pagination" th:if="${products.totalPages > 1}">
        <a th:each="i : ${#numbers.sequence(0, products.totalPages - 1)}"
           th:href="@{/products(page=${i})}"
           th:text="${i + 1}"
           th:classappend="${i == currentPage} ? ' active' : ''">1</a>
    </div>
</section>
```

### Step 3: Update region pages (domestic, local, international)

Cả 3 trang có cùng structure. Thay phần `products-showcase-grid` hardcoded:

**Pattern chung** cho section sản phẩm:

```html
<section class="featured-products-section">
    <div class="section-header">
        <h2>🔥 Danh Mục Sản Phẩm Bán Chạy</h2>
        <p>Những set quà tặng độc đáo, chất lượng cao được tuyển chọn nhiều nhất</p>
    </div>

    <div class="products-showcase-grid">
        <div class="showcase-card" th:each="product : ${products.content}">
            <div class="product-img-box">
                <img th:if="${product.imageUrl != null}"
                     th:src="${product.imageUrl}"
                     th:alt="${product.name}"
                     style="width:100%;height:100%;object-fit:cover;">
                <span th:unless="${product.imageUrl != null}">🎁</span>
            </div>
            <div class="product-details">
                <h3 class="product-title" th:text="${product.name}">Tên sản phẩm</h3>
                <p class="product-price-tag"
                   th:text="${#numbers.formatDecimal(product.price, 1, 'COMMA', 0, 'POINT')} + 'đ'">
                    0đ
                </p>
                <div class="product-actions">
                    <a th:href="@{/pay}" class="btn-buy-now">Mua ngay</a>
                    <a th:href="@{/products/{id}(id=${product.id})}" class="btn-view-more">Xem thêm</a>
                </div>
            </div>
        </div>

        <!-- Empty state -->
        <div th:if="${products.empty}"
             style="grid-column: 1/-1; text-align: center; padding: 40px;">
            <p>Chưa có sản phẩm nào trong danh mục này.</p>
        </div>
    </div>

    <!-- Pagination -->
    <div class="pagination" th:if="${products.totalPages > 1}" style="text-align:center; margin-top:20px;">
        <a th:each="i : ${#numbers.sequence(0, products.totalPages - 1)}"
           th:href="@{/{r}(r=${region}, page=${i})}"
           th:text="${i + 1}"
           th:classappend="${i == currentPage} ? ' active' : ''"
           style="margin: 0 4px; padding: 6px 12px; border: 1px solid #ccc; text-decoration: none;">
            1
        </a>
    </div>
</section>
```

> **Giữ nguyên** các section tĩnh bên dưới (category-selection, festival-section) — chúng là editorial content, không cần dynamic.

### Step 4: Update product-detail.html

**File**: `src/main/resources/templates/product/product-detail.html`

Uncomment phần `main` đang bị comment và wire với model:

```html
<main>
    <!-- Guard: nếu product null, hiện thông báo -->
    <div th:unless="${product != null}" style="text-align:center; padding: 80px;">
        <h2>Sản phẩm không tồn tại</h2>
        <a th:href="@{/products}">← Quay lại danh sách</a>
    </div>

    <div th:if="${product != null}" class="guide-main-container">
        <nav class="breadcrumb">
            <a th:href="@{/home}">Trang chủ</a> <span>/</span>
            <a th:href="@{/products}">Sản phẩm</a> <span>/</span>
            <span class="active" th:text="${product.name}">Tên sản phẩm</span>
        </nav>

        <section class="product-intro-section">
            <div class="product-gallery">
                <div class="main-image">
                    <img th:if="${product.imageUrl != null}"
                         th:src="${product.imageUrl}"
                         th:alt="${product.name}"
                         style="width:100%; height:100%; object-fit:cover;">
                    <span th:unless="${product.imageUrl != null}">[ HÌNH ẢNH SẢN PHẨM ]</span>
                </div>
            </div>

            <div class="product-short-info">
                <span class="badge-category"
                      th:text="${product.category?.name ?: 'Quà Tặng'}">Category</span>
                <h1 th:text="${product.name}">Tên sản phẩm</h1>
                <p class="product-status">
                    🟢 Tình trạng:
                    <strong th:text="${product.stockQuantity > 0 ? 'Còn hàng' : 'Hết hàng'}">Còn hàng</strong>
                    | Kho: <span th:text="${product.stockQuantity}">0</span>
                </p>
                <p class="short-description" th:text="${product.description}">Mô tả sản phẩm</p>
                <div class="action-box">
                    <p style="font-size: 1.5rem; font-weight: bold; color: #e74c3c;"
                       th:text="${#numbers.formatDecimal(product.price, 1, 'COMMA', 0, 'POINT')} + ' đ'">
                        0 đ
                    </p>
                    <a th:href="@{/pay}" class="btn-buy-now-detail">Đặt mua sản phẩm này</a>
                </div>
            </div>
        </section>
    </div>
</main>
```

> **Bỏ** static content guide dài (hướng dẫn dùng yến sào...) — đó là hardcoded editorial, không phải product data thật. Giữ lại frame layout, điền data từ DB.

## File Summary

| File | Action |
|---|---|
| `fragments/product-card.html` | Refactor fragment nhận `product` object |
| `product/product-list.html` | `th:each` thay `product-card(null)` + pagination |
| `regions/domestic.html` | `th:each` trong showcase-grid + pagination |
| `regions/local.html` | `th:each` trong showcase-grid + pagination |
| `regions/international.html` | `th:each` trong showcase-grid + pagination |
| `product/product-detail.html` | Wire data từ `product` model, guard null |

## Todo

- [ ] Update `fragments/product-card.html`
- [ ] Update `product/product-list.html`
- [ ] Update `regions/domestic.html`
- [ ] Update `regions/local.html`
- [ ] Update `regions/international.html`
- [ ] Update `product/product-detail.html`
- [ ] Test thủ công tất cả các trang

## Success Criteria

- `/local`, `/domestic`, `/international` hiển thị đúng product từ DB
- `/products` hiển thị grid sản phẩm có pagination
- `/products/1` hiển thị đúng tên, giá, mô tả, ảnh của product id=1
- Pagination hoạt động: click số trang → URL đổi `?page=N` → products thay đổi
- Không có lỗi Thymeleaf trong log
