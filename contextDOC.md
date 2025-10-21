### Generate All HTML Rails Guides (Shell)

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

Navigate to the `guides` directory, install necessary dependencies with `bundle install`, and then execute one of these Rake tasks to generate all HTML guides. The resulting HTML files will be placed in the `./output` directory.

```bash
$ bundle exec rake guides:generate
```

```bash
$ bundle exec rake guides:generate:html
```

--------------------------------

### Install and Update Bundler for Rails Guides Generation (Shell)

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

Before generating Rails guides, ensure Bundler is installed and up-to-date to manage Ruby gem dependencies. Use `gem install bundler` for initial installation, or `gem update bundler` to update an existing one.

```bash
gem install bundler
```

```bash
gem update bundler
```

--------------------------------

### Verify Ruby Installation

Source: https://github.com/rails/rails/blob/main/guides/source/install_ruby_on_rails.md

Shows a simple shell command to confirm that Ruby has been successfully installed and is accessible in the terminal. Running this command should display the installed Ruby version, indicating a successful setup.

```bash
$ ruby --version
```

--------------------------------

### Verify Rails Installation

Source: https://github.com/rails/rails/blob/main/guides/source/install_ruby_on_rails.md

Offers a shell command to verify the successful installation of the Rails framework. Executing this command in the terminal should output the installed Rails version, confirming its readiness for development.

```bash
$ rails --version
```

--------------------------------

### Configure Ruby Environment on WSL Ubuntu

Source: https://github.com/rails/rails/blob/main/guides/source/install_ruby_on_rails.md

Presents shell commands to set up the Ruby development environment within an Ubuntu WSL instance. It covers installing necessary dependencies via apt, installing the Mise version manager, and then using Mise to install Ruby globally inside the WSL distribution.

```bash
# Install dependencies with apt
$ sudo apt update
$ sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev

# Install Mise version manager
$ curl https://mise.run | sh
$ echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
$ source ~/.bashrc

# Install Ruby globally with Mise
$ mise use -g ruby@3
```

--------------------------------

### Install Ruby and Dependencies on Ubuntu

Source: https://github.com/rails/rails/blob/main/guides/source/install_ruby_on_rails.md

Offers shell commands for configuring a Ruby development environment on Ubuntu. This involves updating apt, installing build-essential packages and development libraries, then installing the Mise version manager, and finally using Mise to install Ruby globally.

```bash
# Install dependencies with apt
$ sudo apt update
$ sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev git

# Install Mise version manager
$ curl https://mise.run | sh
$ echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.bashrc
$ source ~/.bashrc

# Install Ruby globally with Mise
$ mise use -g ruby@3
```

--------------------------------

### Start a specific Homebrew service on macOS

Source: https://github.com/rails/rails/blob/main/guides/source/development_dependencies_install.md

This command starts a specific background service installed via Homebrew, such as a database server like MySQL. Replace `mysql` with the actual name of the service you intend to start to enable its functionality for your Rails development workflow.

```bash
$ brew services start mysql
```

--------------------------------

### Install Ruby and Dependencies on macOS

Source: https://github.com/rails/rails/blob/main/guides/source/install_ruby_on_rails.md

Provides a series of shell commands to prepare a macOS system for Ruby development. It includes installing Xcode Command Line Tools, Homebrew with essential libraries like OpenSSL and LibYAML, and then setting up Mise to install Ruby globally.

```bash
# Install Xcode Command Line Tools
$ xcode-select --install

# Install Homebrew and dependencies
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
$ source ~/.zshrc
$ brew install openssl@3 libyaml gmp rust

# Install Mise version manager
$ curl https://mise.run | sh
$ echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.zshrc
$ source ~/.zshrc

# Install Ruby globally with Mise
$ mise use -g ruby@3
```

--------------------------------

### Require Other Engines Before Initialization in Rails (Ruby)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby code illustrates how to immediately require other engine dependencies before the current engine's initialization block. This ensures that the required engines are loaded and available when the current engine starts its setup process, helping to manage dependency order.

```ruby
require "other_engine/engine"
require "yet_another_engine/engine"

module MyEngine
  class Engine < ::Rails::Engine
  end
end
```

--------------------------------

### Start Rails Development Server

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

After navigating into a Rails project directory, this command launches the Puma web server, which is bundled with Rails. It starts the application in development mode, typically listening on `http://localhost:3000`, allowing access to the application through a web browser.

```bash
$ cd my_app
$ bin/rails server
```

--------------------------------

### View Help for Rails Controller Generator

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

To understand the specific options and syntax for a generator, append `--help` to the command. This example shows how to get detailed usage information for the `controller` generator, including how to specify controller names, actions, and module paths.

```bash
$ bin/rails generate controller
Usage:
  bin/rails generate controller NAME [action action] [options]

...
...

Description:
    ...

    To create a controller within a module, specify the controller name as a path like 'parent_module/controller_name'.

    ...

Example:
    `bin/rails generate controller CreditCards open debit credit close`

    Credit card controller with URLs like /credit_cards/debit.
        Controller: app/controllers/credit_cards_controller.rb
        Test:       test/controllers/credit_cards_controller_test.rb
        Views:      app/views/credit_cards/debit.html.erb [...]
        Helper:     app/helpers/credit_cards_helper.rb
```

