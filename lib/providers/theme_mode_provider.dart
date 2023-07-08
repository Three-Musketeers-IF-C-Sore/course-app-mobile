import 'package:bp/theme/colors.dart';
import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isReadMode = false;

  bool get isDarkMode => _isDarkMode;
  bool get isReadMode => _isReadMode;
  
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