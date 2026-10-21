import 'package:flutter/material.dart';
import 'package:news_app/api_service/Source.dart';
import 'package:news_app/api_service/api_Service.dart';
import 'package:news_app/feathers/main_layout/Articles/ArticleItem.dart';
import 'package:news_app/feathers/models/ArticleModel.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';

class SourcesScreen extends StatelessWidget {
   SourcesScreen({super.key,required this.category});
  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: APIService.getSources(category),
        builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      if(snapshot.hasError){
        return Center(child: Text("Error",style: TextStyle(color: Colors.white),));
      }
      List<Source>sources=snapshot.data?.sources ??[];
      return Column(
        children: [
          DefaultTabController(
            length: sources.length,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs:
             sources.map((sources)=>Tab(text: sources.name,)).toList(),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.026,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_,index)=>ArticleItem(article: ArticleModel.sampleArticles[index],),
                separatorBuilder: (_,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.012,),
                itemCount: ArticleModel.sampleArticles.length),
          )
        ],
      );
        });

  }
}
