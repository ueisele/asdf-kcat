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

**TODO: adapt this section**

- `bash`, `curl`, `tar`, `realpath`, generic POSIX utilities.
- `docker` or `podman`
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```bash
asdf plugin add kcat https://github.com/ueisele/asdf-kcat.git
```

kcat:

```bash
# Show all installable versions
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

# License

See [LICENSE](LICENSE) © [Uwe Eisele](https://github.com/ueisele/)
