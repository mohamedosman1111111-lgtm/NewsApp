import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api_service/articles_response/Article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsSheet extends StatelessWidget {
  final Article article;
  const ArticleDetailsSheet({super.key, required this.article});
  Future<void> _openFullArticle(BuildContext context) async {
    final uri = Uri.tryParse(article.url ?? "");
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open the article link")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),

            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Theme.of(context).primaryColor,
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.009,),

          Text(
            article.content ?? "",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.049,),

          SizedBox(
            width: double.infinity,
            height:MediaQuery.of(context).size.height*0.056,
            child: ElevatedButton(
              onPressed: () {
                _openFullArticle(context);
              },
              child:  Text("View Full Article",style:Theme.of(context).textTheme.labelMedium ,),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.016,),
        ],
      ),
    );
  }
}
