# 📬 Rapidmail

A Ruby wrapper for the Rapidmail API V3. This gem provides an easy-to-use interface for interacting with the Rapidmail newsletter service API.

## 📋 Table of Contents
- [🚀 Installation](#-installation)
- [⚙️ Configuration](#️-configuration)
- [🔨 Usage](#-usage)
  - [Basic Usage (Example)](#basic-usage-example)
  - [Working with ZIP Files](#working-with-zip-files)
- [⚡ Rails Integration (optional)](#-rails-integration-optional)
- [📚 Documentation](#-documentation)
- [💻 Development](#-development)


## 🚀 Installation

Add this line to your application's Gemfile:

```ruby
gem 'rapidmail'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install rapidmail
```

## ⚙️ Configuration
Configure Rapidmail with your credentials:

```ruby
Rapidmail.configure do |config|
  config.username = 'your_username'
  config.password = 'your_password'
end
```

Or load configuration from an YAML file:
```ruby
Rapidmail::Utils::ConfigLoader.load('path/to/your/config.yml')
```

## 🔨 Usage

### Basic Usage (Example)

```ruby
# Initialize client
client = Rapidmail.client

# List mailings
client.mailings.list

# Find specific mailing
client.mailings.find(123)

# Create mailing
client.mailings.create(params)

# Delete mailing
client.mailings.destroy(123)
```

### Working with ZIP Files

```ruby
# Encode files for upload
files = {
  "newsletter.txt" => "Hello, World!",
  "newsletter.html" => "<p>Hello, World!</p>"
}

encoded_data = Rapidmail::Utils::ZipEncoder.encode(files)
```

## ⚡ Rails Integration (optional)

To set up Rapidmail in a Rails application:

```bash
rails generate rapidmail:install
```

This will create an initializer at `config/initializers/rapidmail.rb`

## 📚 Documentation
Full documentation is available at https://cortona.github.io/rapidmail-ruby/

## 💻 Development
After checking out the repo:

1. Run `bin/setup` to install dependencies
2. Create `config/credentials.yml` with your API credentials
3. Run `bin/console` for an interactive prompt