--------------------------------

### Display Rails Plugin Generator Help

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Execute this command to view the full list of options available for the `rails plugin` generator. It provides comprehensive information on various configurations and flags that can be used when creating a new Rails engine or plugin.

```bash
$ rails plugin --help
```

--------------------------------

### Create Rails Application with PostgreSQL Database (Bash)

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Illustrates how to initialize a new Rails application, `petstore`, with PostgreSQL as the default database using the `--database=postgresql` option. This preconfigures the application's database settings, streamlining setup.

```bash
$ rails new petstore --database=postgresql
      create
      create  app/controllers
      create  app/helpers
...
```

--------------------------------

### Create Basic Rails Application with `rails new` (Bash)

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Demonstrates how to create a new Rails application named `my_app` using the `rails new` command. This command initializes the standard Rails directory structure and installs necessary dependencies.

```bash
$ rails new my_app
     create
     create  README.md
     create  Rakefile
     create  config.ru
     create  .gitignore
     create  Gemfile
     create  app
     ...
     create  tmp/cache
     ...
        run  bundle install
```

--------------------------------

### Start Rails Development Server

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

The `bin/rails server` command initiates the Rails development server, typically using Puma. This allows you to access your application in a web browser, usually at `http://localhost:3000`, to test its functionality.

```bash
$ bin/rails server
=> Booting Puma...
```

--------------------------------

### Generate New Rails Application

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command creates a new Rails application named 'unicorn' from scratch. It serves as a host application to demonstrate the integration of a Rails engine.

```bash
rails new unicorn
```

--------------------------------

### Specify Runtime Gem Dependency in Rails Engine (Ruby .gemspec)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby snippet shows how to declare a runtime gem dependency within the `Gem::Specification` block of an engine's `.gemspec` file. This ensures that the specified gem ('moo' in this example) is installed when the engine is installed as a traditional gem, making it available for the engine's functionality.

```ruby
s.add_dependency "moo"
```

--------------------------------

### Display Help for Rails New Command

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Use this command to retrieve comprehensive help documentation for the `rails new` command. It lists all available options, including various `--skip` flags and other configurations, enabling users to customize the initial setup of a new Rails project.

```bash
$ rails new --help
```

--------------------------------

### Start Rails Development Server

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Launches the Rails development server, making the application accessible via a web browser. By default, it runs on http://localhost:3000.

```bash
$ bin/rails server
```

--------------------------------

### Main Engine Module Definition File

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby file (`lib/blorgh.rb`) serves as the main entry point for the 'Blorgh' engine. It requires the core engine definition (`blorgh/engine.rb`) and defines the root module, which can also be used for placing global configuration options for the engine.

```ruby
require "blorgh/engine"

module Blorgh
end
```

--------------------------------

### Install Ubuntu WSL for Rails Development on Windows

Source: https://github.com/rails/rails/blob/main/guides/source/install_ruby_on_rails.md

Provides the PowerShell command to install Ubuntu 24.04 via the Windows Subsystem for Linux (WSL). This step establishes a Linux environment within Windows, which is recommended for Ruby on Rails development due to better compatibility.

```bash
$ wsl --install --distribution Ubuntu-24.04
```

--------------------------------

### Mount Rails Engine in Application Routes

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby line, placed in the application's `config/routes.rb`, mounts the `Blorgh::Engine` at the `/blog` URL path. This makes all routes defined within the engine accessible under the specified path in the host application.

```ruby
mount Blorgh::Engine, at: "/blog"
```

--------------------------------

### Override Rails Engine View for Article Index (HTML+ERB)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Provides an example of how to override an engine's default view by creating a local application file with the same path structure. This HTML+ERB code renders a list of articles, including links and formatted content, demonstrating full customization of an engine's user interface.

```HTML+ERB
<h1>Articles</h1>
<%= link_to "New Article", new_article_path %>
<% @articles.each do |article| %>
  <h2><%= article.title %></h2>
  <small>By <%= article.author %></small>
  <%= simple_format(article.text) %>
  <hr>
<% end %>
```

--------------------------------

### Copy All Engine Migrations to Rails Application

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command copies migrations from all mounted engines into the host Rails application's `db/migrate` directory. It's a convenient way to consolidate migrations from multiple engines.

```bash
bin/rails railties:install:migrations
```

--------------------------------

### Specify Development Gem Dependency in Rails Engine (Ruby .gemspec)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby snippet demonstrates how to declare a development-only gem dependency in an engine's `.gemspec` file. Such dependencies ('moo' here) are installed during `bundle install` but are primarily used for the engine's development and testing environments, not typically needed in a production application using the engine.

```ruby
s.add_development_dependency "moo"
```

--------------------------------

### Generate Rails Guides HTML for Translation

Source: https://github.com/rails/rails/blob/main/guides/source/contributing_to_ruby_on_rails.md

To generate the Rails guides in HTML format for a specific language translation (e.g., Italian), execute these commands. First, install documentation-specific bundle dependencies, then navigate into the guides directory, and finally run the Rake task specifying the target language.

