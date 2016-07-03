[![Build Status](https://img.shields.io/travis/walle/tyda.rb.svg?style=flat)](https://travis-ci.org/walle/tyda.rb)
[![Coverage](https://img.shields.io/codecov/c/github/walle/tyda.rb.svg?style=flat)](https://codecov.io/github/walle/tyda.rb)
[![Godoc](http://img.shields.io/badge/godoc-reference-blue.svg?style=flat)](https://godoc.org/github.com/walle/tyda.rb)
[![license](http://img.shields.io/badge/license-MIT-red.svg?style=flat)](https://raw.githubusercontent.com/walle/tyda.rb/master/LICENSE)
[![Go Report Card](https://goreportcard.com/badge/github.com/walle/tyda.rb)](http:/goreportcard.com/report/walle/tyda.rb)

# tyda.rb

CLI tool for searching website tyda.se.

Requires the [tyda-api](https://github.com/walle/tyda-api) binary to be
installed.

If you have your `$GOPATH` set up, and `$GOPATH/bin` in you path
```
$ go get github.com/walle/tyda-api/...
```

## Installation

```shell
$ git clone https://github.com/walle/tyda.rb.git
```

## Usage

```shell
$ cd tyda.rb
$ bin/tyda.rb query
```

```shell
usage: tyda.rb [--simple] [--languages LANGUAGES] QUERY

positional arguments:
  query

options:
  --simple, -s           Simple output
  --languages LANGUAGES, -l LANGUAGES
                         Languages to translate to (en fr de es la nb sv) [default: [en]]
  --help, -h             display this help and exit
```

## Contributing

All contributions are welcome! See [CONTRIBUTING](CONTRIBUTING.md) for more
info.

## License

The code is under the MIT license. See [LICENSE](LICENSE) for more
information.
