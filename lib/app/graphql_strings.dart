const String getData = """query {
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

const String detail = """query {
  charactersByIds(ids:1){
    name,
    id,
    status,
    image
  }
}""";
