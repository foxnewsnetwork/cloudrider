# Cloudrider

Deployment use for restarting the server
```bash
$ rake production:on_restart RAILS_ENV=production && kill -QUIT $(cat tmp/pids/unicorn.pid) && unicorn_rails -c config/unicorn.conf.rb -E production -D
```
FUTURE TODO:
switch I18n translations to a key-value storage basis with a redis cluster

Questions that lead to building a website
1. What is your company's name
2. Give me some taglines / slogans for your company
3. Tell me about your company
4. How would a customer contact your company?
5. Give me some showcase pictures of your company



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudrider'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudrider

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cloudrider/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
