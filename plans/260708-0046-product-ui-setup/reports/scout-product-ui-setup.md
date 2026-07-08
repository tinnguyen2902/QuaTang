# Scout Report: Product UI Setup

## Files Analyze
- **`src/main/resources/templates/home.html`**: Trang chủ hiện tại, chứa cấu trúc header, thẻ tìm kiếm, giỏ hàng, thông báo. Dòng 9 đến 38 là `<header>`, dòng 75 đến 117 là `<footer>`. Sẽ được trích xuất thành fragment.
- **`src/main/resources/static/css/home.css`**: Chứa toàn bộ CSS hiện hành. Có thể cần tách file `common.css` cho các layout chung (header, footer) và `product.css` cho UI sản phẩm cụ thể.
- **`src/main/resources/db/migration/V1__init_schema.sql`**: Bảng `products` có `id`, `name`, `price`, `image_url`, `stock_quantity`, `description`. 

## Tình trạng Architecture
- Hiện tại chưa có `ProductController` (như được note trong `codebase-summary.md` là placeholder rỗng).
- UI HTML/CSS cho phần danh sách sản phẩm và chi tiết chưa tồn tại.
- CSS chưa được mô-đun hóa (tách common/layout).

## Hướng giải quyết
1. **Refactoring Layout**: Tạo thư mục `templates/fragments/`, tạo `header.html`, `footer.html`. Áp dụng cho các file có sẵn. Tách `common.css`.
2. **Product List UI**: Tạo `product-list.html`. Thiết kế sidebar, grid, product card.
3. **Product Detail UI**: Tạo `product-detail.html`. Thiết kế ảnh, giá, mô tả, nút Add to Cart.
