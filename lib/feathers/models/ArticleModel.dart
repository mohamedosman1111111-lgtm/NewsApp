class ArticleModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String sourceName;
  final String publishedAt;
  final String author;

  ArticleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.sourceName,
    required this.publishedAt,
    required this.author,
  });

  static List<ArticleModel> sampleArticles = [
    ArticleModel(
      id: "1",
      title: "40-year-old man falls 200 feet to his death while canyoneering at national park",
      description: "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering in a popular area of Zion National Park in Utah, authorities said.",
      imageUrl: "assets/images/article1.png",
      sourceName: "ABC News",
      publishedAt: "2 hours ago",
      author: "John Smith",
    ),
    ArticleModel(
      id: "2",
      title: "Nobel Prize in physics awarded to two scientists for machine learning discoveries",
      description: "The Nobel Prize in physics was awarded Tuesday to two scientists for discoveries in machine learning and artificial intelligence.",
      imageUrl: "assets/images/article1.png",
      sourceName: "ANSA",
      publishedAt: "4 hours ago",
      author: "Jane Doe",
    ),
  ];
}