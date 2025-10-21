# Contributing to Rails API Backend

First off, thank you for considering contributing to this project! 🎉

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project adheres to a code of conduct. By participating, you are expected to uphold this code. Please be respectful and constructive in all interactions.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Clear title and description**
- **Steps to reproduce** the issue
- **Expected behavior** vs **actual behavior**
- **Environment details** (Ruby version, Rails version, OS)
- **Error messages** or logs if applicable

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Clear title and description**
- **Use case** - why this enhancement would be useful
- **Possible implementation** if you have ideas

### Pull Requests

We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure the test suite passes
5. Make sure your code follows the coding standards
6. Issue the pull request!

## Development Setup

### Prerequisites

- Ruby 3.3.x or higher
- Rails 7.1+ or higher
- SQLite3
- Git

### Setup Steps

1. **Fork and clone the repository**
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

4. **Run tests to verify setup**
```bash
bundle exec rspec
```

5. **Start the development server**
```bash
rails server
```

## Coding Standards

### Ruby Style Guide

We follow the [Ruby Style Guide](https://rubystyle.guide/). Key points:

- Use 2 spaces for indentation (no tabs)
- Keep lines under 120 characters
- Use snake_case for methods and variables
- Use CamelCase for classes and modules
- Add comments for complex logic

### RuboCop

We use RuboCop for code quality. Before committing:

```bash
# Check for violations
bundle exec rubocop

# Auto-fix violations (when possible)
bundle exec rubocop -a
```

### Testing

- Write tests for all new features
- Maintain or improve test coverage
- Use RSpec for testing
- Use FactoryBot for test data
- Follow the Arrange-Act-Assert pattern

**Test Structure:**
```ruby
RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires a name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end
  end
end
```

### Documentation

- Update README.md for significant changes
- Add inline comments for complex logic
- Update API documentation in `docs/` folder
- Include examples in documentation

## Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(posts): add filtering by multiple tags

Add ability to filter posts by multiple tags using comma-separated values.
Example: /posts?tags=ruby,rails

Closes #123
```

```
fix(users): validate email format

Add email format validation to prevent invalid email addresses.
```

```
docs(readme): update installation instructions

Add Windows-specific setup steps and troubleshooting section.
```

### Commit Best Practices

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Keep subject line under 50 characters
- Capitalize the subject line
- Don't end subject line with a period
- Separate subject from body with a blank line
- Wrap body at 72 characters
- Reference issues and pull requests in the footer

## Pull Request Process

### Before Submitting

1. **Update your fork**
```bash
git checkout main
git pull upstream main
```

2. **Create a feature branch**
```bash
git checkout -b feature/your-feature-name
```

3. **Make your changes**
- Write code
- Add tests
- Update documentation

4. **Run tests**
```bash
bundle exec rspec
```

5. **Run RuboCop**
```bash
bundle exec rubocop
```

6. **Commit your changes**
```bash
git add .
git commit -m "feat(scope): description"
```

7. **Push to your fork**
```bash
git push origin feature/your-feature-name
```

### Submitting the PR

1. Go to the original repository on GitHub
2. Click "New Pull Request"
3. Select your fork and branch
4. Fill in the PR template:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass locally
- [ ] Added new tests
- [ ] Updated existing tests

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings generated
```

5. Submit the pull request

### After Submitting

- Respond to review comments
- Make requested changes
- Push updates to the same branch
- Request re-review when ready

### PR Review Process

- At least one maintainer will review your PR
- Reviews may take a few days
- Be patient and responsive to feedback
- Once approved, a maintainer will merge your PR

## Development Workflow

### Branch Naming

- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Test updates

**Examples:**
- `feature/add-user-authentication`
- `fix/pagination-bug`
- `docs/update-api-examples`

### Testing Workflow

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/user_spec.rb

# Run specific test
bundle exec rspec spec/models/user_spec.rb:10

# Run with documentation format
bundle exec rspec --format documentation
```

### Database Workflow

```bash
# Create migration
rails generate migration AddFieldToModel field:type

# Run migrations
rails db:migrate

# Rollback migration
rails db:rollback

# Reset database
rails db:reset

# Seed database
rails db:seed
```

## Questions?

If you have questions:

1. Check existing documentation
2. Search existing issues
3. Create a new issue with the "question" label
4. Reach out to maintainers

## Recognition

Contributors will be recognized in:
- README.md acknowledgments section
- Release notes for significant contributions
- GitHub contributors page

Thank you for contributing! 🙏

