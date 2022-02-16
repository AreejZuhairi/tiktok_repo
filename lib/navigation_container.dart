
import 'package:flutter/material.dart';
import 'package:tiktok_tut/pages/add_video_page.dart';
import 'package:tiktok_tut/pages/discover_page.dart';
import 'package:tiktok_tut/pages/home_page.dart';
import 'package:tiktok_tut/pages/inbox_page.dart';
import 'package:tiktok_tut/pages/profile_page.dart';
import 'package:tiktok_tut/widgets/custom_navigation_bar.dart';
class NavigationContainer extends StatefulWidget{
  const NavigationContainer({Key? key}):super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}


class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex =0;
  static const List<Widget> _pages = [
    HomePage(), DiscoverPage(), AddVideoPage(), InboxPage(),
    ProfilePage(),
  ];
  void _onIconTapped (int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedPageIndex],),
      bottomNavigationBar:
       CustomBottomNavigationBar (
        selectedPageIndex:_selectedPageIndex, onIconTap:_onIconTapped),
        );
  }
} 