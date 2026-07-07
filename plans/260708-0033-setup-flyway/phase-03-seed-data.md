# Phase 3: Data Seeding

## Overview
Status: **Not Started**
Priority: **Medium**

Insert dummy data into the database to ensure all developers have a uniform testing environment.

## Related Code Files
- `src/main/resources/db/migration/V2__seed_dummy_data.sql` (To be created)

## Implementation Steps

1. **Create Seed Script:**
   - Create `V2__seed_dummy_data.sql` inside the migration directory.
   
2. **Insert Basic Data:**
   - Insert default categories (e.g., Electronics, Clothing, Books).
   - Insert a default admin user (password must be a valid bcrypt hash, e.g., for `password` or `123456`).
   - Insert a few sample products linking to the categories.

## Todo List
- [ ] Create `V2__seed_dummy_data.sql`
- [ ] Write INSERT statements for categories, user, and products
