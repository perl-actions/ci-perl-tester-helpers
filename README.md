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
* [Github Actions](#github-actions)
    * [perl-actions/ci-perl-tester-helpers/build-dist@main](#perl-actionsci-perl-tester-helpersbuild-distmain)
    * [perl-actions/ci-perl-tester-helpers/cpan-install-build-deps@main](#perl-actionsci-perl-tester-helperscpan-install-build-depsmain)
    * [perl-actions/ci-perl-tester-helpers/cpan-install-dist-deps@main](#perl-actionsci-perl-tester-helperscpan-install-dist-depsmain)
    * [perl-actions/ci-perl-tester-helpers/install-helpers-deps@main](#perl-actionsci-perl-tester-helpersinstall-helpers-depsmain)
    * [perl-actions/ci-perl-tester-helpers/test-dist@main](#perl-actionsci-perl-tester-helperstest-distmain)

<!-- vim-markdown-toc -->

# Upgrade or Install via curl

```bash
curl https://raw.githubusercontent.com/perl-actions/ci-perl-tester-helpers/main/bin/upgrade-perl-helpers | bash
```

# Binaries

## `auto-build-and-test-dist`

## `build-dist`

## `cpan-install-build-deps`

## `cpan-install-dist-deps`

## `test-dist`

## `upgrade-perl-helpers`

# Environment Variables

* `BUILD_DIR`
* `CODECOV_TOKEN`
* `COVERALLS_TOKEN`
* `HARNESS_PERL_SWITCHES`

# Linting

You can lint this project locally via `precious lint --all`

# Github Actions

Commands are also available as github actions:
```
job:
  linux:
    ...
    steps:
	  ...
      - uses: perl-actions/ci-perl-tester-helpers/report-perl@main
      - uses: perl-actions/ci-perl-tester-helpers/install-test-helper-deps@main
      - uses: perl-actions/ci-perl-tester-helpers/cpan-install-build-deps@main
      - uses: perl-actions/ci-perl-tester-helpers/build-dist@main
      - uses: perl-actions/ci-perl-tester-helpers/cpan-install-dist-deps@main
      - uses: perl-actions/ci-perl-tester-helpers/test-dist@main
        env:
          AUTHOR_TESTING: 1
```

## perl-actions/ci-perl-tester-helpers/build-dist@main

Build your distribution detecting what framework you are using.

## perl-actions/ci-perl-tester-helpers/cpan-install-build-deps@main

Install build dependencies (eg: dzil modules referenced in your `dist.ini`)

## perl-actions/ci-perl-tester-helpers/cpan-install-dist-deps@main

Install dependencies of your distribution.

## perl-actions/ci-perl-tester-helpers/install-helpers-deps@main

Install dependencies required by ci-perl-tester-helpers

- `cpm` - required version min `0.997014`

## perl-actions/ci-perl-tester-helpers/report-perl@main

Report version and configuration of available Perl

Despite being simple `perl -V` (for now) naming it shows intention what
you want to do.

### Inputs

- `artifact` (optional): When specified, output will be written also to this file.

### Examples

Basic usage:
```yaml
- uses: perl-actions/ci-perl-tester-helpers/report-perl@main
```

Save output to a file:
```yaml
- uses: perl-actions/ci-perl-tester-helpers/report-perl@main
  with:
    artifact: perl-version.txt
```

## perl-actions/ci-perl-tester-helpers/test-dist@main

Tests your distribution using `prove` with `--state save`.

Recognizes env variables:

- `AUTHOR_TESTING`
  If set to `1`, includes tests in `xt` directory (if available)
