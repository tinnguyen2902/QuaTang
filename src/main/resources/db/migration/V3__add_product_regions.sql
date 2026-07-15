-- V3__add_product_regions.sql

-- 1. Tạo bảng junction cho many-to-many product ↔ region
CREATE TABLE `product_regions` (
  `product_id` BIGINT NOT NULL,
  `region`     ENUM('LOCAL', 'DOMESTIC', 'INTERNATIONAL') NOT NULL,
  PRIMARY KEY (`product_id`, `region`),
  CONSTRAINT `fk_product_regions_product`
    FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Thêm categories mới cho LOCAL và INTERNATIONAL
INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`) VALUES
(4, 'Đặc Sản Địa Phương', 'dac-san-dia-phuong', 'Quà tặng đặc sản vùng miền Việt Nam', NOW()),
(5, 'Quà Tặng Quốc Tế',  'qua-tang-quoc-te',   'Sản phẩm nhập khẩu từ nước ngoài',   NOW());

-- 3. Thêm products mới: LOCAL region (6 sản phẩm)
INSERT INTO `products`
  (`name`, `description`, `price`, `stock_quantity`, `image_url`, `category_id`, `is_active`, `created_at`, `updated_at`)
VALUES
('Set Trà Hoa Khô & Nến Thơm',       'Combo trà hoa khô Đà Lạt và nến thơm thiên nhiên, hộp gỗ sang trọng',        450000,  50, 'https://loremflickr.com/600/400/tea,candle',     4, 1, NOW(), NOW()),
('Hộp Quà Cà Phê & Ly Bát Tràng',   'Cà phê phin giấy kết hợp ly sứ Bát Tràng thủ công truyền thống',             550000,  40, 'https://loremflickr.com/600/400/coffee,pottery', 4, 1, NOW(), NOW()),
('Combo Gấu Bông & Hoa Sáp Sinh Nhật','Gấu bông cao cấp kèm hoa sáp thơm mãi mãi, phù hợp quà tặng sinh nhật',    320000,  80, 'https://loremflickr.com/600/400/bear,flower',    4, 1, NOW(), NOW()),
('Set Mật Ong Rừng & Thảo Mộc',      'Mật ong nguyên chất kèm các loại thảo mộc tốt cho sức khỏe',                 680000,  30, 'https://loremflickr.com/600/400/honey,herb',     4, 1, NOW(), NOW()),
('Hộp Bánh Mứt Tết Cao Cấp',         'Tổng hợp bánh mứt truyền thống, hộp thiếc in hoa văn cổ điển',               890000,  20, 'https://loremflickr.com/600/400/candy,box',      4, 1, NOW(), NOW()),
('Set Gốm Sứ Bát Tràng',             'Bộ ấm chén gốm sứ Minh Long thủ công, họa tiết chỉ vàng tinh xảo',          1200000, 15, 'https://loremflickr.com/600/400/ceramic,cup',    4, 1, NOW(), NOW());

-- 4. Thêm products mới: DOMESTIC region (6 sản phẩm - giao toàn quốc)
INSERT INTO `products`
  (`name`, `description`, `price`, `stock_quantity`, `image_url`, `category_id`, `is_active`, `created_at`, `updated_at`)
VALUES
('Hộp Quà Tết Rượu Vang & Hạt',      'Rượu vang nhập khẩu kèm hộp hạt dinh dưỡng cao cấp, thiết kế sang trọng',  1250000, 25, 'https://loremflickr.com/600/400/wine,gift',      1, 1, NOW(), NOW()),
('Set Quà Sức Khỏe Yến Sào',         'Yến sào Khánh Hòa chính hãng, đóng hộp gỗ lót lụa, tặng kèm đông trùng',  2500000, 10, 'https://loremflickr.com/600/400/health,gift',    4, 1, NOW(), NOW()),
('Combo Điện Thoại & Tai Nghe',       'Điện thoại flagship kèm tai nghe không dây cao cấp, hộp quà đặc biệt',     15000000,5,  'https://loremflickr.com/600/400/phone,earphone', 1, 1, NOW(), NOW()),
('Bộ Mỹ Phẩm Thiên Nhiên Cao Cấp',   'Serum + kem dưỡng + mặt nạ, chiết xuất thảo mộc thiên nhiên Việt Nam',      750000,  35, 'https://loremflickr.com/600/400/cosmetic,natural',2,1, NOW(), NOW()),
('Set Sách Bán Chạy Tháng Này',       'Combo 3 cuốn sách best-seller được tuyển chọn bởi chuyên gia',               350000,  60, 'https://loremflickr.com/600/400/book,stack',     3, 1, NOW(), NOW()),
('Hộp Quà Văn Phòng Cao Cấp',        'Bộ đồ dùng văn phòng premium: bút, sổ tay, chuột không dây, đèn led',       980000,  20, 'https://loremflickr.com/600/400/office,stationery',1,1,NOW(), NOW());

-- 5. Thêm products mới: INTERNATIONAL region (6 sản phẩm)
INSERT INTO `products`
  (`name`, `description`, `price`, `stock_quantity`, `image_url`, `category_id`, `is_active`, `created_at`, `updated_at`)
VALUES
('Set Trà Nhật Matcha Premium',       'Bộ trà matcha Nhật Bản thượng hạng kèm chén sứ và phới đánh matcha truyền thống',1800000,15,'https://loremflickr.com/600/400/matcha,japan',  5, 1, NOW(), NOW()),
('Nước Hoa Pháp Chính Hãng',         'Nước hoa cao cấp nhập khẩu từ Paris, hương thơm thanh lịch lâu phai',       3500000, 8,  'https://loremflickr.com/600/400/perfume,france', 5, 1, NOW(), NOW()),
('Hộp Chocolate Bỉ Cao Cấp',         'Chocolate thủ công Bỉ với 24 viên đa vị, hộp kim loại sang trọng',           1200000, 20, 'https://loremflickr.com/600/400/chocolate,belgium',5,1,NOW(), NOW()),
('Đồng Hồ Thụy Sĩ Mini',            'Đồng hồ để bàn cơ Thụy Sĩ, vỏ đồng nguyên khối, quà tặng doanh nhân',      4500000, 5,  'https://loremflickr.com/600/400/watch,swiss',    5, 1, NOW(), NOW()),
('Bộ Mỹ Phẩm Hàn Quốc K-Beauty',    'Bộ skincare 5 bước Hàn Quốc, thương hiệu cao cấp, phù hợp mọi loại da',     2200000, 18, 'https://loremflickr.com/600/400/skincare,korea', 5, 1, NOW(), NOW()),
('Ví Da Ý Handmade',                  'Ví da bò thật Ý, khâu tay thủ công, in tên cá nhân theo yêu cầu',           3800000, 10, 'https://loremflickr.com/600/400/leather,wallet', 5, 1, NOW(), NOW());

-- 6. Gán region cho sản phẩm cũ (V2 products, id 1-5)
INSERT INTO `product_regions` (`product_id`, `region`) VALUES
(1, 'DOMESTIC'),      -- Điện thoại thông minh
(1, 'INTERNATIONAL'), -- cũng có ở international
(2, 'DOMESTIC'),      -- Máy tính xách tay
(3, 'DOMESTIC'),      -- Áo thun
(3, 'LOCAL'),         -- Áo thun cũng LOCAL
(4, 'DOMESTIC'),      -- Quần Jeans
(5, 'LOCAL'),         -- Lập trình Java (LOCAL)
(5, 'DOMESTIC');      -- cũng DOMESTIC

-- 7. Gán region cho sản phẩm LOCAL mới (id 6-11)
INSERT INTO `product_regions` (`product_id`, `region`)
SELECT id, 'LOCAL' FROM `products` WHERE name IN (
  'Set Trà Hoa Khô & Nến Thơm',
  'Hộp Quà Cà Phê & Ly Bát Tràng',
  'Combo Gấu Bông & Hoa Sáp Sinh Nhật',
  'Set Mật Ong Rừng & Thảo Mộc',
  'Hộp Bánh Mứt Tết Cao Cấp',
  'Set Gốm Sứ Bát Tràng'
);

-- 8. Gán region cho sản phẩm DOMESTIC mới (id 12-17)
INSERT INTO `product_regions` (`product_id`, `region`)
SELECT id, 'DOMESTIC' FROM `products` WHERE name IN (
  'Hộp Quà Tết Rượu Vang & Hạt',
  'Set Quà Sức Khỏe Yến Sào',
  'Combo Điện Thoại & Tai Nghe',
  'Bộ Mỹ Phẩm Thiên Nhiên Cao Cấp',
  'Set Sách Bán Chạy Tháng Này',
  'Hộp Quà Văn Phòng Cao Cấp'
);

-- 9. Gán region cho sản phẩm INTERNATIONAL mới (id 18-23)
INSERT INTO `product_regions` (`product_id`, `region`)
SELECT id, 'INTERNATIONAL' FROM `products` WHERE name IN (
  'Set Trà Nhật Matcha Premium',
  'Nước Hoa Pháp Chính Hãng',
  'Hộp Chocolate Bỉ Cao Cấp',
  'Đồng Hồ Thụy Sĩ Mini',
  'Bộ Mỹ Phẩm Hàn Quốc K-Beauty',
  'Ví Da Ý Handmade'
);
