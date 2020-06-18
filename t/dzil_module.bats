#!/usr/bin/env bats

PATH="$PATH:../../../bin"

setup() {
  cd t/test-data/dzil_module
}

@test "cpan-install-build-deps" {
  run cpan-install-build-deps
  [ "$status" -eq 0 ]
}

@test "cpan-install-dist-deps" {
  run cpan-install-dist-deps
  [ "$status" -eq 0 ]
}

@test "build-dist" {
  run rm -rf build_dir && build-dist
  [ "$status" -eq 0 ]
}

@test "test-dist" {
  run cd build_dir && test-dist
  [ "$status" -eq 0 ]
}

@test "auto-build-and-test-dist" {
  run rm -rf build_dir && bash auto-build-and-test-dist && rm -rf build_dir
  [ "$status" -eq 0 ]
}
