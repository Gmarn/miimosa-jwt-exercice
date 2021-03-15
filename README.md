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

### Project set up

Ruby version:
```bash
2.7.1
```

Run in the terminal after installing bunlder gem:

```
  bundle install
  bundle exec rake db:create db:migrate
```

### Running with docker

### Run linter

We are using rubocop. We run rubocop on `app` directory

```bash
bundle exec rubocop app
```
