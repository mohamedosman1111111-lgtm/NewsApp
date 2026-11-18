import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:news_app/feathers/main_layout/Articles/ArticleDetailsSheet.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:news_app/utils/format_data.dart';

class ArticleItem extends StatelessWidget {
   ArticleItem({super.key,required this.article});
Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).primaryColor,width: 2)
        ),
        child: InkWell(
          onTap: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Theme.of(context).primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (_) => ArticleDetailsSheet(article: article),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),

                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage??"",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress,color: Theme.of(context).primaryColor,),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(article.title??"",style: Theme.of(context).textTheme.labelMedium,),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text("By : ${article.author}",style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grey),maxLines: 1,)),

                    Spacer(),
                    Expanded(child: Text(FormatData.formatPublishedAt(article.publishedAt)??'',style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grey),maxLines:1 ,))

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
