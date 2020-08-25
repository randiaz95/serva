# serva

Key Value Server to persist key value data. 

## Installation
```
dependencies:
  openssl:
    github: https://github.com/randiaz95/serva
    branch: master
```

## Usage
```
require "Serva"

# Test connection
e = Serva::Engine.new("sqlite3://data.db")

# Print non-existing key
puts e["missing_key"]

# Try to create a new key and then get it
e["new_key"] = "new_value"
puts e["new_key"]
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/serva/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Randy Diaz](https://github.com/randiaz95) - creator and maintainer
