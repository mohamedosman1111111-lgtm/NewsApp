
import 'package:flutter/material.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
import 'package:news_app/utils/AppAssets.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({super.key,required this.category});
CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(category.image),
    ) ;

  }
}
