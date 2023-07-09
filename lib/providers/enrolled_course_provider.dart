import 'package:flutter/material.dart';

class EnrolledCourseProvider extends ChangeNotifier {
  final List _enrolledCourseId = [];
  List get enrolledCourseId => _enrolledCourseId;

  void enrolledCourse(int id) {
    _enrolledCourseId.add(id);
    notifyListeners();
  }

  bool isEnrolled(int id) {
    return _enrolledCourseId.contains(id);
  }

}