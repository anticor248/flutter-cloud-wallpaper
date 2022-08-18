import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app_complete/settings_page.dart';
import 'package:flutter_wallpaper_app_complete/wallpaper_full_page.dart';
import 'package:flutter_wallpaper_app_complete/wallpaper_thumb_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;
  List<Widget> _pageList = [
    WallpapersThumbPage(),
    WallpaperFullPage(
      fullUrl: '',
    ),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Json Veri'),
        ),
        body: IndexedStack(index: _pageIndex, children: _pageList),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: GNav(
            onTabChange: (valueIndex) {
              setState(() {
                _pageIndex = valueIndex;
              });
            },
            gap: 8,
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 12), // navigation bar padding
            activeColor: Colors.white,
            tabBackgroundColor:
                Colors.deepOrange, // selected tab background color

            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: 'Settings',
              ),
            ],
          ),
        ));
  }
}
