# cURL Examples

## Health Check

```bash
curl http://localhost:3000/health
```

**Response:**
```json
{"status":"ok"}
```

## Users

### List Users (with pagination)
```bash
curl "http://localhost:3000/users?page=1&per_page=5"
```

**Response:**
```json
{
  "users": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "created_at": "2025-10-21T20:18:05.752Z",
      "updated_at": "2025-10-21T20:18:05.752Z"
    }
  ],
  "meta": {
    "page": 1,
    "per_page": 5,
    "total_pages": 2,
    "total_count": 10
  }
}
```

### Get Single User
```bash
curl http://localhost:3000/users/1
```

### Create User
```bash
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "name": "Jane Smith",
      "email": "jane@example.com"
    }
  }'
```

### Update User
```bash
curl -X PATCH http://localhost:3000/users/1 \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "name": "Jane Updated"
    }
  }'
```

### Delete User
```bash
curl -X DELETE http://localhost:3000/users/1
```

## Categories

### List Categories
```bash
curl "http://localhost:3000/categories?page=1&per_page=10"
```

### Create Category
```bash
curl -X POST http://localhost:3000/categories \
  -H "Content-Type: application/json" \
  -d '{
    "category": {
      "name": "Technology",
      "description": "Tech-related posts"
    }
  }'
```

## Tags

### List Tags
```bash
curl "http://localhost:3000/tags?page=1&per_page=10"
```

### Create Tag
```bash
curl -X POST http://localhost:3000/tags \
  -H "Content-Type: application/json" \
  -d '{
    "tag": {
      "name": "ruby"
    }
  }'
```

## Posts

### List Posts (with filters)
```bash
# All posts
curl "http://localhost:3000/posts?page=1&per_page=10"

# Filter by user
curl "http://localhost:3000/posts?user_id=1"

# Filter by category
curl "http://localhost:3000/posts?category_id=2"

# Filter by tag name
curl "http://localhost:3000/posts?tag=ruby"
```

**Response (with embedded associations):**
```json
{
  "posts": [
    {
      "id": 1,
      "title": "My First Post",
      "body": "This is the content...",
      "created_at": "2025-10-21T20:18:05.967Z",
      "updated_at": "2025-10-21T20:18:05.967Z",
      "user": {
        "id": 1,
        "name": "John Doe",
        "email": "john@example.com",
        "created_at": "2025-10-21T20:18:05.752Z",
        "updated_at": "2025-10-21T20:18:05.752Z"
      },
      "category": {
        "id": 1,
        "name": "Technology",
        "description": "Tech posts",
        "created_at": "2025-10-21T20:18:05.836Z",
        "updated_at": "2025-10-21T20:18:05.836Z"
      },
      "tags": [
        {
          "id": 1,
          "name": "ruby",
          "created_at": "2025-10-21T20:18:05.888Z",
          "updated_at": "2025-10-21T20:18:05.888Z"
        }
      ]
    }
  ],
  "meta": {
    "page": 1,
    "per_page": 10,
    "total_pages": 5,
    "total_count": 50
  }
}
```

### Get Single Post
```bash
curl http://localhost:3000/posts/1
```

### Create Post
```bash
curl -X POST http://localhost:3000/posts \
  -H "Content-Type: application/json" \
  -d '{
    "post": {
      "title": "New Post Title",
      "body": "Post content here...",
      "user_id": 1,
      "category_id": 2
    }
  }'
```

### Get Post Tags
```bash
curl http://localhost:3000/posts/1/tags
```

## Comments

### List Comments for a Post
```bash
curl "http://localhost:3000/posts/1/comments?page=1&per_page=10"
```

### Create Comment on a Post
```bash
curl -X POST http://localhost:3000/posts/1/comments \
  -H "Content-Type: application/json" \
  -d '{
    "comment": {
      "body": "Great post!",
      "user_id": 2
    }
  }'
```

**Response:**
```json
{
  "id": 1,
  "body": "Great post!",
  "created_at": "2025-10-21T20:18:06.123Z",
  "updated_at": "2025-10-21T20:18:06.123Z",
  "user": {
    "id": 2,
    "name": "Jane Smith",
    "email": "jane@example.com",
    "created_at": "2025-10-21T20:18:05.758Z",
    "updated_at": "2025-10-21T20:18:05.758Z"
  },
  "post": {
    "id": 1,
    "title": "My First Post",
    "body": "This is the content...",
    "created_at": "2025-10-21T20:18:05.967Z",
    "updated_at": "2025-10-21T20:18:05.967Z"
  }
}
```

### Update Comment
```bash
curl -X PATCH http://localhost:3000/comments/1 \
  -H "Content-Type: application/json" \
  -d '{
    "comment": {
      "body": "Updated comment text"
    }
  }'
```

### Delete Comment
```bash
curl -X DELETE http://localhost:3000/comments/1
```

## Post Tags (Associations)

### Create Post-Tag Association
```bash
curl -X POST http://localhost:3000/post_tags \
  -H "Content-Type: application/json" \
  -d '{
    "post_tag": {
      "post_id": 1,
      "tag_id": 3
    }
  }'
```

### Delete Post-Tag Association
```bash
curl -X DELETE http://localhost:3000/post_tags/1
```

## Error Responses

### Validation Error (422)
```json
{
  "error": {
    "message": "Validation failed",
    "details": {
      "email": ["has already been taken"],
      "name": ["can't be blank"]
    }
  }
}
```

### Not Found (404)
```json
{
  "error": {
    "message": "Couldn't find User with 'id'=999",
    "details": {}
  }
}
```

