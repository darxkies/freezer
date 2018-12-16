# Freezer

[![Build Status](https://travis-ci.org/darxkies/freezer.svg?branch=master)](https://travis-ci.org/darxkies/freezer)
[![Go Report Card](https://goreportcard.com/badge/github.com/darxkies/freezer)](https://goreportcard.com/report/github.com/darxkies/freezer)
[![GitHub release](https://img.shields.io/github/release/darxkies/freezer.svg)](https://github.com/darxkies/freezer/releases/latest)
![GitHub](https://img.shields.io/github/license/darxkies/freezer.svg)

Freezer copies a binary and its dynamic libraries to a directory so that it can be run or deployed independently of the operating system. The files can also be containerized.

## Usage

Download the binary from [release page](https://github.com/darxkies/freezer/releases).

For example, to freeze the binary /usr/sbin/conntrack run the following command:

```shell
freezer freeze-binary /usr/sbin/conntrack /tmp/freezer
```

This generates following files in the target directory /tmp/freezer:

```shell
/tmp/freezer/
├── conntrack
├── bin
│   └── conntrack
└── lib
    ├── ld-linux-x86-64.so.2
    ├── libc.so.6
    ├── libmnl.so.0
    ├── libnetfilter_conntrack.so.3
    └── libnfnetlink.so.0
```

By calling the program /tmp/freezer/conntrack it will actually run /tmp/freezer/bin/conntrack and it will load its dynamic libraries from /tmp/freezer/lib/.

# Build

To build from source code you need make and Docker, then run the following commands:

```
git clone git@github.com:darxkies/freezer.git
cd freezer
make
```

The commands generate the binary freezer in the current directory.
