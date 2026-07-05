# Phase 06 - Admin Panel

## Overview

- **Priority**: Medium
- **Status**: 🔲 Planned
- **Depends on**: Phase 03 (cần ADMIN role)

## Mục tiêu

Trang quản trị cho ADMIN: CRUD sản phẩm, quản lý đơn hàng (cập nhật trạng thái).

## Endpoints Admin

| URL | Method | Mô tả |
|-----|--------|-------|
| `/admin` | GET | Dashboard: thống kê tổng quan |
| `/admin/products` | GET | Danh sách sản phẩm |
| `/admin/products/new` | GET | Form tạo sản phẩm mới |
| `/admin/products` | POST | Lưu sản phẩm mới |
| `/admin/products/{id}/edit` | GET | Form sửa sản phẩm |
| `/admin/products/{id}` | POST | Cập nhật sản phẩm |
| `/admin/products/{id}/delete` | POST | Xóa (hoặc deactivate) sản phẩm |
| `/admin/orders` | GET | Danh sách đơn hàng |
| `/admin/orders/{id}` | GET | Chi tiết đơn hàng |
| `/admin/orders/{id}/status` | POST | Cập nhật trạng thái đơn hàng |

## Implementation Steps

1. Tạo `AdminController` với `@PreAuthorize("hasRole('ADMIN')")` hoặc cấu hình qua SecurityConfig
2. Implement admin product CRUD trong `ProductService` (create, update, delete/deactivate)
3. Implement order management trong `OrderService` (updateStatus)
4. Tạo templates admin:
   - `templates/admin/dashboard.html`
   - `templates/admin/products/list.html`
   - `templates/admin/products/form.html` (dùng chung create/edit)
   - `templates/admin/orders/list.html`
   - `templates/admin/orders/detail.html`
5. Tạo `admin/layout.html` — layout riêng cho admin (sidebar navigation)
6. Upload ảnh sản phẩm: lưu URL (dùng image URL từ internet hoặc static folder đơn giản)

## Todo List

- [ ] Implement AdminController
- [ ] Implement ProductService: CRUD methods
- [ ] Implement OrderService: updateStatus
- [ ] Tạo admin layout (sidebar)
- [ ] Tạo admin/dashboard.html
- [ ] Tạo admin/products/list.html
- [ ] Tạo admin/products/form.html
- [ ] Tạo admin/orders/list.html
- [ ] Tạo admin/orders/detail.html

## Success Criteria

- User thường truy cập /admin → redirect 403 hoặc login
- Admin tạo/sửa/xóa sản phẩm → thay đổi phản ánh ngay trên trang user
- Admin cập nhật trạng thái đơn hàng → user thấy trạng thái mới
