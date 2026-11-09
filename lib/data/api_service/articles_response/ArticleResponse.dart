import 'Article.dart';

class ArticleResponse {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<Article>? articles;
  ArticleResponse({
      this.status,
    this.code,
    this.message,
      this.totalResults, 
      this.articles,});

  ArticleResponse.fromJson(dynamic json) {
    status = json['status'];
    code=json['code'];
    message=json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }



}