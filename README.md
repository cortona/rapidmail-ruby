# 📬 Rapidmail

A Ruby wrapper for the Rapidmail API V3. This gem provides an easy-to-use interface for interacting with the Rapidmail newsletter service API.

## 📋 Table of Contents
- [🚀 Installation](#-installation)
- [⚡ Rails Integration (optional)](#-rails-integration-optional)
- [⚙️ Configuration](#️-configuration)
- [🔨 Usage](#-usage)
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

## ⚡ Rails Integration (optional)

To set up Rapidmail in a Rails application:

```bash
rails generate rapidmail:install
```

This will create an initializer at `config/initializers/rapidmail.rb`

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
Initialize a client:

```ruby
client = Rapidmail.client

# Or with explicit credentials
client = Rapidmail.client(
  username: 'your_username',
  password: 'your_password'
)
```
Make API requests:

```ruby
# GET request
response = client.get('/recipientlists', { page: 1 })

# POST request
response = client.post('/recipientlists', {
  name: "Test name",
  description: "Test description",
  unsubscribe_blacklist: "no",
  recipient_subscribe_email: "no",
  default: "no"
})
```

## 💻 Development
After checking out the repo:

1. Run `bin/setup` to install dependencies
2. Create `config/credentials.yml` with your API credentials
3. Run `bin/console` for an interactive prompt
