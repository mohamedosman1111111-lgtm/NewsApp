import 'package:flutter/material.dart';
import 'package:news_app/feathers/main_layout/CategoryScreen/CategoryScreen.dart';
import 'package:news_app/feathers/main_layout/drawer/CustomDrawer.dart';
import 'package:news_app/feathers/main_layout/sources/SourcesScreen.dart';
import 'package:news_app/feathers/main_layout/CategoryScreen/CategoryItem.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
import 'package:news_app/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider=Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      drawer: CustomDrawer(),
      body: homeProvider.selectedWidget
    );
  }
}
//            SizedBox(height: MediaQuery.of(context).size.height*0.018,),16
//            SizedBox(height: MediaQuery.of(context).size.height*0.0345,),32
//            SizedBox(height: MediaQuery.of(context).size.height*0.009,), 8