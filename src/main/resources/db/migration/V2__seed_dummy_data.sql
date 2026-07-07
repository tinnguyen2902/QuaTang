-- V2__seed_dummy_data.sql

-- Insert Categories
INSERT INTO `categories` (`name`, `slug`, `description`, `created_at`) VALUES 
('Điện tử', 'dien-tu', 'Các thiết bị và đồ dùng điện tử', NOW()),
('Thời trang', 'thoi-trang', 'Quần áo và phụ kiện thời trang', NOW()),
('Sách', 'sach', 'Sách và văn học', NOW());

-- Insert Admin User (password is 123456)
INSERT INTO `users` (`username`, `email`, `password`, `full_name`, `phone`, `address`, `role`, `created_at`) VALUES
('admin', 'admin@example.com', '$2a$12$D25Q7L5zG1Fh697/Fk.eA.U5L0s0Z910D/.27m3H1oU4qB66y4Uqi', 'Quản trị viên', '0123456789', '123 Đường Admin', 'ADMIN', NOW());

-- Insert Products
INSERT INTO `products` (`name`, `description`, `price`, `stock_quantity`, `image_url`, `category_id`, `is_active`, `created_at`, `updated_at`) VALUES
('Điện thoại thông minh', 'Mẫu điện thoại thông minh mới nhất với nhiều tính năng nâng cao', 15000000, 50, 'https://loremflickr.com/600/400/smartphone', 1, 1, NOW(), NOW()),
('Máy tính xách tay', 'Máy tính xách tay hiệu năng cao để làm việc và giải trí', 25000000, 30, 'https://loremflickr.com/600/400/laptop', 1, 1, NOW(), NOW()),
('Áo thun', 'Áo thun cotton thoải mái', 150000, 100, 'https://loremflickr.com/600/400/tshirt', 2, 1, NOW(), NOW()),
('Quần Jeans', 'Quần jeans denim xanh cổ điển', 350000, 80, 'https://loremflickr.com/600/400/jeans', 2, 1, NOW(), NOW()),
('Lập trình Java', 'Hướng dẫn toàn diện về Java', 200000, 20, 'https://loremflickr.com/600/400/java,book', 3, 1, NOW(), NOW());
