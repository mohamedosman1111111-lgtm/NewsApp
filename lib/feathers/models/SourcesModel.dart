class SourceModel {
   String id;
   String name;
   String description;
   String url;
   String language;
   String category;
   String country;

  SourceModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.country,
    required this.url,
    required this.language,
  });

  static List<SourceModel> sources = [
    SourceModel(
      id: "abc-news",
      name: "ABC News",
      description: "Your trusted source for breaking news, analysis, exclusive interviews,headlines, and videos at ABCNews.com.",
      url:  "https://abcnews.go.com",
      category: "general",
      language: "en",
      country: "us"
    ),
    SourceModel(
        id: "abc-news",
        name: "ABC News",
        description: "Your trusted source for breaking news, analysis, exclusive interviews,headlines, and videos at ABCNews.com.",
        url:  "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us"
    ),
    SourceModel(
        id: "abc-news",
        name: "ABC News",
        description: "Your trusted source for breaking news, analysis, exclusive interviews,headlines, and videos at ABCNews.com.",
        url:  "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us"
    ),
    SourceModel(
        id: "abc-news",
        name: "ABC News",
        description: "Your trusted source for breaking news, analysis, exclusive interviews,headlines, and videos at ABCNews.com.",
        url:  "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us"
    ),
    SourceModel(
        id: "abc-news",
        name: "ABC News",
        description: "Your trusted source for breaking news, analysis, exclusive interviews,headlines, and videos at ABCNews.com.",
        url:  "https://abcnews.go.com",
        category: "general",
        language: "en",
        country: "us"
    ),

  ];
}