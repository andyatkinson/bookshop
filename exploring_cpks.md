# Exploring CPKs

For Postgres:
```sql
dropdb --if-exists bookshop_development
createdb bookshop_development
```

For the single file Rails app, from the directory:
```rb
ruby console.rb

author = Author.create!(first_name: "Jane", last_name: "Doe")

author.books

book = author.books.create!(title: "A Cool Book")
```
