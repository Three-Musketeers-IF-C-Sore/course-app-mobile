import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/screens/setting_screen.dart';
import 'package:bp/theme/colors.dart';
import 'package:bp/theme/typography.dart';
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
            Text(
              'You have pushed the button this many times:',
              style: $heading5Regular.copyWith(color: setting.textColor),
            ),
            // Temporary button to setting page
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
              }, 
              child: const Text('Setting'),
            )
          ],
        ),
      ),
    );
  }
}
