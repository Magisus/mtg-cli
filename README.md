## Requirements

1. ruby (2.2.2)
2. bundler (1.0 or greater)

## Installation

### Install and configure Ruby

Install Ruby 2.2.2 using your version manager of choice.

If you're using [rbenv](https://github.com/sstephenson/rbenv), set the local Ruby version:

```
rbenv local 2.2.2
```

If you're using [rvm](https://rvm.io/), create an `.rvmrc` file:

```
echo "rvm use 2.2.2@paparazzi --create" > .rvmrc && cd .
```

### Install Bundler and Ruby gems

Install the project's gems (from `Gemfile`) using [Bundler](http://bundler.io/) by running the following commands:

```
gem install bundler
bundle
```

### Running the Test Suite

To run the test suite:
```
bundle exec rspec spec
```

To view code coverage:
```
open coverage/index.html
```

## Usage

Run the command-line applicaton:
```
bin/mtg-cli
```
