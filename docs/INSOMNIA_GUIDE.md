# Insomnia Collection Guide

## Overview

The `insomnia_collection.json` file contains a complete, importable Insomnia REST Client collection for testing all Rails API endpoints.

## What's Included

### ✅ Workspace
- **Name**: Rails API Collection
- **Description**: Complete Rails API with 6 models
- **Base URL**: `http://localhost:3000` (configurable via environment variable)

### ✅ Request Groups (7 folders)

1. **Health** - Health check endpoint
2. **Users** - User management (5 requests)
3. **Categories** - Category management (3 requests)
4. **Tags** - Tag management (2 requests)
5. **Posts** - Post management with filters (7 requests)
6. **Comments** - Comment management (4 requests)
7. **Post Tags** - Post-Tag associations (2 requests)

### ✅ Total Requests: 24

## How to Import

### Step 1: Open Insomnia
Download and install Insomnia from https://insomnia.rest/download if you haven't already.

### Step 2: Import Collection
1. Open Insomnia
2. Click on **Application** menu → **Preferences** → **Data**
3. Click **Import Data** → **From File**
4. Navigate to `docs/insomnia_collection.json`
5. Click **Open**

### Alternative Import Method
1. In Insomnia, click the dropdown next to your workspace name
2. Select **Import/Export**
3. Click **Import Data** → **From File**
4. Select `docs/insomnia_collection.json`

### Step 3: Verify Import
After import, you should see:
- A workspace named "Rails API Collection"
- 7 folders (Health, Users, Categories, Tags, Posts, Comments, Post Tags)
- 24 total requests organized in these folders

## Environment Variables

The collection uses one environment variable:
- **`base_url`**: Set to `http://localhost:3000` by default

### To Change the Base URL:
1. Click the environment dropdown (top-left, shows "Base Environment")
2. Click **Manage Environments**
3. Edit the `base_url` value
4. Click **Done**

## Request Details

### Health Check (1 request)
- **GET** `/health` - Check if API is running

### Users (5 requests)
- **GET** `/users?page=1&per_page=10` - List users with pagination
- **GET** `/users/11` - Get specific user
- **POST** `/users` - Create new user
- **PATCH** `/users/11` - Update user
- **DELETE** `/users/11` - Delete user

### Categories (3 requests)
- **GET** `/categories?page=1&per_page=10` - List categories
- **GET** `/categories/14` - Get specific category
- **POST** `/categories` - Create new category

### Tags (2 requests)
- **GET** `/tags?page=1&per_page=10` - List tags
- **POST** `/tags` - Create new tag

### Posts (7 requests)
- **GET** `/posts?page=1&per_page=10` - List posts
- **GET** `/posts/51` - Get specific post with embedded associations
- **GET** `/posts?user_id=11` - Filter posts by user
- **GET** `/posts?category_id=14` - Filter posts by category
- **GET** `/posts?tag=slam` - Filter posts by tag name
- **POST** `/posts` - Create new post
- **GET** `/posts/51/tags` - Get all tags for a post

### Comments (4 requests)
- **GET** `/posts/51/comments?page=1&per_page=10` - List comments for a post
- **POST** `/posts/51/comments` - Create comment on a post
- **PATCH** `/comments/101` - Update comment
- **DELETE** `/comments/101` - Delete comment

### Post Tags (2 requests)
- **POST** `/post_tags` - Associate a tag with a post
- **DELETE** `/post_tags/115` - Remove tag from post

## Usage Tips

### 1. Start the Rails Server First
```bash
rails server
```
The server must be running on `http://localhost:3000` before testing.

### 2. Run Requests in Order
For best results, run requests in this order:
1. Health Check (verify server is running)
2. List Users (verify data is seeded)
3. Get User (test individual resource)
4. Create/Update/Delete operations

### 3. Update IDs as Needed
The collection uses example IDs from the seed data:
- User ID: 11
- Category ID: 14
- Post ID: 51
- Comment ID: 101
- Tag: "slam"
- Post Tag ID: 115

If you reset your database, these IDs may change. Update the URLs accordingly.

### 4. Check Response Format
All list endpoints return:
```json
{
  "resource_name": [...],
  "meta": {
    "page": 1,
    "per_page": 10,
    "total_pages": 5,
    "total_count": 50
  }
}
```

Single resource endpoints return the resource directly:
```json
{
  "id": 51,
  "title": "...",
  "user": {...},
  "category": {...},
  "tags": [...]
}
```

### 5. Use Folders to Organize
The requests are organized into folders by resource type. You can:
- Run all requests in a folder sequentially
- Collapse/expand folders for better organization
- Duplicate requests to create variations

## Testing Workflow

### Quick Smoke Test
1. **Health Check** - Verify server is running
2. **List Users** - Verify database has data
3. **Get Post** - Verify associations are working
4. **List Comments for Post** - Verify nested routes work

### Full CRUD Test for Users
1. **List Users** - See existing users
2. **Create User** - Add new user
3. **Get User** - Retrieve the created user
4. **Update User** - Modify the user
5. **Delete User** - Remove the user

### Test Filtering
1. **List Posts** - See all posts
2. **Filter Posts by User** - See posts from specific user
3. **Filter Posts by Category** - See posts in specific category
4. **Filter Posts by Tag** - See posts with specific tag

## Troubleshooting

### "Could not send request"
- Verify Rails server is running: `rails server`
- Check the base URL is correct: `http://localhost:3000`
- Ensure no firewall is blocking port 3000

### "404 Not Found"
- Check the resource ID exists in your database
- Run `rails db:seed` to populate test data
- Verify the route in `config/routes.rb`

### "422 Unprocessable Entity"
- Check the request body format
- Ensure required fields are present
- Verify validations in the model

### "500 Internal Server Error"
- Check Rails server logs for error details
- Verify database migrations are up to date: `rails db:migrate`
- Check for missing associations or validations

## Collection Metadata

- **Format**: Insomnia v4 Export Format
- **Export Date**: 2025-10-21
- **Source**: insomnia.desktop.app:v2023.5.8
- **Compatible With**: Insomnia 2023.5.8 and later

## Next Steps

1. Import the collection into Insomnia
2. Start your Rails server
3. Run the Health Check request
4. Explore the API endpoints
5. Modify requests as needed for your use case

For more details on the API, see:
- [docs/README.md](README.md) - Complete API documentation
- [docs/curl-examples.md](curl-examples.md) - cURL examples
- [docs/SETUP_GUIDE.md](SETUP_GUIDE.md) - Setup instructions