```bash
$ BUNDLE_ONLY=default:doc bundle install
$ cd guides/
$ BUNDLE_ONLY=default:doc bundle exec rake guides:generate:html GUIDES_LANGUAGE=it-IT
```

--------------------------------

### Start Rails Server with Custom Environment and Port

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

This command launches the Rails web server with specified custom configurations. The `-e production` flag sets the application's environment to 'production', and `-p 4000` instructs the server to listen on port 4000, which is useful for testing production builds or managing multiple local server instances.

```bash
$ bin/rails server -e production -p 4000
```

--------------------------------

### Run Migrations for a Specific Rails Engine

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command executes only the database migrations associated with the 'blorgh' engine within the host Rails application. The `SCOPE` option filters which migrations are applied, providing granular control.

```bash
bin/rails db:migrate SCOPE=blorgh
```

--------------------------------

### Install Rails core development dependencies on Ubuntu

Source: https://github.com/rails/rails/blob/main/guides/source/development_dependencies_install.md

This set of commands first updates the package list and then installs a comprehensive list of Rails development dependencies on Ubuntu. It covers essential tools including SQLite3, MySQL, PostgreSQL, Redis, Memcached, ImageMagick, FFmpeg, mupdf, libvips, poppler-utils, and various development libraries required for a full Rails setup.

```bash
$ sudo apt-get update
$ sudo apt-get install sqlite3 libsqlite3-dev mysql-server libmysqlclient-dev postgresql postgresql-client postgresql-contrib libpq-dev redis-server memcached imagemagick ffmpeg mupdf mupdf-tools libxml2-dev libvips42 poppler-utils libyaml-dev libffi-dev
```

--------------------------------

### Implement Rackup Server Start Logic

Source: https://github.com/rails/rails/blob/main/guides/source/initialization.md

This Ruby code block defines the `start` method in `Rackup::Server`, which is called by `Rails::Server`. It handles various server startup options like warning flags, load path inclusions, library requirements, and debug settings. It also manages PID files, calls `wrapped_app`, handles daemonization, and sets up an `INT` trap before finally running the Rack application.

```ruby
module Rackup
  class Server
    def start(&block)
      if options[:warn]
        $-w = true
      end

      if includes = options[:include]
        $LOAD_PATH.unshift(*includes)
      end

      Array(options[:require]).each do |library|
        require library
      end

      if options[:debug]
        $DEBUG = true
        require "pp"
        p options[:server]
        pp wrapped_app
        pp app
      end

      check_pid! if options[:pid]

      # Touch the wrapped app, so that the config.ru is loaded before
      # daemonization (i.e. before chdir, etc).
      handle_profiling(options[:heapfile], options[:profile_mode], options[:profile_file]) do
        wrapped_app
      end

      daemonize_app if options[:daemonize]

      write_pid if options[:pid]

      trap(:INT) do
        if server.respond_to?(:shutdown)
          server.shutdown
        else
          exit
        end
      end

      server.run(wrapped_app, **options, &block)
    end
  end
end
```

--------------------------------

### Create Specific Test Databases for Active Record

Source: https://github.com/rails/rails/blob/main/guides/source/development_dependencies_install.md

Shows how to create test databases for individual database engines, such as MySQL and PostgreSQL, by running specific Rake tasks within the `activerecord` directory. This allows for targeted database setup if not all are needed.

```bash
$ cd activerecord
$ bundle exec rake db:mysql:build
$ bundle exec rake db:postgresql:build
```

--------------------------------

### Specify Gem in Rails Gemfile

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby line demonstrates the standard way to declare a gem dependency in a Rails application's `Gemfile`. Bundler will then fetch and load this gem.

```ruby
gem "devise"
```

--------------------------------

### Install Core Dependencies on Arch Linux

Source: https://github.com/rails/rails/blob/main/guides/source/development_dependencies_install.md

Install essential development dependencies including databases (SQLite, MariaDB, PostgreSQL), caching tools (Redis, Memcached), image/video processing (ImageMagick, FFmpeg), and other libraries on Arch Linux using `pacman`. This snippet also initializes MariaDB and starts necessary services.

```bash
$ sudo pacman -S sqlite mariadb libmariadbclient mariadb-clients postgresql postgresql-libs redis memcached imagemagick ffmpeg mupdf mupdf-tools poppler yarn libxml2 libvips
$ sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
$ sudo systemctl start redis mariadb memcached
```

--------------------------------

### Get Direct Subclasses of a Class in Ruby

Source: https://github.com/rails/rails/blob/main/guides/source/active_support_core_extensions.md

Shows how the `subclasses` method, provided by Active Support, returns an array of direct subclasses for a given class. The example demonstrates its behavior as new direct subclasses are defined. The order of the returned classes is not guaranteed.

```ruby
class C; end
C.subclasses # => []

class B < C; end
C.subclasses # => [B]

class A < B; end
C.subclasses # => [B]

class D < C; end
C.subclasses # => [B, D]
```

--------------------------------

### Copy Engine Migrations to Specific Database

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command copies engine migrations while targeting a specific database connection. The `DATABASE` environment variable allows specifying which database configuration from `database.yml` should be used, useful for multi-database applications.

