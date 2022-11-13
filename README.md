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

- `bash`, `curl`, `tar`, `realpath`, generic POSIX utilities.
- `podman`

# Install

Plugin:

```bash
asdf plugin add kcat https://github.com/ueisele/asdf-kcat.git
```

kcat:

```bash
# Show all installable versions in format <kcat-version>-<librdkafka-version>
asdf list-all kcat

# Install specific version
asdf install kcat latest

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
