#!/usr/bin/env bats

PATH="$PATH:../../../bin"

setup() {
  cd t/test-data/changes-test-removal
  mkdir -p xt/release
  printf "use Test::More;\nBAIL_OUT('changes test must be removed on the default branch');\n" \
    >xt/release/changes_has_content.t
}

teardown() {
  rm -rf xt
}

@test "test-dist removes changes_has_content.t on master" {
  GITHUB_REF=refs/heads/master run test-dist
  [ "$status" -eq 0 ]
  [ ! -e xt/release/changes_has_content.t ]
}

@test "test-dist removes changes_has_content.t on main" {
  GITHUB_REF=refs/heads/main run test-dist
  [ "$status" -eq 0 ]
  [ ! -e xt/release/changes_has_content.t ]
}

@test "test-dist keeps changes_has_content.t on a feature branch" {
  GITHUB_REF=refs/heads/some-feature run test-dist
  [ "$status" -eq 0 ]
  [ -e xt/release/changes_has_content.t ]
}