```bash
bin/rails railties:install:migrations DATABASE=animals
```

--------------------------------

### Instantiate and Start Rack Server in Rails

Source: https://github.com/rails/rails/blob/main/guides/source/rails_on_rack.md

Demonstrates the internal Ruby code executed by `bin/rails server` to create and start a `Rack::Server` instance, including requiring the main application path and setting the working directory.

```ruby
Rails::Server.new.tap do |server|
  require APP_PATH
  Dir.chdir(Rails.application.root)
  server.start
end
```

--------------------------------

### Correct Functional Test for Rails Engine Controller with Routes

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby code provides the correct method for writing a functional test for a Rails engine controller. By setting the `@routes` instance variable to `Engine.routes` within the `setup` block, the test correctly directs requests to the engine's routing system, enabling proper URL helper resolution and request processing.

```ruby
module Blorgh
  class FooControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    def test_index
      get foos_url
      # ...
    end
  end
end
```

--------------------------------

### Change Rails Database System

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

The `db:system:change` command facilitates switching the application's database system, for example, from SQLite to PostgreSQL. This process updates `config/database.yml` and modifies the `Gemfile` to reflect the new database, requiring a subsequent `bundle install` to fetch any new dependencies.

```bash
$ rails db:system:change --to=postgresql
    conflict  config/database.yml
Overwrite config/database.yml? (enter "h" for help) [Ynaqdhm] Y
       force  config/database.yml
        gsub  Gemfile
        gsub  Gemfile
...
```

```bash
$ bundle install
...
```

--------------------------------

### Get Start/End of Minute for Ruby DateTime Objects

Source: https://github.com/rails/rails/blob/main/guides/source/active_support_core_extensions.md

Illustrates `beginning_of_minute` and `end_of_minute` methods for `DateTime` objects. These provide timestamps at the start (hh:mm:00) or end (hh:mm:59) of the specified minute, and are designed exclusively for `Time` and `DateTime` instances.

```ruby
date = DateTime.new(2010, 6, 7, 19, 55, 25)
date.beginning_of_minute # => Mon Jun 07 19:55:00 +0200 2010
```

```ruby
date = DateTime.new(2010, 6, 7, 19, 55, 25)
date.end_of_minute # => Mon Jun 07 19:59:59 +0200 2010
```

--------------------------------

### Copy Specific Engine Migrations to Rails Application

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command copies database migrations from the 'blorgh' engine into the host Rails application's `db/migrate` directory. It ensures the application has the necessary schema changes to support the engine's models.

```bash
bin/rails blorgh:install:migrations
```

--------------------------------

### Get Start/End of Hour for Ruby DateTime Objects

Source: https://github.com/rails/rails/blob/main/guides/source/active_support_core_extensions.md

Demonstrates `beginning_of_hour` and `end_of_hour` methods for `DateTime` objects. These methods return timestamps at the exact start (hh:00:00) or end (hh:59:59) of the given hour, and are applicable to `Time` and `DateTime` instances.

```ruby
date = DateTime.new(2010, 6, 7, 19, 55, 25)
date.beginning_of_hour # => Mon Jun 07 19:00:00 +0200 2010
```

```ruby
date = DateTime.new(2010, 6, 7, 19, 55, 25)
date.end_of_hour # => Mon Jun 07 19:59:59 +0200 2010
```

--------------------------------

### Create a new Rails 3.2 application

Source: https://github.com/rails/rails/blob/main/guides/source/3_2_release_notes.md

To start a new project with Rails 3.2, ensure the `rails` RubyGem is installed, then execute this command in your terminal. This command scaffolds a new Rails application named 'myapp' with all the default configurations for Rails 3.2, and subsequently navigates into the newly created directory.

```bash
rails new myapp
cd myapp
```

--------------------------------

### Define Nested Routes for Comments in Rails Engine

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby snippet configures nested routes in `config/routes.rb` to establish a relationship between `articles` and `comments`. This setup ensures that comment actions are scoped under specific articles, such as `/articles/:article_id/comments`, which is required by the comment form.

```ruby
resources :articles do
  resources :comments
end
```

--------------------------------

### Generate a Specific HTML Rails Guide (Shell)

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

To process only a particular guide (e.g., `my_guide.md`), first create a placeholder file for it, then use the `ONLY` environment variable with the Rake task. This is useful for focused development and testing.

```bash
$ touch my_guide.md
$ bundle exec rake guides:generate ONLY=my_guide
```

--------------------------------

### Display Rails Application Environment Information

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

The `about` command provides a summary of the Rails application's environment, including version numbers for Ruby, Rails, RubyGems, Rack, and details about middleware, application root, environment, and database. It's helpful for debugging, support, and gathering system statistics for an existing Rails installation.

