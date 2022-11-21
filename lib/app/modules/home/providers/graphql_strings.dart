const String getData =       """query {
  characters(
    page: 1) {
    results {
      id,
      status,
      name,
      image
    }
  }
}""";