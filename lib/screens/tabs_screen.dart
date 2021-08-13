import 'package:flutter/material.dart';
import 'package:udemy/models/meal.dart';
import 'package:udemy/screens/categories_screen.dart';
import 'package:udemy/screens/favorites_screen.dart';
import 'package:udemy/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;
  TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, dynamic>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState(){
    _pages=[
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoritesScreen(
            widget.favoritesMeals
        ), 'title': 'Your Favorites'
      }
      ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites'))
        ],
      ),
    );
  }
}
