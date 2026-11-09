import 'package:flutter/material.dart';

import 'package:news_app/core/state.dart';
import 'package:news_app/data/api_service/api_Service.dart';
import 'package:news_app/data/data_source/articles_api_datasource.dart';
import 'package:news_app/data/data_source/sources_api_datasource.dart';
import 'package:news_app/data/repository/articles_repository_impl.dart';
import 'package:news_app/data/repository/sources_repository_impl.dart';
import 'package:news_app/feathers/main_layout/Articles/ArticleItem.dart';
import 'package:news_app/feathers/main_layout/sources/article_viewModel.dart';
import 'package:news_app/feathers/main_layout/sources/sources_viewModel.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
import 'package:provider/provider.dart';

class SourcesScreen extends StatefulWidget {
   SourcesScreen({super.key,required this.category});
  CategoryModel category;

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
 late SourcesViewModel sourcesViewModel;
 late ArticlesViewModel articlesViewModel;
 void fetchData()async{
   sourcesViewModel=SourcesViewModel(repository: SourcesRepositoryImpl(dataSource: SourcesApiDataSource(APIService())));
   articlesViewModel=ArticlesViewModel(repository: ArticlesRepositoryImpl(dataSource: ArticlesApiDataSource(apiService: APIService())));
   await sourcesViewModel.loadSources(widget.category);
   if(sourcesViewModel.state is SuccessState){

   articlesViewModel.loadArticles((sourcesViewModel.state as SuccessState).data[0]);
   }
 }
  @override
  void initState() {
   fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider.value(value: sourcesViewModel),
    ChangeNotifierProvider.value(value: articlesViewModel),
      ],
      child: Column(
          children: [
            Consumer<SourcesViewModel>(builder: (context,viewModel,_){
              var state=viewModel.state;
              switch(state){
                case InitialState():{
                  return Container();
                }
                case LoadingState():{
                  return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
                }
                case ErrorState():{
                  return Center(child: Text(state.message,style: TextStyle(color: Theme.of(context).primaryColor,)),);
                }
                case SuccessState():{
                  return DefaultTabController(
                    length: state.data.length,
                    child: TabBar(
                      onTap: (index){
                        articlesViewModel.loadArticles(state.data[index]);
                      },
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs:
                      state.data.map((sources)=>Tab(text: sources.name,)).toList(),
                    ),
                  );
                }
              }


            }),
            SizedBox(height: MediaQuery.of(context).size.height*0.026,),
            Consumer<ArticlesViewModel>(builder: (context,viewModel,_){
              var state=viewModel.state;
              switch (state){
                case InitialState():{
                  return Container();
                }
                case LoadingState():{
                  return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
                }
                case ErrorState():{
                  return Center(child: Text(state.message,style: TextStyle(color: Theme.of(context).primaryColor,)),);
                }
                case SuccessState():{
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (_,index)=>ArticleItem(article: state.data[index],),
                        separatorBuilder: (_,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.012,),
                        itemCount: state.data.length),
                  );
                }
              }
            }),

          ],
        ),
    );


    // return FutureBuilder(future: APIService.getSources(category),
    //     builder: (context,snapshot){
    //   if(snapshot.connectionState==ConnectionState.waiting){
    //     return Center(child: CircularProgressIndicator(),);
    //   }
    //   if(snapshot.hasError){
    //     return Center(child: Text("Error",style: TextStyle(color: Colors.white),));
    //   }
    //   List<Source>sources=snapshot.data?.sources ??[];
    //   return Column(
    //     children: [


    //     ],
    //   );
    //     });

  }
}
