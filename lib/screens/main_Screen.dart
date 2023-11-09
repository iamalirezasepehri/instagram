import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/personal_page.dart';
import 'package:instagram/screens/post_Screen.dart';
import 'package:instagram/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int SelectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: darkblue,
              currentIndex: SelectedBottomNavigationIndex,
              onTap: (index) {
                setState(() {
                  SelectedBottomNavigationIndex = index;
                });
              },
              selectedIconTheme: IconThemeData(size: 30),
              unselectedIconTheme: IconThemeData(size: 30),
              selectedItemColor: custompink,
              unselectedItemColor: customgrey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "test1",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "test1",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: "test1",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "test1",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: "test1",
                ),
              ]),
        ),
      ),
      body: IndexedStack(
        index: SelectedBottomNavigationIndex,
        children: GetLayout(),
      ),
    );
  }

  List<Widget> GetLayout() {
    return [
      HomeScreen(),
      SearchScree(),
      PostScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
