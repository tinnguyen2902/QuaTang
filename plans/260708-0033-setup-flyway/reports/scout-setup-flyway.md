# Scout Report: Flyway Setup

## Overview
Analyzed codebase to prepare for Flyway setup and database migration.

## Files Examined
- `build.gradle`: Missing Flyway dependencies.
- `src/main/resources/application.properties`: Uses `spring.jpa.hibernate.ddl-auto=update` which needs to be changed.
- Entity schema extracted from recent Hibernate logs.

## Current Schema Findings
Extracted from Hibernate logs:
- `categories`: id, created_at, description, name, slug
- `order_items`: id, price, quantity, order_id, product_id
- `orders`: id, created_at, note, shipping_address, status, total_amount, updated_at, user_id
- `products`: id, created_at, description, image_url, is_active, name, price, stock_quantity, updated_at, category_id
- `reviews`: id, comment, created_at, rating, product_id, user_id
- `users`: id, address, created_at, email, full_name, password, phone, role, username

## Action Items
1. Add `implementation 'org.flywaydb:flyway-core'` and `implementation 'org.flywaydb:flyway-mysql'` to `build.gradle`.
2. Disable Hibernate DDL auto-update.
3. Scaffold initial migration file `V1__init_schema.sql`.
4. Create dummy data in `V2__seed_dummy_data.sql`.
