# Orderable2

 User defined sorting of ActiveRecord queries for Rails 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orderable2'
```

And then execute:
```bash
$ bundle install
```

## Usage

### Controllers

* Include the gem in the controller you wish to be sortable

```ruby
class UsersController < ApplicationController
  include Orderable2

  [...]
end
```

* Order your collection using the `sort_order` method

```ruby
class UsersController < ApplicationController
  include Orderable2

  def index
    @users = User.all.order(sort_order)
  end
end
```

This uses the order provided in the params or falls back to ordering by ascending ID if no order parameter is present in the request.

You can also override the default order in the sort_order call:

```ruby
class UsersController < ApplicationController
  include Orderable2

  def index
    @users = User.all.order(sort_order(email: :asc, id: :asc))
  end
end
```

This would sort by ascending email and ascending ID if no ordering params are present in the request.

To set the ordering using request parameters, set a parameter named `order` containing a sorting definition in the following format:

```
attribute:direction
```

For example:

```
country:asc
```

Multiple columns may be defined by separating them by comma:

```
country:asc,id:asc
```

So, to create a link that sorts users by country, you could use the following

```ruby
users_path(order: 'country:asc')
```

### Views

Orderable2 includes view helpers that simplify usage in the views.

In order to print the label of a table column or filter, use the following helper

```ruby
<%= orderable_for :country %>
```

This automatically creates the necessary label and displays the current sort order using &uarr; or &darr;. Clicking on the label reorders by that column.

By default, the helper lets you sort by multiple columns, for example username ASC, country DESC. If you wish to disable this behaviour and only allow sorting based on a single column, use the `single` option:

```ruby
<%= orderable_for :country, single: true %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/code-fabrik/orderable2.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
