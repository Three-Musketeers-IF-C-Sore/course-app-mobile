import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnrolledCourseProvider extends ChangeNotifier {
  final List _enrolledCourseId = [2];
  List get enrolledCourseId => _enrolledCourseId;

  List allcourses = [];

  Future<List> readJson() async {
    final String response = await rootBundle.loadString("assets/json/course.json");
    final data = json.decode(response) as List;
    allcourses = data;
    return allcourses;
  }


  void enrolledCourse(int id) {
    _enrolledCourseId.add(id);
    notifyListeners();
  }

  List getEnrolledCourses() {
    readJson();
    List enrolled = [];
    allcourses.forEach((element) {
      if (_enrolledCourseId.contains(element['id'])) {
        enrolled.add(element);
      }
    });
    return enrolled;
  }

  bool isEnrolled(int id) {
    return _enrolledCourseId.contains(id);
  }

}