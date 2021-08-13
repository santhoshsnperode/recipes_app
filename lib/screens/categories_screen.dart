import 'package:flutter/material.dart';
import 'package:udemy/widgets/category_item.dart';
import 'package:udemy/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(e.id, e.title, e.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
      ),
    );
  }
}