```bash
$ bin/rails about
About your application's environment
Rails version             8.1.0
Ruby version              3.2.0 (x86_64-linux)
RubyGems version          3.3.7
Rack version              3.0.8
JavaScript Runtime        Node.js (V8)
Middleware:               ActionDispatch::HostAuthorization, Rack::Sendfile, ActionDispatch::Static, ActionDispatch::Executor, ActionDispatch::ServerTiming, ActiveSupport::Cache::Strategy::LocalCache::Middleware, Rack::Runtime, Rack::MethodOverride, ActionDispatch::RequestId, ActionDispatch::RemoteIp, Sprockets::Rails::QuietAssets, Rails::Rack::Logger, ActionDispatch::ShowExceptions, WebConsole::Middleware, ActionDispatch::DebugExceptions, ActionDispatch::ActionableExceptions, ActionDispatch::Reloader, ActionDispatch::Callbacks, ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, ActionDispatch::Flash, ActionDispatch::ContentSecurityPolicy::Middleware, ActionDispatch::PermissionsPolicy::Middleware, Rack::Head, Rack::ConditionalGet, Rack::ETag, Rack::TempfileReaper
Application root          /home/foobar/my_app
Environment               development
Database adapter          sqlite3
Database schema version   20180205173523
```

--------------------------------

### Start Rails Development Server

Source: https://github.com/rails/rails/blob/main/README.md

After navigating into your Rails application directory, this command starts the built-in web server (Puma by default). This allows you to access and test your application locally, typically at http://localhost:3000.

```bash
$ cd myapp
$ bin/rails server
```

--------------------------------

### Install Rails Gem

Source: https://github.com/rails/rails/blob/main/README.md

This command installs the Ruby on Rails framework as a Ruby gem on your system, making the 'rails' command-line interface available. It requires Ruby and RubyGems to be pre-installed.

```bash
$ gem install rails
```

--------------------------------

### Apply Inline Formatting to Markdown Headings in Rails Guides

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

This example shows how to use inline formatting, specifically `:content_type`, within Markdown headings, applying the same rules as regular text.

```markdown
##### The `:content_type` Option
```

--------------------------------

### Copy Engine Migrations from Custom Source Path

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command copies engine migrations, allowing specification of a custom source path within the engine for the migrations using `MIGRATIONS_PATH`. This is useful if an engine organizes its migrations outside the conventional `db/migrate` directory.

```bash
bin/rails railties:install:migrations MIGRATIONS_PATH=db_blourgh
```

--------------------------------

### Generate a Mountable Rails Engine

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This command generates a new Rails engine named 'blorgh' with the `--mountable` option. The `--mountable` option ensures the engine is namespace-isolated and includes additional features like asset manifests and namespaced controllers, making it suitable for integration into a host application.

```bash
$ rails plugin new blorgh --mountable
```

--------------------------------

### Get All Descendant Classes of a Class in Ruby

Source: https://github.com/rails/rails/blob/main/guides/source/active_support_core_extensions.md

Illustrates the `descendants` method, an Active Support extension, which returns all classes that inherit from the receiver, directly or indirectly. The example demonstrates how the list grows as new descendants are defined. The order of the returned classes is not specified.

```ruby
class C; end
C.descendants # => []

class B < C; end
C.descendants # => [B]

class A < B; end
C.descendants # => [B, A]

class D < C; end
C.descendants # => [B, A, D]
```

--------------------------------

### Mount Rails Engine in Application Routes

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby code snippet demonstrates how to mount a Rails Engine, `Blorgh::Engine`, into a host application's routes file (`test/dummy/config/routes.rb`). It makes the engine's routes accessible at the specified URL path, in this case, `/blorgh`.

```ruby
mount Blorgh::Engine => "/blorgh"
```

--------------------------------

### Install Action Mailbox in Rails Application

Source: https://github.com/rails/rails/blob/main/guides/source/action_mailbox_basics.md

This command runs the Action Mailbox installer, which sets up the necessary `application_mailbox.rb` file and copies over database migration files required for Action Mailbox functionality.

```bash
bin/rails action_mailbox:install
```

--------------------------------

### Generate Kindle-formatted Rails Guides (Shell)

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

To produce guides specifically formatted for Kindle e-readers, execute the `guides:generate:kindle` Rake task. This task will convert the guide sources into a Kindle-compatible output.

```bash
$ bundle exec rake guides:generate:kindle
```

--------------------------------

### Namespaced Rails Engine Routes File

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This code snippet illustrates the namespaced routing configuration for an engine, specifically for 'Blorgh', found in `config/routes.rb` when using the `--mountable` option. It ensures that the engine's routes are isolated from the host application's routes, preventing clashes.

```ruby
Blorgh::Engine.routes.draw do
end
```

--------------------------------

### Format Headings with Title Case in Markdown for Rails Guides

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

Examples demonstrating the capitalization rules for Markdown headings in Rails Guides. All words are capitalized except for prepositions, conjunctions, internal articles, and forms of 'to be'.

```markdown
#### Assertions and Testing Jobs inside Components
#### Middleware Stack is an Array
#### When are Objects Saved?
```

--------------------------------

### Create Database for Rails Plugin Dummy Application

Source: https://github.com/rails/rails/blob/main/guides/source/plugins.md

Navigate into the `test/dummy` directory of the plugin and execute the `rails db:create` command. This sets up the database required for the dummy Rails application, enabling proper testing of the plugin's integration and functionality.

```bash
$ cd test/dummy
$ bin/rails db:create
```

--------------------------------

### Start Rails Solid Queue Workers

Source: https://github.com/rails/rails/blob/main/guides/source/active_job_basics.md

