# Phase 01: Chuẩn hóa Layout và CSS (Refactor Layout)

## Overview
- **Priority**: High
- **Status**: Pending
- **Description**: Tách cấu trúc trang hiện tại (Header/Footer) thành các Fragments của Thymeleaf để tái sử dụng trong toàn bộ dự án, tránh code lặp lại.

## Key Insights
- Cấu trúc `<header>` và `<footer>` hiện tại được copy nguyên xi ở `home.html`, `local.html`, `domestic.html`, `international.html`. 
- Cần tách file `common.css` cho các layout toàn cục thay vì dồn tất cả vào `home.css`.

## Requirements
- Khởi tạo thư mục `src/main/resources/templates/fragments/`.
- File fragments phải load đúng CSS và hỗ trợ chèn `th:replace` dễ dàng.

## Related Code Files
- `[MODIFY]` `src/main/resources/templates/home.html`
- `[MODIFY]` `src/main/resources/static/css/home.css`
- `[NEW]` `src/main/resources/templates/fragments/header.html`
- `[NEW]` `src/main/resources/templates/fragments/footer.html`
- `[NEW]` `src/main/resources/static/css/common.css`

## Implementation Steps
1. Khởi tạo thư mục `fragments` bên trong `templates`.
2. Tạo file `header.html`, copy toàn bộ khối `<header>` từ `home.html` sang và định nghĩa `th:fragment="header"`.
3. Tạo file `footer.html`, copy toàn bộ khối `<footer>` từ `home.html` sang và định nghĩa `th:fragment="footer"`.
4. Tạo `common.css`, chuyển các CSS class liên quan đến Header (`.header-top`, `.search-bar`, `.header-menu`...) và Footer (`.footer-grid`, `.footer-section`...) từ `home.css` sang `common.css`.
5. Cập nhật `home.html` để sử dụng `th:replace="fragments/header :: header"` và `th:replace="fragments/footer :: footer"`. Đồng thời import `common.css`.

## Todo List
- [ ] Tạo `fragments/header.html`
- [ ] Tạo `fragments/footer.html`
- [ ] Tạo `common.css` và chuyển code CSS tương ứng
- [ ] Cập nhật `home.html`

## Success Criteria
- Kiểm tra trực quan trang chủ không có sự thay đổi nào về giao diện so với ban đầu.
- Mã nguồn HTML của `home.html` ngắn gọn, không chứa code header/footer trực tiếp.
