class IPAppConf {
  static const _apiKey = "2fbf9799a7fb47c88f266c543fb36a78";

//https://newsapi.org/v2/everything?q=keyword&apiKey=2fbf9799a7fb47c88f266c543fb36a78

  static const apiUrl =
      "https://newsapi.org/v2/everything?q=keyword&apiKey=2fbf9799a7fb47c88f266c543fb36a78";

  static api([String category = "general", String country = 'eg']) =>
      "https://newsapi.org/v2/everything?country=$country&category=$category&apiKey=$_apiKey";
}
