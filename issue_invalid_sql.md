# Issue: Invalid SQL

In [Rails Guides Association Basics](https://guides.rubyonrails.org/association_basics.html) for Composite Primary Keys,
following the Author and Book model examples, creating the books generates invalid SQL.

The intention is to go through `author.books` using the created `Author` instance assigned to `author` in rails console.

However, the generated SQL shows that it's trying to set first_name on books, which is on author and not books.

```
irb(main):002> author = Author.create!(first_name: "Jane", last_name: "Doe")
D, [2024-05-31T10:56:51.006384 #36300] DEBUG -- :   TRANSACTION (0.3ms)  BEGIN
D, [2024-05-31T10:56:51.006858 #36300] DEBUG -- :   Author Create (0.8ms)  INSERT INTO "authors" ("first_name", "last_name") VALUES (
$1, $2) RETURNING "id"  [["first_name", "Jane"], ["last_name", "Doe"]]
D, [2024-05-31T10:56:51.007653 #36300] DEBUG -- :   TRANSACTION (0.7ms)  COMMIT
=> #<Author:0x0000000110f97318 id: 2, first_name: "Jane", last_name: "Doe">
irb(main):003> book = author.books.create!(title: "A Cool Book")
/Users/andy/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activemodel-7.1.3.3/lib/active_model/attribute_assignment.rb:51:in `_assign_attribute': unknown attribute 'first_name' for Book. (ActiveModel::UnknownAttributeError)

          raise UnknownAttributeError.new(self, k.to_s)
          ^^^^^
        from /Users/andy/.rbenv/versions/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.1.3.3/lib/active_record/attribute_assignment.rb:19:in `block in _assign_attributes'
        from /Users/andy/.rbenv/versions/3.2.2/
```

Similarly, calling `author.books` generates invalid SQL:

```
irb(main):004> author
=> #<Author:0x0000000110f97318 id: 2, first_name: "Jane", last_name: "Doe">

irb(main):005> author.books
An error occurred when inspecting the object: #<ActiveRecord::StatementInvalid:"PG::UndefinedColumn: ERROR:  column books.first_name
does not exist\nLINE 1: SELECT \"books\".* FROM \"books\" WHERE \"books\".\"first_name\" = $...\n
        ^\n">
```
