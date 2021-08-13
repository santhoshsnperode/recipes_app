import 'package:flutter/material.dart';
import 'package:udemy/models/meal.dart';
import 'package:udemy/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal>_availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;
  var _loadingInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadingInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'].toString();
      final categoryId = routeArgs['id'];
      displayedMeal = widget._availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadingInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            displayedMeal[index].id,
            displayedMeal[index].title,
            displayedMeal[index].imageUrl,
            displayedMeal[index].duration,
            displayedMeal[index].complexity,
            displayedMeal[index].affordability,
          );
        },
        itemCount: displayedMeal.length,
      ),

    );
  }
}
