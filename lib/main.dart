import 'package:bp/providers/enrolled_course_provider.dart';
import 'package:bp/providers/profile_provider.dart';
import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/screens/discover_screen.dart';
import 'package:bp/screens/login_screen.dart';
import 'package:bp/screens/setting_screen.dart';
import 'package:bp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/about_us_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) =>
        ProfileProvider(), // Provide an instance of ProfileProvider
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModeProvider()),
        ChangeNotifierProvider(create: (context) => EnrolledCourseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.white,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: $primary500,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Temporary button to setting page
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
              child: const Text('Setting'),
            ),
            // Temporary button to discover page
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiscoverPage()));
              },
              child: const Text('Discover Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Login Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsPage()));
              },
              child: const Text('About Us'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: const Text('Profile'),
            )
          ],
        ),
      ),
    );
  }
}