This `bash` command initiates the Solid Queue worker process, which is responsible for processing jobs enqueued in the Solid Queue system. Running this command is essential to start job execution and background task processing.

```bash
bin/jobs start
```

--------------------------------

### List All Available Rails Commands

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Executing `rails --help` provides a detailed list of all commands accessible within the current Rails application context. Each command includes a brief description, making it a valuable resource for discovering functionalities like code generation, console interaction, server management, and database operations.

```bash
$ rails --help
```

--------------------------------

### Generate Comments Controller for Rails Engine

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This command generates a new `CommentsController` within the Rails engine. It creates the controller file, associated `app/views/blorgh/comments` directory, helper, and test files, all properly namespaced under `blorgh`.

```bash
bin/rails generate controller comments
```

--------------------------------

### Interactive Ruby Shell (IRB) Session Example

Source: https://github.com/rails/rails/blob/main/guides/source/api_documentation_guidelines.md

This example illustrates how to document an interactive Ruby session using `irb>` for commands and `=>` for output, specifically finding a customer by primary key.

```ruby
# Find the customer with primary key (id) 10.
#   irb> customer = Customer.find(10)
#   # => #<Customer id: 10, first_name: "Ryan">
```

--------------------------------

### Generated PostgreSQL Database Configuration (YAML)

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Presents the `config/database.yml` file content generated when creating a Rails application with PostgreSQL. It shows the `postgresql` adapter, encoding, and connection pool settings, along with commented installation instructions for the `pg` gem.

```yaml
# PostgreSQL. Versions 9.3 and up are supported.
#
# Install the pg driver:
#   gem install pg
# On macOS with Homebrew:
#   gem install pg -- --with-pg-config=/opt/homebrew/bin/pg_config
# On Windows:
#   gem install pg
#       Choose the win32 build.
#       Install PostgreSQL and put its /bin directory on your path.
#
# Configure Using Gemfile
# gem "pg"
#
default: &default
  adapter: postgresql
  encoding: unicode

  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: petstore_development
...
```

--------------------------------

### Run Rails Command-line Application

Source: https://github.com/rails/rails/blob/main/guides/source/api_documentation_guidelines.md

This snippet provides an example of a command-line operation in a Rails project, demonstrating how to prefix commands with `$` and noting that output does not require a prefix.

```ruby
# Run the following command:
#   $ bin/rails new zomg
#   ...
```

--------------------------------

### Define Rails Server Start Method

Source: https://github.com/rails/rails/blob/main/guides/source/initialization.md

This Ruby code defines the `start` method for `Rails::Server`. It sets up an `INT` signal trap, creates necessary temporary directories (`tmp/cache`, `tmp/pids`, `tmp/sockets`), enables development caching if specified, logs to stdout, and then calls the `super` method from `Rackup::Server` to continue the startup process.

```ruby
module Rails
  class Server < ::Rackup::Server
    def start(after_stop_callback = nil)
      trap(:INT) { exit }
      create_tmp_directories
      setup_dev_caching
      log_to_stdout if options[:log_stdout]

      super()
      # ...
    end

    private
      def setup_dev_caching
        if options[:environment] == "development"
          Rails::DevCaching.enable_by_argument(options[:caching])
        end
      end

      def create_tmp_directories
        %w(cache pids sockets).each do |dir_to_make|
          FileUtils.mkdir_p(File.join(Rails.root, "tmp", dir_to_make))
        end
      end

      def log_to_stdout
        wrapped_app # touch the app so the logger is set up

        console = ActiveSupport::Logger.new(STDOUT)
        console.formatter = Rails.logger.formatter
        console.level = Rails.logger.level

        unless ActiveSupport::Logger.logger_outputs_to?(Rails.logger, STDERR, STDOUT)
          Rails.logger.broadcast_to(console)
        end
      end
  end
end
```

--------------------------------

### Install Ruby Gem Dependencies Excluding Database Gems

Source: https://github.com/rails/rails/blob/main/guides/source/development_dependencies_install.md

Shows how to install Ruby gem dependencies using Bundler while explicitly excluding groups related to database tests. This is useful for development setups where Active Record tests are not immediately required.

```bash
$ bundle config set without db
$ bundle install
```

--------------------------------

### Get Substring from Position with Ruby on Rails `String#from`

Source: https://github.com/rails/rails/blob/main/guides/source/active_support_core_extensions.md

The `from` method, an Active Support extension for strings, extracts a substring starting from the given `position`. It supports positive and negative indices, returning the remainder of the string from that point. If the `position` is beyond the string's length, it returns `nil`. This method is defined in `active_support/core_ext/string/access.rb`.

```ruby
"hello".from(0)  # => "hello"
"hello".from(2)  # => "llo"
"hello".from(-2) # => "lo"
"hello".from(10) # => nil
```

--------------------------------

### Incorrect Functional Test for Rails Engine Controller

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby code demonstrates an incorrect approach to writing a functional test for a Rails engine controller. It attempts a GET request to a URL helper without explicitly setting the engine's routes, which will fail because the dummy application hosting the test does not know how to route the request to the engine.

```ruby
module Blorgh
  class FooControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    def test_index
      get foos_url
      # ...
    end
  end
end
```

