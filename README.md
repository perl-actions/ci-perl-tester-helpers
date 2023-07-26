# Building and Test Perl Projects via GitHub Workflows

<!-- vim-markdown-toc GFM -->

* [Upgrade or Install via curl](#upgrade-or-install-via-curl)
* [Binaries](#binaries)
  * [`auto-build-and-test-dist`](#auto-build-and-test-dist)
  * [`build-dist`](#build-dist)
  * [`cpan-install-build-deps`](#cpan-install-build-deps)
  * [`cpan-install-dist-deps`](#cpan-install-dist-deps)
  * [`test-dist`](#test-dist)
  * [`upgrade-perl-helpers`](#upgrade-perl-helpers)
* [Environment Variables](#environment-variables)
* [Linting](#linting)

<!-- vim-markdown-toc -->

# Upgrade or Install via curl

```bash
curl https://raw.githubusercontent.com/perl-actions/ci-perl-tester-helpers/master/bin/upgrade-perl-helpers | bash
```

# Binaries

## `auto-build-and-test-dist`

Any argument is forwarded to `test-dist` (which forwards it to `prove`)

Examples:
```
auto-build-and-test-dist --state save
auto-build-and-test-dist --jobs $(nproc --all)
auto-build-and-test-dist --verbose
```

## `build-dist`

Builds your distribution.

- `Dist::Zilla`

`build-dist` recognizes it though it favours `Build.PL` / `Makefile.PL` coming from
repository. It also installs necessary plugins automagically.

Beware that `Dist::Zilla` at time of writing this requires Perl v5.20 so if you
want to support older versions of Perls you should include your builder script
into repository.

## `cpan-install-build-deps`

## `cpan-install-dist-deps`

## `test-dist`

Any argument is passed to `prove`

By default `prove` is executed with `--jobs 2`

## `upgrade-perl-helpers`

# Environment Variables

* `BUILD_DIR`
* `CODECOV_TOKEN`
* `COVERALLS_TOKEN`
* `HARNESS_PERL_SWITCHES`

# Linting

You can lint this project locally via `precious lint --all`
