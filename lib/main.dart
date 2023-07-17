import 'package:bp/providers/enrolled_course_provider.dart';
import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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