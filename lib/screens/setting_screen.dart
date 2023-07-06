import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/theme/colors.dart';
import 'package:bp/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Display Setting",
                style: $heading4Regular.copyWith(color: setting.textColor),
              ),
            ),
            Divider(color: setting.textColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Dark Mode',
                  style: $body1Regular.copyWith(color: setting.textColor),
                ),
                Switch(
                  value: setting.isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      setting.isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Read Mode',
                  style: $body1Regular.copyWith(color: setting.textColor),
                ),
                Switch(
                  value: setting.isReadMode,
                  onChanged: (value) {
                    setState(() {
                      setting.isReadMode = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}