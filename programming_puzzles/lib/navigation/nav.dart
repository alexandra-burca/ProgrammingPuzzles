import 'package:flutter/material.dart';
import 'package:programming_puzzles/navigation/map.dart';
import 'package:programming_puzzles/navigation/portfolio.dart';
import 'package:programming_puzzles/navigation/profile.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          MapScreen(), // Replace containers with MainScreen, PortfolioScreen, and ProfileScreen
          PortfolioScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Lectii',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Portofoliu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pink[400], // Darker color for active tab
        unselectedItemColor: Colors.grey[400], // Lighter color for inactive tabs
      ),
    );
  }
}
