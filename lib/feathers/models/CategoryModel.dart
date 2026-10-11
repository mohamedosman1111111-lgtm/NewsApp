import 'package:news_app/utils/AppAssets.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String darkImage;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.darkImage,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: "general",
      name: "General",
      image: AppAssets.generalLight,
      darkImage: AppAssets.general,
    ),
    CategoryModel(
      id: "business",
      name: "Business",
      image: AppAssets.businessLight,
      darkImage: AppAssets.business,
    ),
    CategoryModel(
      id: "sports",
      name: "Sports",
      image: AppAssets.sportsLight,
      darkImage: AppAssets.sports,
    ),
    CategoryModel(
      id: "technology",
      name: "Technology",
      image: AppAssets.technologyLight,
      darkImage: AppAssets.technology,
    ),
    CategoryModel(
      id: "entertainment",
      name: "Entertainment",
      image: AppAssets.entertainmentLight,
      darkImage: AppAssets.entertainment,
    ),
    CategoryModel(
      id: "health",
      name: "Health",
      image: AppAssets.healthLight,
      darkImage: AppAssets.health,
    ),
    CategoryModel(
      id: "science",
      name: "Science",
      image: AppAssets.scienceLight,
      darkImage: AppAssets.science,
    ),
  ];
}