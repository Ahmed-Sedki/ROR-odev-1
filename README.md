# Rails API Backend - Blog System

[![Ruby](https://img.shields.io/badge/Ruby-3.4.7-red.svg)](https://www.ruby-lang.org/)
[![Rails](https://img.shields.io/badge/Rails-8.0.3-red.svg)](https://rubyonrails.org/)
[![RSpec](https://img.shields.io/badge/Tests-26%20passing-green.svg)](https://rspec.info/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A complete RESTful API backend built with Ruby on Rails, featuring 6 models, comprehensive CRUD operations, pagination, filtering, and full test coverage.

## 🚀 Features

- ✅ **API-only Rails application** - Lightweight and fast
- ✅ **6 Models** - User, Category, Tag, Post, Comment, PostTag
- ✅ **RESTful API** - 24 endpoints with full CRUD operations
- ✅ **Pagination** - Kaminari integration (10 per page, max 100)
- ✅ **Filtering** - Filter posts by user, category, or tag
- ✅ **CORS enabled** - Ready for frontend integration
- ✅ **Global error handling** - Consistent error responses
- ✅ **JSON serialization** - ActiveModel::Serializers
- ✅ **Comprehensive tests** - RSpec with FactoryBot (26 examples)
- ✅ **Seed data** - 285 records with realistic data
- ✅ **API documentation** - Complete with examples
- ✅ **Insomnia collection** - Ready-to-import test collection

## 📋 Table of Contents

- [Tech Stack](#-tech-stack)
- [Database Schema](#-database-schema)
- [API Endpoints](#-api-endpoints)
- [Getting Started](#-getting-started)
- [Testing](#-testing)
- [Documentation](#-documentation)
- [Project Structure](#-project-structure)
- [Contributing](#-contributing)
- [License](#-license)

## 🛠 Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| Ruby | 3.4.7 | Programming language |
| Rails | 8.0.3 | Web framework (API-only) |
| SQLite3 | - | Database (development) |
| RSpec | 6.0 | Testing framework |
| FactoryBot | - | Test data generation |
| Faker | - | Fake data generation |
| Kaminari | - | Pagination |
| ActiveModel::Serializers | 0.10.0 | JSON serialization |
| Rack::Cors | - | CORS support |
| RuboCop | - | Code quality |

## 📊 Database Schema

### Models & Relationships

```
User (1:N) ──┬──> Post (N:M) ──> PostTag ──> Tag
             │       │
             │       └──> Comment
             │
             └──> Comment

Category (1:N) ──> Post
```

### Model Details

#### User
- `name` (string, required)
- `email` (string, required, unique)
- Has many: posts, comments

#### Category
- `name` (string, required, unique)
- `description` (text)
- Has many: posts

#### Tag
- `name` (string, required, unique)
- Has many: posts (through post_tags)

#### Post
- `title` (string, required)
- `body` (text, required)
- `user_id` (foreign key, required)
- `category_id` (foreign key, required)
- Belongs to: user, category
- Has many: comments, tags (through post_tags)

#### Comment
- `body` (text, required)
- `user_id` (foreign key, required)
- `post_id` (foreign key, required)
- Belongs to: user, post

#### PostTag
- `post_id` (foreign key, required)
- `tag_id` (foreign key, required)
- Unique combination of post and tag

## 🔌 API Endpoints

### Health Check
```
GET /health
```

### Users
```
GET    /users              # List all users (paginated)
GET    /users/:id          # Get specific user
POST   /users              # Create user
PATCH  /users/:id          # Update user
DELETE /users/:id          # Delete user
```

### Categories
```
GET    /categories         # List all categories (paginated)
GET    /categories/:id     # Get specific category
POST   /categories         # Create category
PATCH  /categories/:id     # Update category
DELETE /categories/:id     # Delete category
```

### Tags
```
GET    /tags               # List all tags (paginated)
GET    /tags/:id           # Get specific tag
POST   /tags               # Create tag
PATCH  /tags/:id           # Update tag
DELETE /tags/:id           # Delete tag
```

### Posts
```
GET    /posts              # List all posts (paginated)
GET    /posts/:id          # Get specific post with associations
POST   /posts              # Create post
PATCH  /posts/:id          # Update post
DELETE /posts/:id          # Delete post
GET    /posts/:id/tags     # Get post's tags

# Filtering
GET    /posts?user_id=11           # Filter by user
GET    /posts?category_id=14       # Filter by category
GET    /posts?tag=slam             # Filter by tag name
```

### Comments
```
GET    /posts/:post_id/comments    # List post's comments (paginated)
POST   /posts/:post_id/comments    # Create comment
PATCH  /comments/:id               # Update comment
DELETE /comments/:id               # Delete comment
```

### Post Tags
```
POST   /post_tags          # Associate tag with post
DELETE /post_tags/:id      # Remove tag from post
```

## 🏁 Getting Started

### Prerequisites

- Ruby 3.3.x or higher
- Rails 7.1+ or higher
- SQLite3

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/rails-api-backend.git
cd rails-api-backend
```

2. **Install dependencies**
```bash
bundle install
```

3. **Setup database**
```bash
rails db:create
rails db:migrate
rails db:seed
```

4. **Start the server**
```bash
rails server
```

The API will be available at `http://localhost:3000`

### Quick Test

```bash
# Health check
curl http://localhost:3000/health

# Get users
curl http://localhost:3000/users

# Get a post with associations
curl http://localhost:3000/posts/51
```

## 🧪 Testing

### Run all tests
```bash
bundle exec rspec
```

### Run with detailed output
```bash
bundle exec rspec --format documentation
```

### Test specific file
```bash
bundle exec rspec spec/models/user_spec.rb
```

### Test Coverage
- **26 examples** - All passing ✅
- **Model tests** - Validations and associations
- **Request tests** - API endpoints and responses

## 📚 Documentation

Comprehensive documentation is available in the `docs/` folder:

| File | Description |
|------|-------------|
| [docs/README.md](docs/README.md) | Complete API documentation |
| [docs/SETUP_GUIDE.md](docs/SETUP_GUIDE.md) | Detailed setup instructions |
| [docs/curl-examples.md](docs/curl-examples.md) | cURL examples for all endpoints |
| [docs/erd.md](docs/erd.md) | Entity Relationship Diagram |
| [docs/diagrams.md](docs/diagrams.md) | **Mermaid diagrams** (ERD, architecture, flows) |
| [docs/insomnia_collection.json](docs/insomnia_collection.json) | Insomnia REST client collection |
| [docs/INSOMNIA_GUIDE.md](docs/INSOMNIA_GUIDE.md) | How to use Insomnia collection |
| [PROJE_RAPORU.md](PROJE_RAPORU.md) | Project report (Turkish) |

### Using Insomnia Collection

1. Download [Insomnia](https://insomnia.rest/download)
2. Import `docs/insomnia_collection.json`
3. Start testing all 24 endpoints immediately!

## 📁 Project Structure

```
rails1/
├── app/
│   ├── controllers/          # API controllers
│   │   ├── concerns/         # Shared controller logic
│   │   └── *_controller.rb   # Resource controllers
│   ├── models/               # ActiveRecord models
│   └── serializers/          # JSON serializers
├── config/
│   ├── routes.rb             # API routes
│   └── initializers/         # App configuration
├── db/
│   ├── migrate/              # Database migrations
│   ├── seeds.rb              # Seed data
│   └── schema.rb             # Database schema
├── spec/
│   ├── models/               # Model tests
│   ├── requests/             # API endpoint tests
│   └── factories/            # FactoryBot factories
├── docs/                     # Documentation
└── bin/                      # Executable scripts
```

## 🔧 Configuration

### Pagination

Default settings (configurable in `config/initializers/kaminari_config.rb`):
- **Default per page**: 10
- **Maximum per page**: 100

### CORS

Configured for localhost (modify `config/initializers/cors.rb` for production):
- **Allowed origins**: `http://localhost:*`
- **Allowed methods**: GET, POST, PATCH, PUT, DELETE, OPTIONS
- **Allowed headers**: All

## 🌟 Example Responses

### GET /posts/51
```json
{
  "id": 51,
  "title": "Esse sint praesentium voluptatibus laboriosam.",
  "body": "Sint tempora nam...",
  "user": {
    "id": 15,
    "name": "Susan Okuneva V",
    "email": "chelsey.bashirian@veum.test"
  },
  "category": {
    "id": 14,
    "name": "Fiction in verse"
  },
  "tags": [
    {
      "id": 16,
      "name": "slam"
    }
  ]
}
```

### GET /users?page=1&per_page=5
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

## 🚀 Deployment

### Production Recommendations

1. **Switch to PostgreSQL**
   - Update `Gemfile`: Replace `sqlite3` with `pg`
   - Update `config/database.yml`

2. **Add Authentication**
   - Consider JWT tokens or OAuth
   - Gems: `devise`, `jwt`, `doorkeeper`

3. **Add Authorization**
   - Gems: `pundit` or `cancancan`

4. **Enable HTTPS**
   - Force SSL in production

5. **Add Rate Limiting**
   - Gem: `rack-attack`

6. **API Versioning**
   - Namespace routes: `/api/v1/`

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style

- Follow Ruby style guide
- Run RuboCop before committing: `bundle exec rubocop`
- Write tests for new features
- Update documentation as needed

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@Ahmed-Sedki](https://github.com/Ahmed-Sedki)
- Email: ahmedsedki867@gmail.com

## 🙏 Acknowledgments

- Ruby on Rails community
- RSpec and FactoryBot maintainers
- All contributors

---

**⭐ If you find this project useful, please consider giving it a star!**
