import 'package:aqary_tset/model/category_model.dart'; // Assuming your Category model
import 'package:flutter/material.dart';

import '../../../screen/category_details_screen.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, CategoryDetailsScreen.routeName,
                  arguments: category),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(category.imgUrl, height: 50, width: 50),
                  const SizedBox(height: 20),
                  Text(category.name),
                ],
                // Adjust route name
              ),
            ),
          );
        },
      ),
    );
  }
}
