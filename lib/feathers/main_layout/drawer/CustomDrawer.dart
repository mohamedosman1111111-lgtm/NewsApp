import 'package:flutter/material.dart';
import 'package:news_app/provider/HomeProvider.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider=Provider.of<HomeProvider>(context);

    return Drawer(
      backgroundColor: AppColors.black,
      child:Column(
        children: [
          Container(
            alignment: Alignment.center,
              height: 166,
              width: double.infinity,
              color: AppColors.white,
              child: Text("News App",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.black),)),
          SizedBox(height: MediaQuery.of(context).size.height*0.018,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    homeProvider.changeToHome();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [

                      Icon(Icons.home_outlined,color: AppColors.white,),
                      SizedBox(width: MediaQuery.of(context).size.height*0.009,),

                      Text("Go To Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white),)
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.027,),

                Divider(color: AppColors.white,),
                SizedBox(height: MediaQuery.of(context).size.height*0.027,),
                Row(
                  children: [

                    Icon(Icons.format_paint_outlined,color: AppColors.white,),
                    SizedBox(width: MediaQuery.of(context).size.height*0.009,),

                    Text("Theme",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white),)
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.height*0.009,),
                DropdownButton(
                    items: ["Light","Dark"].map((val)=>DropdownMenuItem(value: val,child: Text(val),)).toList(),
                    onChanged: (newTheme){

                    }),
                SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                Divider(color: AppColors.white,),
                SizedBox(height: MediaQuery.of(context).size.height*0.027,),
                Row(
                  children: [

                    Icon(Icons.language,color: AppColors.white,),
                    SizedBox(width: MediaQuery.of(context).size.height*0.009,),

                    Text("Language",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.white),)
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.height*0.009,),
                DropdownButton(
                    items: ["English","العربية"].map((val)=>DropdownMenuItem(value: val,child: Text(val),)).toList(),
                    onChanged: (newTheme){

                    }),


              ],
            ),
          )

        ],
      ),

    );
  }
}
