import 'package:assistantstroke/page/main_home/home_history/home_history.dart';
import 'package:assistantstroke/page/main_home/home_map/home_map.dart';
import 'package:assistantstroke/page/main_home/home_profile/home_profile.dart';
import 'package:assistantstroke/page/main_home/home_view/home_view.dart';
import 'package:flutter/material.dart';

class HomeNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    HomeMap(),
    HomeHistory(),
    HomeProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.cyan.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Bản đồ"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Hóa đơn"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hồ sơ"),
        ],
      ),
    );
  }
}
