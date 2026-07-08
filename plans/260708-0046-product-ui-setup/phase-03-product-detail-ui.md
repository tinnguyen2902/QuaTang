# Phase 03: Xây dựng UI Chi tiết Sản phẩm

## Overview
- **Priority**: High
- **Status**: Pending
- **Description**: Thiết kế giao diện chi tiết khi người dùng bấm vào một sản phẩm từ danh sách.

## Key Insights
- Cần có Breadcrumb để người dùng dễ định vị.
- Chia bố cục Top section (2 cột: Trái Ảnh - Phải Info) và Bottom section (Tab Mô tả/Review).

## Requirements
- Giao diện thân thiện, nút "Thêm vào giỏ" to, nổi bật để kích thích mua hàng (Conversion Rate Optimization).
- Có input chọn số lượng (+ / -).
- Bố trí khối "Sản phẩm liên quan" bên dưới cùng.

## Related Code Files
- `[NEW]` `src/main/resources/templates/product-detail.html`
- `[MODIFY]` `src/main/resources/static/css/product.css` (Dùng chung CSS cho Product domain)

## Implementation Steps
1. Khởi tạo `product-detail.html`, sử dụng lại Header/Footer.
2. Thêm HTML Breadcrumb (ví dụ: `Trang chủ > Quà sinh nhật > Hộp âm nhạc gỗ`).
3. Dựng CSS Flexbox cho Top Section: `.product-detail-top` (chia 50% - 50%).
4. Khối Left: Chứa thẻ `<img>` ảnh to, bên dưới là list ảnh thu nhỏ (thumbnail gallery - mockup tĩnh).
5. Khối Right: Tiêu đề H1, Label trạng thái (Còn hàng), Giá (chữ to, màu đỏ/cam nổi bật), đoạn mô tả ngắn. Khối Action chứa nút `-`, ô input số lượng, nút `+` và Nút `Thêm vào giỏ hàng`.
6. Xây dựng HTML Bottom Section: `.product-detail-tabs`. Gồm phần nội dung chi tiết bài viết (text dài) và danh sách reviews mockup.
7. Chèn một khối `.related-products` gọi lại `fragments/product-card` để hiển thị 4 sản phẩm liên quan.

## Todo List
- [ ] Tạo `product-detail.html`.
- [ ] Viết CSS bổ sung vào `product.css`.
- [ ] Hoàn thiện Mockup UI tĩnh.

## Success Criteria
- Bố cục gọn gàng, rõ ràng.
- Nút bấm và Typography cho Giá tiền nổi bật.
- Giao diện giống với các trang E-commerce chuẩn mực hiện nay.
