#!/usr/bin/env bats

TEST_DIR=/tmp/minil-test-dir
DIST_DIR=$TEST_DIR/Dist-Name
BUILD_DIR=$DIST_DIR/build_dir
TOP_DIR=$(git rev-parse --show-toplevel)
BIN_DIR="$TOP_DIR/bin"

export BUILD_DIR

@test "minil cpan-install-dist-deps" {
  rm -rf "$TEST_DIR"
  mkdir -p "$TEST_DIR"
  cd "$TEST_DIR"
  minil new Dist-Name
  cd $DIST_DIR
  git commit -m 'initial import'
  run "$BIN_DIR"/cpan-install-dist-deps
  [ "$status" -eq 0 ]
}

@test "minil build-dist" {
  cd "$DIST_DIR"
  run "$BIN_DIR"/build-dist
  [ "$status" -eq 0 ]
}

@test "minil test-dist" {
  cd "$BUILD_DIR"
  run "$BIN_DIR"/test-dist
  [ "$status" -eq 0 ]
}

@test "minil auto-build-and-test-dist" {
  rm -rf $BUILD_DIR
  cd "$DIST_DIR"
  run bash "$BIN_DIR"/auto-build-and-test-dist
  [ "$status" -eq 0 ]
}
