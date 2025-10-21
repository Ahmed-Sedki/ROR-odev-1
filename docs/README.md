# Rails API Project

A complete Ruby on Rails API-only backend with 6 models, comprehensive testing, and full CRUD operations.

## Tech Stack

- **Ruby**: 3.4.7
- **Rails**: 8.0.3
- **Database**: SQLite3
- **Testing**: RSpec, FactoryBot, Faker
- **API**: ActiveModel::Serializers
- **Pagination**: Kaminari
- **CORS**: Rack::CORS
- **Code Quality**: RuboCop

## Models

1. **User** - Users of the system
2. **Category** - Post categories
3. **Tag** - Post tags
4. **Post** - Blog posts (belongs to User and Category, has many Tags)
5. **Comment** - Comments on posts (belongs to User and Post)
6. **PostTag** - Join table for Post-Tag many-to-many relationship

## Features

- ✅ Full CRUD operations for all resources
- ✅ Pagination with Kaminari (default: 10 per page, max: 100)
- ✅ Filtering for posts (by user_id, category_id, tag name)
- ✅ Nested routes for comments under posts
- ✅ ActiveModel::Serializers with embedded associations
- ✅ Global error handling with consistent error format
- ✅ CORS enabled for localhost
- ✅ Comprehensive RSpec tests (models + requests)
- ✅ Factory Bot factories with Faker data
- ✅ Seed data (10 users, 10 categories, 14 tags, 50 posts, 100 comments)

## Setup Instructions

### Prerequisites

- Ruby 3.3.x or higher
- Bundler

### macOS/Linux

```bash
# Clone the repository
cd rails1

# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Start the server
rails server

# Server will be available at http://localhost:3000
```

### Windows/WSL

```powershell
# Navigate to project
cd rails1

# Install dependencies
bundle install

# Setup database
rails db:create
rails db:migrate
rails db:seed

# Start the server
rails server

# Server will be available at http://localhost:3000
```

## Running Tests

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/user_spec.rb

# Run with documentation format
bundle exec rspec --format documentation
```

## API Endpoints

### Health Check
- `GET /health` - Health check endpoint

### Users
- `GET /users` - List all users (paginated)
- `GET /users/:id` - Get a specific user
- `POST /users` - Create a new user
- `PATCH /users/:id` - Update a user
- `DELETE /users/:id` - Delete a user

### Categories
- `GET /categories` - List all categories (paginated)
- `GET /categories/:id` - Get a specific category
- `POST /categories` - Create a new category
- `PATCH /categories/:id` - Update a category
- `DELETE /categories/:id` - Delete a category

### Tags
- `GET /tags` - List all tags (paginated)
- `GET /tags/:id` - Get a specific tag
- `POST /tags` - Create a new tag
- `PATCH /tags/:id` - Update a tag
- `DELETE /tags/:id` - Delete a tag

### Posts
- `GET /posts` - List all posts (paginated, filterable)
  - Query params: `user_id`, `category_id`, `tag`, `page`, `per_page`
- `GET /posts/:id` - Get a specific post (with embedded user, category, tags)
- `POST /posts` - Create a new post
- `PATCH /posts/:id` - Update a post
- `DELETE /posts/:id` - Delete a post
- `GET /posts/:id/tags` - Get all tags for a post

### Comments
- `GET /posts/:post_id/comments` - List comments for a post (paginated)
- `POST /posts/:post_id/comments` - Create a comment on a post
- `GET /comments/:id` - Get a specific comment
- `PATCH /comments/:id` - Update a comment
- `DELETE /comments/:id` - Delete a comment

### Post Tags
- `POST /post_tags` - Create a post-tag association
- `DELETE /post_tags/:id` - Delete a post-tag association

## Example Requests

### Get Users with Pagination
```bash
curl "http://localhost:3000/users?page=1&per_page=5"
```

**Response:**
```json
{
  "users": [...],
  "meta": {
    "page": 1,
    "per_page": 5,
    "total_pages": 2,
    "total_count": 10
  }
}
```

### Get Post with Embedded Associations
```bash
curl "http://localhost:3000/posts/1"
```

**Response:**
```json
{
  "id": 1,
  "title": "Post Title",
  "body": "Post content...",
  "created_at": "2025-10-21T20:18:05.967Z",
  "updated_at": "2025-10-21T20:18:05.967Z",
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    ...
  },
  "category": {
    "id": 1,
    "name": "Technology",
    ...
  },
  "tags": [
    {
      "id": 1,
      "name": "ruby",
      ...
    }
  ]
}
```

### Filter Posts by Tag
```bash
curl "http://localhost:3000/posts?tag=ruby"
```

### Create a Comment
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

## Error Handling

All errors follow a consistent format:

```json
{
  "error": {
    "message": "Error message here",
    "details": {
      "field": ["error description"]
    }
  }
}
```

### Common Status Codes
- `200 OK` - Successful GET/PATCH
- `201 Created` - Successful POST
- `204 No Content` - Successful DELETE
- `404 Not Found` - Resource not found
- `422 Unprocessable Entity` - Validation error

## Documentation

- **[cURL Examples](curl-examples.md)** - Complete cURL examples for all endpoints
- **[ERD Diagram](erd.md)** - Entity Relationship Diagram and schema details
- **[Insomnia Collection](insomnia_collection.json)** - Import into Insomnia for testing

## Database Schema

See [ERD Documentation](erd.md) for complete schema details.

## Development Tools

### Code Linting
```bash
bundle exec rubocop
```

### Database Console
```bash
rails dbconsole
```

### Rails Console
```bash
rails console
```

### Reset Database
```bash
rails db:reset  # Drops, creates, migrates, and seeds
```

## Project Structure

```
rails1/
├── app/
│   ├── controllers/
│   │   ├── concerns/
│   │   │   └── error_handler.rb
│   │   ├── application_controller.rb
│   │   ├── users_controller.rb
│   │   ├── categories_controller.rb
│   │   ├── tags_controller.rb
│   │   ├── posts_controller.rb
│   │   ├── comments_controller.rb
│   │   ├── post_tags_controller.rb
│   │   └── health_controller.rb
│   ├── models/
│   │   ├── user.rb
│   │   ├── category.rb
│   │   ├── tag.rb
│   │   ├── post.rb
│   │   ├── comment.rb
│   │   └── post_tag.rb
│   └── serializers/
│       ├── user_serializer.rb
│       ├── category_serializer.rb
│       ├── tag_serializer.rb
│       ├── post_serializer.rb
│       ├── comment_serializer.rb
│       └── post_tag_serializer.rb
├── config/
│   ├── routes.rb
│   ├── database.yml
│   └── application.rb
├── db/
│   ├── migrate/
│   └── seeds.rb
├── spec/
│   ├── factories/
│   ├── models/
│   └── requests/
└── docs/
    ├── README.md
    ├── curl-examples.md
    ├── erd.md
    └── insomnia_collection.json
```

## License

This project is available as open source under the terms of the MIT License.

