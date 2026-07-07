# Phase 2: Schema Migration

## Overview
Status: **Not Started**
Priority: **High**

Establish the baseline database schema using Flyway scripts, based on the current JPA entity definitions.

## Related Code Files
- `src/main/resources/db/migration/V1__init_schema.sql` (To be created)

## Implementation Steps

1. **Create Migration Directory:**
   - Create directory `src/main/resources/db/migration/` if it doesn't exist.

2. **Create Baseline Script:**
   - Create `V1__init_schema.sql` inside the migration directory.
   - Extract the generated SQL from Hibernate output to ensure complete parity with the entities:
     - Table `categories`
     - Table `products`
     - Table `users`
     - Table `orders`
     - Table `order_items`
     - Table `reviews`
   - Add all constraints, foreign keys, and unique indexes to the script.

## Todo List
- [ ] Create `db/migration` directory
- [ ] Write `V1__init_schema.sql`