--------------------------------

### Default Rails Application Routes File

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This code snippet shows the default structure of a `config/routes.rb` file in a standard Rails application. It's used to define all application-level routes and is included when an engine is generated with the `--full` option.

```ruby
Rails.application.routes.draw do
end
```

--------------------------------

### Generate User Model in Rails Application (Bash)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Command to generate a new `User` model within the main Rails application. This model will represent authors for the engine's articles and includes a `name` string attribute.

```bash
bin/rails generate model user name:string
```

--------------------------------

### Execute Rails Server Startup Logic (Ruby)

Source: https://github.com/rails/rails/blob/main/guides/source/initialization.md

The `perform` method within `Rails::Command::ServerCommand` encapsulates the entire server startup sequence for a Rails application. It handles crucial initial steps like setting the application's root directory and preparing for server restarts. Subsequently, it initializes `Rails::Server`, loads the application, and starts the server if it's in a serveable state, providing informative console output during the process.

```ruby
module Rails
  module Command
    class ServerCommand < Base # :nodoc:
      def perform
        set_application_directory!
        prepare_restart

        Rails::Server.new(server_options).tap do |server|
          # Require application after server sets environment to propagate
          # the --environment option.
          require APP_PATH
          Dir.chdir(Rails.application.root)

          if server.serveable?
            print_boot_information(server.server, server.served_url)
            after_stop_callback = -> { say "Exiting" unless options[:daemon] }
            server.start(after_stop_callback)
          else
            say rack_server_suggestion(options[:using])
          end
        end
      end
    end
  end
end
```

--------------------------------

### Reference Rails Routes within Engines and Application (ERB)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Illustrates different ways to reference routes when working with Rails engines, highlighting potential ambiguities and explicit methods for clarity. It shows how `articles_path` behaves differently based on context, how to explicitly call engine routes using a proxy (e.g., `blorgh.articles_path`), and how to access main application routes from an engine using the `main_app` helper.

```ERB
<%= link_to "Blog articles", articles_path %>
```

```ERB
<%= link_to "Blog articles", blorgh.articles_path %>
```

```ERB
<%= link_to "Home", main_app.root_path %>
```

--------------------------------

### Specify Rails Engine as a Gem in Gemfile

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby line in a Rails application's `Gemfile` includes the 'blorgh' engine as a gem. The `path` option tells Bundler to load the gem from a local directory (e.g., `engines/blorgh`), which is typically used during engine development or when including local engines.

```ruby
gem "blorgh", path: "engines/blorgh"
```

--------------------------------

### View Rails Guide Generation Environment Variables (Shell)

Source: https://github.com/rails/rails/blob/main/guides/source/ruby_on_rails_guides_guidelines.md

To discover all available environment variables that can be used to configure the guide generation script, simply run the `rake` command without any specific tasks from within the guides directory.

```bash
$ rake
```

--------------------------------

### Start Standalone Action Cable Server with Puma

Source: https://github.com/rails/rails/blob/main/guides/source/action_cable_overview.md

After creating a Rack configuration for the standalone Action Cable server, use a Rack-compatible web server like Puma to start it. This command runs the `cable/config.ru` file on a specified port, making the Action Cable server accessible.

```bash
$ bundle exec puma -p 28080 cable/config.ru
```

--------------------------------

### Group Rake Tasks with Namespaces in Ruby

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

This example illustrates how to group related Rake tasks under a common namespace. Namespacing helps organize tasks, prevent naming conflicts, and improve readability in larger Rails applications.

```ruby
namespace :db do
  desc "This task does nothing"
  task :nothing do
    # Seriously, nothing
  end
end
```

--------------------------------

### Rackup Server Run Method Invocation (Ruby)

Source: https://github.com/rails/rails/blob/main/guides/source/initialization.md

This Ruby line demonstrates how the `run` method is invoked on a server instance, passing the `wrapped_app`, options, and an optional block. The actual implementation of `server.run` is dependent on the specific web server (e.g., Puma, Thin) being used.

```ruby
server.run(wrapped_app, **options, &block)
```

--------------------------------

### Execute Callback After Gem Bundling in Rails Template

Source: https://github.com/rails/rails/blob/main/guides/source/generators.md

The `after_bundle` method registers a callback to be executed once gem bundling is complete. This is crucial for running installation commands for newly added gems, such as `tailwindcss-rails` or `devise`, which require setup steps after `bundle install`.

```ruby
# Install gems
after_bundle do
  # Install TailwindCSS
  rails_command "tailwindcss:install"

  # Install Devise
  generate "devise:install"
end
```

--------------------------------

### Create Comment Form Partial in Rails Engine

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Defines the HTML structure and ERB logic for a new comment submission form. This partial, `_form.html.erb`, uses `form_with` to build a form for a new `Blorgh::Comment` associated with an `Blorgh::Article`.

```html+erb
<h3>New comment</h3>
<%= form_with model: [@article, @article.comments.build] do |form| %>
  <p>
    <%= form.label :text %><br>
    <%= form.textarea :text %>
  </p>
  <%= form.submit %>
<% end %>
```

--------------------------------

