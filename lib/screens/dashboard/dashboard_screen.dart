import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/screens/dashboard/activities_screen.dart';
import 'package:upalerts/screens/dashboard/alerts_screen.dart';
import 'package:upalerts/screens/dashboard/homeScreenWidgets/custom_appbar.dart';
import 'package:upalerts/screens/dashboard/home_screen.dart';
import 'package:upalerts/screens/dashboard/portfolio_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() {
    return _DashBoardScreenState();
  }
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final widgetList =  <Widget>[
    const HomeScreen(),
    const AlertsScreen(),
    PortfolioScreen(),
    const ActivitiesScreen(),
    const Text('Jobs'),
  ];

  final labelList = [
    'Home',
    'Alerts',
    'Portfolio',
    'Activities',
  ];

  int activeIndex = 0;
  String activeScreen = "home";
  @override
  Widget build(BuildContext context) {
    // List of custom icons as ImageIcons from assets
    final iconList = <ImageIcon>[
      ImageIcon(const AssetImage(Assets.homeIcon),
          color: activeIndex == 0 ? Colors.green : Colors.black), // Home Icon
      ImageIcon(const AssetImage(Assets.notification),
          color: activeIndex == 1
              ? Colors.green
              : Colors.black), // Notification Icon
      ImageIcon(const AssetImage(Assets.briefcase),
          color:
              activeIndex == 2 ? Colors.green : Colors.black), // Portfolio Icon
      ImageIcon(const AssetImage(Assets.menuBoard),
          color: activeIndex == 3
              ? Colors.green
              : Colors.black), // Activities Icon
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetList[activeIndex],
      appBar: CustomAppBarHomeScreen(activeScreen: activeScreen),

      // Floating button in the center
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activeIndex = 4;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        child: const ImageIcon(
          AssetImage(Assets.briefcase),
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bottom navigation bar
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.green : Colors.black;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconList[index],
              const SizedBox(height: 4),
              Text(
                labelList[index],
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: activeIndex,
        splashColor: Colors.green,
        scaleFactor: 0.4,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() {
          activeIndex = index;
          switch (index) {
            case 0:
              activeScreen = "home";
              break;
            case 1:
              activeScreen = "Custom Alerts";
              break;
            case 2:
              activeScreen = "Portfolio";
              break;
            case 3:
              activeScreen = "Activities";
              break;
            case 4:
              activeScreen = "Jobs";
              break;
          }
        }), // Switch tabs
      ),
    );
  }
}
