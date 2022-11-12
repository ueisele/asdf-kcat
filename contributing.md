# Contributing

## Commits

We are using [Conventional Commit messages](https://www.conventionalcommits.org/).

The most important prefixes you should have in mind are:

* `fix:` which represents bug fixes, and correlates to a [SemVer](https://semver.org/)
  patch.
* `feat:` which represents a new feature, and correlates to a SemVer minor.
* `feat!:`,  or `fix!:`, `refactor!:`, etc., which represent a breaking change
  (indicated by the `!`) and will result in a SemVer major.

## Testing

Testing locally with scrips:

```bash
bin/list-all
test/test-download.sh 1.7.1 # executes bin/download
test/test-install.sh 1.7.1 # executes bin/install
```

Testing locally with asdf:

```bash
asdf plugin test kafka https://github.com/ueisele/asdf-kcat.git \
  --asdf-plugin-gitref main \
  --asdf-tool-version latest \
  'kcat -h || kafkacat -h'
```

Tests are automatically run in GitHub Actions on push and PR.
