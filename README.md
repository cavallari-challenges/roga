# Complaints API 1.0

## Instructions

Here you have some instructions on how to start developing this appliacation

### Using docker?

1. Ensure you have `docker` and `docker-compose` installed
2. Create a `.env` file in the root of the project using `.env.sample` as template
3. In the root of the project run `docker-compose up` and wait until download images and build application
4. Run `docker-compose run app bundle exec db:setup` to setup the database and run the seeds if exists
5. Your application is running on `http://localhost:3000`

### Not using docker?

1. Ensure sou have installed ruby `2.7.1` (or install via rvm.io) and postgresql at least version 10
2. Install bundler if not installed yet: `gem install bundler`
3. Install the dependencies: `bundle install` or just `bundle` works as well
4. Create a `.env` file in the root of the project and use `.env.sample` as template, filling the variables
5. Setup the database by running `bundle exec rails db:setup`
6. Start the server using the command `bundle exec rails s`
7. Your application is running on `http://localhost:3000`


## API

1. Use postman, you have two collections in `postman_files` directory, import both to postman
2. Create an environment in postman, `local` for example
3. In `local` variables create the `base_url` and set this value to your development url, ex: `http://localhost:3000/api/1.0`, 
remember that our api is versioned, then we need the `/api/v1` in the `base_url`
4. Use the Public api collection to create a user and login with it, get the `Authorization` response header and get 
only the token (without the `Bearer` keyword) and set a new environment variable `token` with this value
5. You can now start using the `Protected API`
