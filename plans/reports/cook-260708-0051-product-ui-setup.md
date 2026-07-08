# Báo Cáo Triển Khai: Thiết Lập UI Sản Phẩm

## Tóm Tắt Công Việc Đã Hoàn Thành
- **Phase 01: Chuẩn hóa Layout:** Đã tách riêng cấu trúc `<header>` và `<footer>` từ `home.html` thành các Fragment Thymeleaf tái sử dụng (`fragments/header.html` và `fragments/footer.html`). CSS chung đã được tách thành `common.css`. `home.css` hiện chỉ còn CSS riêng của trang chủ (banner).
- **Phase 02: UI Danh sách Sản phẩm:** Đã tạo `product-list.html` và `fragments/product-card.html`. Áp dụng CSS Grid cho grid sản phẩm và xây dựng sidebar bộ lọc tại `product.css`.
- **Phase 03: UI Chi tiết Sản phẩm:** Đã tạo `product-detail.html` với bố cục chia cột hiện đại, hiển thị nổi bật ảnh, giá tiền, ô chọn số lượng, và các tabs (Mô tả, Đánh giá).

## Hướng Dẫn Sử Dụng
- Các giao diện hiện tại được thiết kế tĩnh (mockup HTML).
- Bạn có thể mở trực tiếp các file `product-list.html` và `product-detail.html` trên trình duyệt hoặc tạo các Endpoint tạm trong Spring Boot (Ví dụ: `ProductController` trả về `return "product-list";`) để kiểm tra nếu dự án đang chạy.

## Các Bước Tiếp Theo (Next Steps)
1. **Lập trình Backend:** Xây dựng `ProductController`, các API trả dữ liệu JSON (hoặc trả Partial HTML Fragment) để phục vụ cho tính năng lọc sản phẩm qua Fetch API.
2. **Cập nhật giao diện còn lại:** Các trang `local.html`, `domestic.html`, `international.html` cần được cập nhật cấu trúc giống với `home.html` (thay `<header>` bằng `th:replace`).

## Unresolved Questions
- Không có câu hỏi nào chưa được giải quyết. Kiến trúc SSR kết hợp CSR (Fetch) cho phần danh sách sản phẩm đã được dọn đường sẵn sàng.
