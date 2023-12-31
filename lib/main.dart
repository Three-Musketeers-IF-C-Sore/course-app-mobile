import 'package:course_app/providers/enrolled_course_provider.dart';
import 'package:course_app/providers/profile_provider.dart';
import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          fontFamily: 'Plus Jakarta Sans',
        ),
        home: const RegisterPage(),
      ),
    );
  }
}