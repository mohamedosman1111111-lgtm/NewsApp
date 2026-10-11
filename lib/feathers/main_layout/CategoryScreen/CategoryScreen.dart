import 'package:flutter/material.dart';
import 'package:news_app/feathers/main_layout/CategoryScreen/CategoryItem.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
import 'package:news_app/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider=Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You",style: Theme.of(context).textTheme.labelLarge,),
          SizedBox(height: MediaQuery.of(context).size.height*0.018,),
          Expanded(
            child: ListView.separated(
                separatorBuilder:(_,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.012,),
                itemBuilder:(_,index)=>
                    InkWell(
                        onTap: ()=>homeProvider.changeToSources(),
                        child: CategoryItem(category: CategoryModel.categories[index],)),
                itemCount: CategoryModel.categories.length),
          )
        ],
      ),
    );
  }
}
