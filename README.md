# README

### Database Setup

We are using PostgreSQL as databse service
After installing it, run in the terminal the following commands.

For Linux:
```bash
  sudo -u postgres psql
  CREATE ROLE "miimosa-jwt" LOGIN CREATEDB PASSWORD 'miimosa-jwt';
```

On MacOS:
```bash
  psql postgres
  CREATE ROLE "miimosa-jwt" LOGIN CREATEDB PASSWORD 'miimosa-jwt';
```

Log out from postgres

### Project set up on local

Ruby version:
```bash
2.7.1
```

Run in the terminal after installing bunlder gem:

```
  bundle install
  bundle exec rake db:create db:migrate db:seed
```

### Running with docker

We have a DOCKERFILE for the rails application and a docker-compose to handle a docker image
with the rails app and the postgres database.

To build the image and run it:
```bash
docker-compose -f docker-compose.yml up --build
```

After that we need to create databse and populate it:
```bash
docker-compose run web rails db:create db:migrate db:seed
```

Now we can launch newly the services:
```bash
docker-compose up
```

### Run linter

We are using rubocop. We run rubocop on `app` and `spec` directory

```bash
bundle exec rubocop app spec
```

### Run test

We are using RSpec, before we need to create database for testing enviroment:

```bash
bundle exec rake db:create db:migrate RAILS_ENV=test
```

```bash
bundle exec rspec
```
