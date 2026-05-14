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

At the moment, the container build is maintained for `Fedora`.

- `Fedora 44` has been tested with `librdkafka 2.14.1` and `kcat 1.7.1`.
- Older Fedora, Red Hat Enterprise Linux, and Ubuntu combinations may work, but are not covered by the current CI build.

## Installation

- `bash`, `curl`, `tar`, `realpath`, generic POSIX utilities.
- `podman`

## Runtime

The binary is built in a Fedora container and copied to the host. It is not fully
static, so the host needs compatible Fedora runtime libraries.

- Fedora: `cyrus-sasl-lib`, `curl`, and their runtime dependencies.
- Other operating systems: not currently tested.

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
asdf list-all kcat latest:2.14

# Install latest version
asdf install kcat latest

# Install latest version of specific librdkafka version
asdf install kcat latest:2.14

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
