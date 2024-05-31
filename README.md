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
