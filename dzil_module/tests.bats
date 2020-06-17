#!/usr/bin/env bats

setup() {
  cd dzil_module
}

@test "cpan-install-build-deps" {
  run bash ../bin/cpan-install-build-deps
  [ "$status" -eq 0 ]
}

@test "cpan-install-dist-deps" {
  run bash ../bin/cpan-install-dist-deps
  [ "$status" -eq 0 ]
}

@test "build-dist" {
  run rm -rf build_dir && bash ../bin/build-dist
  [ "$status" -eq 0 ]
}

@test "test-dist" {
  run cd build_dir && ../bin/test-dist
  [ "$status" -eq 0 ]
}
