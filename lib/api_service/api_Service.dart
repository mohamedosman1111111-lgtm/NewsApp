import 'dart:convert';

import'package:http/http.dart'as http;
import 'package:news_app/api_service/Source.dart';
import 'package:news_app/api_service/SourcesResponse.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
class APIService {
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
static const String baseURL="newsapi.org";
static const String sourcesEndPoint="/v2/top-headlines/sources";
static const String APIKEY="de8156bd7ba945b490524260ce69352d";
  static Future<SourcesResponse> getSources(CategoryModel category)async{

    Uri url=Uri.https(baseURL,sourcesEndPoint,{
      "apiKey":APIKEY,
      "category":category.id
    });
   http.Response serverResponse= await http.get(url);
 var json= jsonDecode(serverResponse.body);
 SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
 return sourcesResponse;
  }

}