// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vlab/screens/homeScreens/home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newindex) {
          setState(() {
            index = newindex;
          });
        },
        children: [
          const HomePage(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                blurRadius: 0.51,
                color: Colors.black,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              elevation: 1,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.star),
                  label: 'favorit vlab',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.tags),
                  label: 'offers',
                ),
              ],
              currentIndex: index,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 50),
                    curve: Curves.ease);
              },
            ),
          ),
        ),
      )),
    );
  }
}
