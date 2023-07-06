import 'package:bp/theme/colors.dart';
import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isReadMode = false;

  bool get isDarkMode => _isDarkMode;
  bool get isReadMode => _isReadMode;

  // final ThemeData _darkMode = ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  // final ThemeData _lightMode = ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  set isDarkMode(bool value) {
    _isDarkMode = value;
    _isReadMode = false;
    notifyListeners();
  }

  set isReadMode(bool value) {
    _isReadMode = value;
    _isDarkMode = false;
    notifyListeners();
  }

  // ThemeData get currentThemeMode {
  //   ThemeData currentThemeMode = _isDarkMode && !_isReadMode ? _darkMode : _lightMode;
  //   return currentThemeMode;
  // }

  Color get backgroundColor {
    Color backgroundColor = _isReadMode
                  ? $readMode
                  : _isDarkMode
                    ? $darkMode
                    : $white;
    return backgroundColor;
  }

  Color get textColor {
    Color textColor = _isReadMode
                  ? Colors.black
                  : _isDarkMode
                    ? Colors.white
                    : Colors.black;
    return textColor;
  }
}