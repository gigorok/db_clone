# DbClone

This gem allows you to clone your development database.
This can be useful in case if you have to switch to new issue that will critically influent to your development database structure. And if you want to step back and develop something other.
So before developing this critical issue you run 
```bash
rake db:clone[new_database_name]
```
and put the new database name into your database.yml development section.
Then when you need to switch a context into a new issue (not related with previous) you have to just put an old database name into database.yml development section.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'db_clone', group: :development, git: 'https://github.com/gigorok/db_clone.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install db_clone

## Usage

``` 
rake db:clone[your_new_database_name]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gigorok/db_clone. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

