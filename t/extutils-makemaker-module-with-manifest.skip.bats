#!/usr/bin/env bats

PATH="$PATH:../../../bin"

setup() {
  cd t/test-data/extutils-makemaker-module-with-manifest.skip || exit 1
}

@test "Makefile.PL cpan-install-dist-deps" {
  run cpan-install-build-deps
  [ "$status" -eq 0 ]
}

@test "Makefile.PL build-dist" {
  run build-dist
  [ "$status" -eq 0 ]
}

@test "Makefile.PL test-dist" {
  run cd build_dir && test-dist
  [ "$status" -eq 0 ]
}

@test "Makefile.PL auto-build-and-test-dist" {
  GITHUB_ACTIONS=${GITHUB_ACTIONS:=''}
  if [[ $GITHUB_ACTIONS = true ]]; then
    skip "Tricky to test under CI"
  fi
  run rm -rf build_dir && bash auto-build-and-test-dist && rm -rf build_dir
  [ "$status" -eq 0 ]
}
