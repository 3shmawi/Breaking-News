class AppConsts {
  static const appName = "Breaking News";

  static const List<String> categories = [
    "Home",
    "Business",
    "Sports",
    "Entertainment",
    "Science",
    "Technology",
    "Health",
  ];

  static const _path = "assets/m_news_icons";
  static const List<String> icons = [
    '$_path/home.png',
    '$_path/briefcase.png',
    '$_path/sports.png',
    '$_path/video.png',
    '$_path/atom.png',
    '$_path/tech.png',
    '$_path/health.png',
  ];

  static const _apiKey = "2fbf9799a7fb47c88f266c543fb36a78";

  static api([String category = "general", String country = 'eg']) =>
      "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$_apiKey";

  static const Map<String, Map<String, dynamic>> countryCodes = {
    'Austria': {'code': 'at', 'flag': '🇦🇹'},
    'Armenia': {'code': 'am', 'flag': '🇦🇲'},
    'Australia': {'code': 'au', 'flag': '🇦🇺'},
    'Belgium': {'code': 'be', 'flag': '🇧🇪'},
    'Bulgaria': {'code': 'bg', 'flag': '🇧🇬'},
    'Brazil': {'code': 'br', 'flag': '🇧🇷'},
    'Canada': {'code': 'ca', 'flag': '🇨🇦'},
    'Switzerland': {'code': 'ch', 'flag': '🇨🇭'},
    'China': {'code': 'cn', 'flag': '🇨🇳'},
    'Colombia': {'code': 'co', 'flag': '🇨🇴'},
    'Czech Republic': {'code': 'cz', 'flag': '🇨🇿'},
    'Germany': {'code': 'de', 'flag': '🇩🇪'},
    'Egypt': {'code': 'eg', 'flag': '🇪🇬'},
    'Spain': {'code': 'es', 'flag': '🇪🇸'},
    'France': {'code': 'fr', 'flag': '🇫🇷'},
    'United Kingdom': {'code': 'gb', 'flag': '🇬🇧'},
    'Greece': {'code': 'gr', 'flag': '🇬🇷'},
    'Croatia': {'code': 'hr', 'flag': '🇭🇷'},
    'Hong Kong': {'code': 'hk', 'flag': '🇭🇰'},
    'Hungary': {'code': 'hu', 'flag': '🇭🇺'},
    'Indonesia': {'code': 'id', 'flag': '🇮🇩'},
    'Ireland': {'code': 'ie', 'flag': '🇮🇪'},
    'Israel': {'code': 'il', 'flag': '🇮🇱'},
    'India': {'code': 'in', 'flag': '🇮🇳'},
    'Italy': {'code': 'it', 'flag': '🇮🇹'},
    'Japan': {'code': 'jp', 'flag': '🇯🇵'},
    'South Korea': {'code': 'kr', 'flag': '🇰🇷'},
    'Lithuania': {'code': 'lt', 'flag': '🇱🇹'},
    'Latvia': {'code': 'lv', 'flag': '🇱🇻'},
    'Morocco': {'code': 'ma', 'flag': '🇲🇦'},
    'Mexico': {'code': 'mx', 'flag': '🇲🇽'},
    'Malaysia': {'code': 'my', 'flag': '🇲🇾'},
    'Nigeria': {'code': 'ng', 'flag': '🇳🇬'},
    'Netherlands': {'code': 'nl', 'flag': '🇳🇱'},
    'Norway': {'code': 'no', 'flag': '🇳🇴'},
    'New Zealand': {'code': 'nz', 'flag': '🇳🇿'},
    'Philippines': {'code': 'ph', 'flag': '🇵🇭'},
    'Poland': {'code': 'pl', 'flag': '🇵🇱'},
    'Portugal': {'code': 'pt', 'flag': '🇵🇹'},
    'Romania': {'code': 'ro', 'flag': '🇷🇴'},
    'Russia': {'code': 'ru', 'flag': '🇷🇺'},
    'Saudi Arabia': {'code': 'sa', 'flag': '🇸🇦'},
    'Sweden': {'code': 'se', 'flag': '🇸🇪'},
    'Singapore': {'code': 'sg', 'flag': '🇸🇬'},
    'Slovenia': {'code': 'si', 'flag': '🇸🇮'},
    'Slovakia': {'code': 'sk', 'flag': '🇸🇰'},
    'Thailand': {'code': 'th', 'flag': '🇹🇭'},
    'Turkey': {'code': 'tr', 'flag': '🇹🇷'},
    'Taiwan': {'code': 'tw', 'flag': '🇹🇼'},
    'Ukraine': {'code': 'ua', 'flag': '🇺🇦'},
    'United States': {'code': 'us', 'flag': '🇺🇸'},
    'Venezuela': {'code': 've', 'flag': '🇻🇪'},
    'South Africa': {'code': 'za', 'flag': '🇿🇦'},
  };

  static bool isArabic(String text) {
    RegExp arabicRegex = RegExp(
        r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]'); // Unicode range for Arabic characters

    return arabicRegex.hasMatch(text);
  }

  static const defaultImg =
      "https://images.unsplash.com/photo-1609743522653-52354461eb27?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bm90JTIwZm91bmR8ZW58MHx8MHx8fDA%3D";
}
