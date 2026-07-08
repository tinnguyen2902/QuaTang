# Phase 02: Xây dựng UI Danh sách Sản phẩm

## Overview
- **Priority**: High
- **Status**: Pending
- **Description**: Thiết kế và triển khai mã HTML/CSS tĩnh cho trang Danh sách sản phẩm, làm nền tảng cho việc đổ dữ liệu động từ Backend và xử lý qua Fetch API sau này.

## Key Insights
- Sử dụng CSS Grid cho thẻ sản phẩm giúp tự động xuống dòng và đảm bảo kích thước đều nhau (responsive dễ dàng).
- UI cần khu vực Sidebar cho chức năng lọc.

## Requirements
- Giao diện gồm 2 phần chính: Sidebar bên trái (300px hoặc tỷ lệ 1/4), Khu vực grid sản phẩm bên phải (tỷ lệ 3/4).
- Product Card bao gồm: Hình ảnh (tỷ lệ chuẩn, e.g. 1:1), Tên sản phẩm, Giá, Nút Add to Cart.

## Related Code Files
- `[NEW]` `src/main/resources/templates/product-list.html`
- `[NEW]` `src/main/resources/static/css/product.css`
- `[NEW]` `src/main/resources/templates/fragments/product-card.html` (Thymeleaf fragment để có thể tái sử dụng hoặc gọi riêng qua API)

## Implementation Steps
1. Khởi tạo `product-list.html`, kế thừa `common.css` và dùng lại `header`, `footer` từ `fragments`.
2. Link thêm `product.css` vào `product-list.html`.
3. Xây dựng cấu trúc HTML cho Sidebar (`.product-sidebar`): Khối Categories, Khối Lọc Giá.
4. Xây dựng khối HTML cho Grid (`.product-grid`).
5. Tạo `fragments/product-card.html` với cấu trúc HTML tĩnh (Mockup) chứa ảnh, tên, giá, nút bấm. Dùng `th:fragment="product-card"`.
6. Include nhiều thẻ mock product-card vào `.product-grid` trong `product-list.html` để kiểm tra CSS Grid.
7. Viết CSS (Grid layout, hover effects cho ảnh/nút) trong `product.css`.

## Todo List
- [ ] Tạo file HTML và CSS tĩnh.
- [ ] Tạo `product-card` fragment.
- [ ] Kiểm tra tính tương thích và Responsive cơ bản (Flexbox/Grid).

## Success Criteria
- Xem trang tĩnh trên trình duyệt, các khối hiển thị đúng bố cục, thẻ sản phẩm đều nhau, hiệu ứng hover mượt mà.
