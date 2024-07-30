// Without this web integration tests will fail
void useGoldenFileComparatorWithThreshold(double threshold) {
  throw UnsupportedError('Golden testing is not supported on the web.');
}
