import 'package:flutter/material.dart';
import 'package:news_app/feathers/models/CategoryModel.dart';
import 'package:news_app/utils/AppColors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
  });

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isTextOnRight = index.isEven;

    return Container(
      height: 190,
      margin:  EdgeInsets.symmetric(vertical: 8),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
                alignment:
                isTextOnRight ? Alignment.centerLeft : Alignment.centerRight,
              ),
            ),

            Positioned(
              top: 0,
              bottom: 0,
              left: isTextOnRight ? null : 16,
              right: isTextOnRight ? 16 : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.026,),
                   _ViewAllButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left: 16, right: 4, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color:AppColors.grey,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Text(
            "View All",
            style: Theme.of(context).textTheme.labelLarge
          ),
          SizedBox(width: MediaQuery.of(context).size.height*0.013,),
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).focusColor,
            child: Icon(Icons.chevron_right, color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}