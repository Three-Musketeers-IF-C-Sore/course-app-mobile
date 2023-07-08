import 'package:bp/theme/colors.dart';
import 'package:flutter/material.dart';

class EnrolledCourseProvider extends ChangeNotifier {
  List _enrolledCourseId = [];
  List get enrolledCourseId => _enrolledCourseId;

  void enrolledCourse(int id) {
    _enrolledCourseId.add(id);
    notifyListeners();
  }

  bool isEnrolled(int id) {
    return _enrolledCourseId.contains(id);
  }

}