class AppConfigs {
  static const baseUrl =
      "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=2fbf9799a7fb47c88f266c543fb36a78";

  static String getData([String category = "business"]) =>
      "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=2fbf9799a7fb47c88f266c543fb36a78";

  static const defaultImg =
      "https://media.istockphoto.com/id/1481759725/photo/404-error-isolated-on-white-background-page-not-found.webp?b=1&s=170667a&w=0&k=20&c=kJIxn9cRT_p_EAu-5KAhYVxV6ZfITm711yts_SA2LbU=";
}
