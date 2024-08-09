# Bookshop
I started from Greg Molnar's example, and swapped out SQLite for PostgreSQL.
<https://greg.molnar.io/blog/a-single-file-rails-application/>

## Postgres
Create the database manually.

I'll use the postgres user which is a built-in superuser.

Warning: For real applications, do not use a superuser as the creator (and owner) of your application database. Instead, choose a user with fewer privileges.
```sh
createdb bookshop_development
```

## Start Rails Console
```rb
ruby console.rb
```

To start over run:
```sh
dropdb --if-exists bookshop_development
```

## Active Record
From the [Rails Guide](https://guides.rubyonrails.org/association_basics.html):

From a rails console:
```rb
author = Author.create!(first_name: "Jane", last_name: "Doe")
book = author.books.create!(title: "A Cool Book")
```

## Dev Containers
A new Rails app "myapp" can be generated using the commands below. The app will be within this repository and exists only to try out generating dev container configuration.

This command generates a Rails 7.2 app called "myapp" with PostgreSQL. Configuration will be within the `.devcontainer` directory.
```sh
rails new myapp --database=postgresql --devcontainer
```

Once generated, open "myapp" in VS Code either from the application or from your terminal.

To configure command line integration in VS Code, run `Command-Shift-P` (macOS) and choose "Install 'code' command in PATH". Refer to these instructions for more info: [configure your shell](https://code.visualstudio.com/docs/setup/mac).

Once installed in your `PATH`, run `code --version` to verify it's reachable.

With that in place, running `code myapp` will open "myapp" in VS Code. The devcontainers should be auto detected.

Choose "Dev Containers: Rebuild in Container" which launches Docker and all the app dependencies, including PostgreSQL.
