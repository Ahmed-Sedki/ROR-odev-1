# Entity Relationship Diagram

## Database Schema

```
┌─────────────────────┐
│       users         │
├─────────────────────┤
│ id (PK)             │
│ name                │
│ email (unique)      │
│ created_at          │
│ updated_at          │
└─────────────────────┘
         │
         │ 1:N
         ├──────────────────────────┐
         │                          │
         ▼                          ▼
┌─────────────────────┐    ┌─────────────────────┐
│       posts         │    │      comments       │
├─────────────────────┤    ├─────────────────────┤
│ id (PK)             │    │ id (PK)             │
│ title               │    │ body                │
│ body                │    │ user_id (FK)        │
│ user_id (FK)        │    │ post_id (FK)        │
│ category_id (FK)    │    │ created_at          │
│ created_at          │    │ updated_at          │
│ updated_at          │    └─────────────────────┘
└─────────────────────┘              ▲
         │                           │
         │ N:1                       │ N:1
         ▼                           │
┌─────────────────────┐              │
│     categories      │              │
├─────────────────────┤              │
│ id (PK)             │              │
│ name (unique)       │              │
│ description         │              │
│ created_at          │              │
│ updated_at          │              │
└─────────────────────┘              │
                                     │
┌─────────────────────┐              │
│       posts         │──────────────┘
└─────────────────────┘
         │
         │ N:M (through post_tags)
         │
         ▼
┌─────────────────────┐
│     post_tags       │
├─────────────────────┤
│ id (PK)             │
│ post_id (FK)        │
│ tag_id (FK)         │
│ created_at          │
│ updated_at          │
│ UNIQUE(post_id,     │
│        tag_id)      │
└─────────────────────┘
         │
         │ N:1
         ▼
┌─────────────────────┐
│        tags         │
├─────────────────────┤
│ id (PK)             │
│ name (unique)       │
│ created_at          │
│ updated_at          │
└─────────────────────┘
```

## Relationships

### User
- **has_many** posts (dependent: nullify)
- **has_many** comments (dependent: nullify)

### Category
- **has_many** posts

### Tag
- **has_many** post_tags (dependent: destroy)
- **has_many** posts (through: post_tags)

### Post
- **belongs_to** user
- **belongs_to** category
- **has_many** comments (dependent: destroy)
- **has_many** post_tags (dependent: destroy)
- **has_many** tags (through: post_tags)

### Comment
- **belongs_to** user
- **belongs_to** post

### PostTag (Join Table)
- **belongs_to** post
- **belongs_to** tag
- **Unique constraint** on [post_id, tag_id]

## Indexes

- `users.email` - unique index
- `categories.name` - unique index
- `tags.name` - unique index
- `post_tags.[post_id, tag_id]` - unique composite index
- `posts.user_id` - foreign key index
- `posts.category_id` - foreign key index
- `comments.user_id` - foreign key index
- `comments.post_id` - foreign key index
- `post_tags.post_id` - foreign key index
- `post_tags.tag_id` - foreign key index

## Validations

### User
- `name`: presence
- `email`: presence, format (email), uniqueness

### Category
- `name`: presence, uniqueness

### Tag
- `name`: presence, uniqueness

### Post
- `title`: presence, minimum length 3
- `body`: presence
- `user`: presence
- `category`: presence

### Comment
- `body`: presence
- `user`: presence
- `post`: presence

### PostTag
- Unique constraint enforced at database level

