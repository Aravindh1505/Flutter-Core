import 'package:flutter/material.dart';

import '/screens/categories_screen.dart';
import '/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': const FavoriteScreen(),
      'title': 'Favorites',
    }
  ];

  int _selectedIndex = 0;

  void selectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title'] as String),
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: selectedItem,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: _pages[0]['title'] as String),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: _pages[1]['title'] as String),
        ],
      ),
    );
  }
}
