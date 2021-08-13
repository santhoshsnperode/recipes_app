import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:udemy/dummy_data.dart';
import 'package:udemy/screens/category_meals_screen.dart';
import 'package:udemy/screens/filters_screen.dart';
import 'package:udemy/screens/meal_detail_screen.dart';
import 'package:udemy/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactos']! && meal.isLactosFree) {
          return false;
        }
        if (_filters['vegan']! && meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exitingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (exitingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(exitingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
     return _favoriteMeals.any((element) => element.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.grey,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
            ),
      ), //home: CategoriesScreen(),
      routes: {
        '/': (i) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (i) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (i) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (i) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
