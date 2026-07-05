# Phase 04 - Shopping Cart & Order

## Overview

- **Priority**: High
- **Status**: 🔲 Planned
- **Depends on**: Phase 02, Phase 03

## Mục tiêu

Xây dựng giỏ hàng (lưu trong Session) và luồng đặt hàng. Giỏ hàng dùng Session thay vì DB để đơn giản.

## Thiết kế Giỏ hàng (Session-based Cart)

Lưu giỏ hàng trong `HttpSession` dưới dạng `Map<Long, CartItem>` (key = productId).
Lý do: Đơn giản, không cần DB, phù hợp quy mô nhỏ.

```java
// CartItem (không phải Entity, chỉ là POJO lưu trong session)
class CartItem {
    Long productId;
    String productName;
    BigDecimal price;
    String imageUrl;
    int quantity;
}
```

## Endpoints

| URL | Method | Mô tả |
|-----|--------|-------|
| `/cart` | GET | Xem giỏ hàng |
| `/cart/add/{productId}` | POST | Thêm sản phẩm |
| `/cart/update/{productId}` | POST | Cập nhật số lượng |
| `/cart/remove/{productId}` | POST | Xóa sản phẩm |
| `/orders/checkout` | GET | Trang checkout |
| `/orders/place` | POST | Đặt hàng |
| `/orders` | GET | Lịch sử đơn hàng (của user đang login) |
| `/orders/{id}` | GET | Chi tiết đơn hàng |

## Implementation Steps

1. Tạo `CartItem.java` (POJO, @Serializable)
2. Implement `CartService`:
   - `addItem(HttpSession, Long productId, int quantity)`
   - `removeItem(HttpSession, Long productId)`
   - `updateQuantity(HttpSession, Long productId, int quantity)`
   - `getCart(HttpSession)` → Map<Long, CartItem>
   - `getTotalPrice(HttpSession)` → BigDecimal
   - `clearCart(HttpSession)`

3. Implement `CartController`:
   - GET `/cart` → hiển thị giỏ hàng
   - POST `/cart/add/{productId}` → thêm vào session, redirect back
   - POST `/cart/update`, `/cart/remove`

4. Tạo `templates/cart/cart.html`: bảng sản phẩm, số lượng chỉnh sửa, tổng tiền, nút Checkout

5. Implement `OrderService`:
   - `placeOrder(User user, CartService cart, String shippingAddress, String note)` → tạo Order + OrderItems trong DB
   - `findByUser(User user, Pageable)` → lịch sử đơn hàng
   - `findById(Long id)`

6. Implement `OrderController`:
   - GET `/orders/checkout` → form checkout (địa chỉ giao hàng, ghi chú)
   - POST `/orders/place` → gọi OrderService, clear cart, redirect `/orders`
   - GET `/orders` → danh sách đơn hàng của user
   - GET `/orders/{id}` → chi tiết

7. Tạo templates: `cart/cart.html`, `order/checkout.html`, `order/list.html`, `order/detail.html`

## Todo List

- [ ] Tạo CartItem POJO
- [ ] Implement CartService
- [ ] Implement CartController
- [ ] Tạo cart.html
- [ ] Implement OrderService
- [ ] Implement OrderController
- [ ] Tạo checkout.html
- [ ] Tạo order/list.html + order/detail.html
- [ ] Test full flow: thêm vào giỏ → checkout → đơn hàng xuất hiện trong DB

## Success Criteria

- Thêm sản phẩm vào giỏ, giỏ hàng hiển thị đúng số lượng/tổng tiền
- Đặt hàng → Order được tạo trong DB với status PENDING
- Lịch sử đơn hàng hiển thị đúng
- Giỏ hàng được xóa sau khi đặt hàng thành công
