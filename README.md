# PngQuant Binary Transformer

A Binary Transformer Plugin to compress png images.

To use it, please also install gem [Binary Transformer](https://gitlab.com/ruby-gem/binary-transformer), and 
see [usage](#Usage).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bt_pngquant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bt_pngquant

## Dependency

This depends on [PngQuant](https://pngquant.org/), so please ensure its available via
global PATH. 

PngQuant has to be at least version 2.12.0

To Check PngQuant version:
```bash
$ pngquant --verbose
```

## Getting Started
Install and require binary transform, and create a PngQuant
instance. The constructor can take in the following fields

| Field | Description |
| --- | --- |
| min: | minimum quality. Default is 65 |
| max: | Maximum quality. Default is 80 |
| iebug: | Whether to fix ie bug, default is false |
| speed | The speed on pngquant. Between 1 and 11. default is 3 |
| bit | The png colorspace. Default is 256 |

```ruby
require "binary_transformer"
require "bt_pngquant"

# Read image as binary
image = IO.binread "image.png"
# Use binary_transformer module to allow stream-like piping
image.extend StreamLike
# Create a pngquant instance with the follow settings. Settings not chosen will be set default
pngquant = BT::PngQuant.new(speed: 11) 

# Pipe it through the transformer instance
compressed = image > pngquant

# Write it out
IO.binwrite compressed 
```

This can be used in pipeline with other Binary Transformer plugins!

## Development

After checking out the repo, run `bin/setup` to install dependencies. 

Then, run `rake unit` to run the unit tests.

To install this gem onto your local machine, run `rake install:local`. 
 at . This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.MD) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning 
We use [SemVer](https://semver.org/) for versioning. For the versions available, see the tags on this repository.

## Authors
* [kirinnee](mailto:kirinnee@gmail.com) 

## License
This project is licensed under MIT - see the [LICENSE.md](LICENSE.MD) file for details