### Implement Create Action in Rails Comments Controller

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This Ruby code defines the `create` action and `comment_params` private method in `Blorgh::CommentsController`. The `create` action finds the parent article, builds a new comment with permitted parameters, sets a flash notice, and redirects to the articles index path after successful creation.

```ruby
def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.create(comment_params)
  flash[:notice] = "Comment has been created!"
  redirect_to articles_path
end

private
  def comment_params
    params.expect(comment: [:text])
  end
```

--------------------------------

### Extend Rails Engine Article Model with Custom Methods (Ruby)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Defines a custom `Article` model within the `Blorgh` engine context, including methods to calculate time since creation and generate a summary. This demonstrates how an application can extend an engine's model with additional logic by reopening its class.

```Ruby
class Blorgh::Article < ApplicationRecord
  include Blorgh::Concerns::Models::Article

  def time_since_created
    Time.current - created_at
  end

  def summary
    "#{title} - #{truncate(text)}"
  end
end
```

--------------------------------

### Start Rails Server with HTTP/2 Early Hints

Source: https://github.com/rails/rails/blob/main/guides/source/5_2_release_notes.md

This command demonstrates how to start the Rails server with HTTP/2 Early Hints enabled. This feature allows servers to send hints to clients about resources that will likely be needed for the upcoming navigation, potentially improving load times.

```bash
bin/rails server --early-hints
```

--------------------------------

### Define Base Rails Engine Article Model (Ruby)

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

Illustrates the fundamental definition of an `Article` model within the `Blorgh` engine, inheriting from `ApplicationRecord` and including a concern for shared functionalities. This is the core model structure typically provided by the engine itself.

```Ruby
module Blorgh
  class Article < ApplicationRecord
    include Blorgh::Concerns::Models::Article
  end
end
```

--------------------------------

### Create All Test Databases for Active Record

Source: https://github.com/rails/rails/blob/main/guides/source/development_dependencies_install.md

Instructions to navigate to the `activerecord` directory and use a Bundler-executed Rake task to create all necessary test databases for Active Record. This method ensures databases are created with the correct character set and collation.

```bash
$ cd activerecord
$ bundle exec rake db:create
```

--------------------------------

### Handle Clashing Named Routes in Rails 4.0

Source: https://github.com/rails/rails/blob/main/guides/source/upgrading_ruby_on_rails.md

This Ruby code demonstrates two scenarios that cause an `ArgumentError` due to clashing named routes in Rails 4.0. The first example shows two `get` routes with the same `as: :example` alias, while the second shows a `resources` declaration clashing with an explicitly defined route using the same `example` name. To resolve this, avoid duplicate names or use `only`/`except` options with `resources`.

```Ruby
get "one" => "test#example", as: :example
get "two" => "test#example", as: :example
```

```Ruby
resources :examples
get "clashing/:id" => "test#example", as: :example
```

--------------------------------

### Invoke Rake Tasks from the Command Line

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

These bash commands demonstrate various ways to execute Rake tasks from the terminal. It includes examples for running simple tasks, tasks with single or multiple arguments, and namespaced tasks using the `bin/rails` command.

```bash
$ bin/rails task_name
$ bin/rails "task_name[value 1]" # entire argument string should be quoted
$ bin/rails "task_name[value 1,value2,value3]" # separate multiple args with a comma
$ bin/rails db:nothing
```

--------------------------------

### Revert All Migrations for a Specific Rails Engine

Source: https://github.com/rails/rails/blob/main/guides/source/engines.md

This bash command reverts all database migrations for the 'blorgh' engine by setting the `VERSION` to 0. This action is useful for undoing an engine's schema changes, typically before removing the engine from an application.

```bash
bin/rails db:migrate SCOPE=blorgh VERSION=0
```

--------------------------------

### Implement Conditional GET with `stale?` (Model Object)

Source: https://github.com/rails/rails/blob/main/guides/source/caching_with_rails.md

This example shows a simplified usage of the `stale?` helper by passing a model object directly. Rails automatically extracts `updated_at` and `cache_key_with_version` from the model to set `last_modified` and `etag` for conditional GET processing.

```ruby
class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    if stale?(@product)
      respond_to do |wants|
        # ... normal response processing
      end
    end
  end
end
```

--------------------------------

### Access Rails Console in Sandbox Mode

Source: https://github.com/rails/rails/blob/main/guides/source/command_line.md

Starts the Rails console in sandbox mode, where any modifications made to the database or application state are automatically rolled back upon exiting the console. This is ideal for testing without permanent side effects.

```bash
$ bin/rails console --sandbox
Loading development environment in sandbox (Rails 8.1.0)
Any modifications you make will be rolled back on exit
irb(main):001:0>
```

--------------------------------

### Configure and Run Rails Dev Container with Podman

Source: https://github.com/rails/rails/blob/main/guides/source/contributing_to_ruby_on_rails.md

Instructions on how to initialize and start a Podman machine, then use custom `tools/devcontainer` scripts to bring up, run user commands, and enter a shell within a Rails development environment. This approach is self-contained and only requires Podman.

```bash
$ podman machine init
$ podman machine start
$ tools/devcontainer up
$ tools/devcontainer run-user-commands
$ tools/devcontainer sh
```