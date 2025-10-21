# Rails API Setup Guide

## Quick Start

### Windows (PowerShell)

```powershell
# Navigate to project directory
cd rails1

# Install dependencies
bundle install

# Setup database
rails db:create
rails db:migrate
rails db:seed

# Start server
rails server

# In another terminal, test the API
Invoke-WebRequest -Uri "http://localhost:3000/health" -UseBasicParsing
```

### macOS/Linux (Bash)

```bash
# Navigate to project directory
cd rails1

# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Start server
rails server

# In another terminal, test the API
curl http://localhost:3000/health
```

## Smoke Test

### Windows
```powershell
# Make sure server is running first
# Then run:
Invoke-WebRequest -Uri "http://localhost:3000/health"
Invoke-WebRequest -Uri "http://localhost:3000/users"
Invoke-WebRequest -Uri "http://localhost:3000/posts/51"
```

### macOS/Linux
```bash
# Make sure server is running first
chmod +x bin/smoke_test.sh
./bin/smoke_test.sh
```

## Running Tests

```bash
# Run all tests
bundle exec rspec

# Run with documentation format
bundle exec rspec --format documentation

# Run specific test file
bundle exec rspec spec/models/user_spec.rb
bundle exec rspec spec/requests/users_spec.rb
```

## Example API Calls

### Health Check
```bash
# Windows
Invoke-WebRequest -Uri "http://localhost:3000/health" -UseBasicParsing | Select-Object -ExpandProperty Content

# macOS/Linux
curl http://localhost:3000/health
```

**Response:**
```json
{"status":"ok"}
```

### Get Users with Pagination
```bash
# Windows
Invoke-WebRequest -Uri "http://localhost:3000/users?page=1&per_page=5" -UseBasicParsing | Select-Object -ExpandProperty Content

# macOS/Linux
curl "http://localhost:3000/users?page=1&per_page=5"
```

**Response:**
```json
{
  "users": [
    {
      "id": 11,
      "name": "Emily Runolfsdottir",
      "email": "frank.kuhlman@donnelly.test",
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

### Get Post with Embedded Associations
```bash
# Windows
Invoke-WebRequest -Uri "http://localhost:3000/posts/51" -UseBasicParsing | Select-Object -ExpandProperty Content

# macOS/Linux
curl http://localhost:3000/posts/51
```

**Response:**
```json
{
  "id": 51,
  "title": "Esse sint praesentium voluptatibus laboriosam.",
  "body": "Sint tempora nam...",
  "created_at": "2025-10-21T20:18:05.967Z",
  "updated_at": "2025-10-21T20:18:05.967Z",
  "user": {
    "id": 15,
    "name": "Susan Okuneva V",
    "email": "chelsey.bashirian@veum.test",
    "created_at": "2025-10-21T20:18:05.776Z",
    "updated_at": "2025-10-21T20:18:05.776Z"
  },
  "category": {
    "id": 14,
    "name": "Fiction in verse",
    "description": "Voluptas incidunt aperiam...",
    "created_at": "2025-10-21T20:18:05.836Z",
    "updated_at": "2025-10-21T20:18:05.836Z"
  },
  "tags": [
    {
      "id": 16,
      "name": "slam",
      "created_at": "2025-10-21T20:18:05.888Z",
      "updated_at": "2025-10-21T20:18:05.888Z"
    }
  ]
}
```

### Filter Posts by Tag
```bash
# Windows
Invoke-WebRequest -Uri "http://localhost:3000/posts?tag=slam" -UseBasicParsing | Select-Object -ExpandProperty Content

# macOS/Linux
curl "http://localhost:3000/posts?tag=slam"
```

### Create a New User
```bash
# Windows
$body = @{
    user = @{
        name = "New User"
        email = "newuser@example.com"
    }
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:3000/users" -Method POST -Body $body -ContentType "application/json" -UseBasicParsing

# macOS/Linux
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "name": "New User",
      "email": "newuser@example.com"
    }
  }'
```

## Troubleshooting

### Server won't start - "A server is already running"
```bash
# Remove the PID file
rm tmp/pids/server.pid

# Or on Windows
Remove-Item tmp/pids/server.pid
```

### Database errors
```bash
# Reset the database
rails db:reset

# This will drop, create, migrate, and seed
```

### Test database not migrated
```bash
# Run migrations for test environment
rails db:migrate RAILS_ENV=test
```

## Project Structure

```
rails1/
├── app/
│   ├── controllers/      # API controllers
│   ├── models/           # ActiveRecord models
│   └── serializers/      # JSON serializers
├── config/
│   ├── routes.rb         # API routes
│   └── database.yml      # Database configuration
├── db/
│   ├── migrate/          # Database migrations
│   └── seeds.rb          # Seed data
├── spec/
│   ├── factories/        # FactoryBot factories
│   ├── models/           # Model tests
│   └── requests/         # API request tests
└── docs/
    ├── README.md         # Main documentation
    ├── curl-examples.md  # cURL examples
    ├── erd.md            # Database schema
    ├── SETUP_GUIDE.md    # This file
    └── insomnia_collection.json  # Insomnia collection
```

## Next Steps

1. Import `docs/insomnia_collection.json` into Insomnia for easy API testing
2. Review `docs/curl-examples.md` for comprehensive API examples
3. Check `docs/erd.md` for database schema details
4. Run `bundle exec rspec` to verify all tests pass
5. Start building your application!

## Support

For more information, see:
- [docs/README.md](README.md) - Main documentation
- [docs/curl-examples.md](curl-examples.md) - Complete API examples
- [docs/erd.md](erd.md) - Database schema and relationships

