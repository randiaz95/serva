# Serva

Key Value Server to persist key value data. 

## Installation

First go into a terminal with crystal installed:

```crystal --version```
```crystal init app *appname*```

Go into the shards.yml file and copy the following dependency:

```crystal
dependencies:
  serva:
    github: randiaz95/serva
    branch: master
```

Then... 

```shards install```

Now you can:
```require "serva"```

## Usage
```crystal
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

1. Fork it (<https://github.com/randiaz95/serva/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Randy Diaz](https://github.com/randiaz95) - creator and maintainer
