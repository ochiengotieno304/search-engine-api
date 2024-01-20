# Set Up Guide

This guide will walk you through the steps necessary to set up and run the application.

## Ruby version

Make sure you have the correct version of Ruby installed. The recommended version for this application is Ruby 3.2.2.

## Setup
Run the following command to install dependencies
```bash
    bundle install
```

## Database setup
For this project I've used MongoDB as primary storage. Open mongoid.yaml in config and edit configs to match your configurations. An example is as shown.
```yaml
development:
  clients:
    default:
      database: api_development
      hosts:
        - localhost:27017
      options:
        server_selection_timeout: 1
```

## How to run the test suite

For tests we use Rspec
 ```bash
    bundle exec rspec
 ```

## ...

Feel free to add any additional steps or instructions specific to your application.
