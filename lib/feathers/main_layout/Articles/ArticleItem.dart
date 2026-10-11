import 'package:flutter/material.dart';
import 'package:news_app/feathers/models/ArticleModel.dart';
import 'package:news_app/utils/AppColors.dart';

class ArticleItem extends StatelessWidget {
   ArticleItem({super.key,required this.article});
ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).primaryColor,width: 2)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),

                  child: Image.asset(article.imageUrl,width: double.infinity,fit: BoxFit.fitWidth,)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(article.title,style: Theme.of(context).textTheme.labelMedium,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("By : ${article.author}",style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grey),),
                  Spacer(),
                  Text(article.publishedAt,style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grey),)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
