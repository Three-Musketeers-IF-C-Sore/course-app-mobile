import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/screens/about_us_screen.dart';
import 'package:course_app/screens/dashboard_screen.dart';
import 'package:course_app/screens/discover_screen.dart';
import 'package:course_app/screens/home_screen.dart';
import 'package:course_app/screens/profile_screen.dart';
import 'package:course_app/screens/setting_screen.dart';
import 'package:course_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final _pageNames = [
      'Home',
      'Discover',
      'Dashboard',
    ];

    final List<Widget> _widgetOptions = [
      const HomePage(),
      const DiscoverPage(),
      const DashboardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);
    // final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: Text(_pageNames[_selectedIndex]),
        centerTitle: true,
        backgroundColor: $primary500,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const ProfilePage()
              )
            );
          }, 
          icon: const Icon(Icons.account_circle),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const SettingPage()
                        )
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'Settings',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ]
                        ),
                      ),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const AboutUsPage()
                        )
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ]
                        ),
                      ),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == "add") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiscoverPage(),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: const Color.fromRGBO(243, 237, 247, 1.0),
        selectedItemColor: const Color.fromRGBO(0, 0, 0, 1),
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, 1),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
            activeIcon: Icon(Icons.dashboard),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}