import 'package:flutter/material.dart';
import 'package:news_app/feathers/main_layout/Articles/ArticleItem.dart';
import 'package:news_app/feathers/models/ArticleModel.dart';
import 'package:news_app/feathers/models/SourcesModel.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: SourceModel.sources.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs:
              SourceModel.sources.map((sources)=>Tab(text: sources.name,)).toList(),
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
  }
}
