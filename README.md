<div align="center">

# asdf-kcat [![Build](https://github.com/ueisele/asdf-kcat/actions/workflows/build.yml/badge.svg)](https://github.com/ueisele/asdf-kcat/actions/workflows/build.yml) [![Lint](https://github.com/ueisele/asdf-kcat/actions/workflows/lint.yml/badge.svg)](https://github.com/ueisele/asdf-kcat/actions/workflows/lint.yml)


[kcat](<TOOL HOMEPAGE>) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

## Operating System

At the moment, `Fedora`, `Red Hat Enterprise Linux 8`, and `Ubuntu` are supported.

- `Fedora` (>= 35 and <= 38) has been tested with librdkafka <= 1.9.2.
- `Red Hat Enterprise Linux 8` (>= 8.1 and <= 8.6) has been tested with librdkafka <= 1.9.2.
- `Ubuntu` (>= 20.04 and <= 22.10) has been tested with librdkafka <= 1.8.2. Librdkafka 1.9 cannot be compiled on `Ubuntu` at the moment.

## Installation

- `bash`, `curl`, `tar`, `realpath`, generic POSIX utilities.
- `podman`

## Runtime

- Fedora: -
- Red Hat Enterprise Linux 8: -
- Ubuntu: `libsasl2-2`, `curl`

# Install

Plugin:

```bash
asdf plugin add kcat https://github.com/ueisele/asdf-kcat.git
```

kcat:

```bash
# Show all installable versions in format <librdkafka-version>-<kcat-version>
asdf list-all kcat

# Show all installable versions with specific librdkafka version
asdf list-all kcat latest:1.8

# Install latest version
asdf install kcat latest

# Install latest version of specific librdkafka version
asdf install kcat latest:1.8

# Set a version globally (on your ~/.tool-versions file)
asdf global kcat latest

# Now kcat commands are available
kcat -h
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ueisele/asdf-kcat/graphs/contributors)!

This repository is based on the [asdf-plugin-template](https://github.com/asdf-vm/asdf-plugin-template). 
[Thanks to it's contributors](https://github.com/asdf-vm/asdf-plugin-template/graphs/contributors). 

# License

See [LICENSE](LICENSE) © [Uwe Eisele](https://github.com/ueisele/)
