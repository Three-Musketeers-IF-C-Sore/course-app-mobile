import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier {
  String firstName = '';
  String lastName = '';
  DateTime? dateOfBirth;
  String about = '';

  void updateFirstName(String value) {
    firstName = value; // Swap the assignments
    notifyListeners();
  }

  void updateLastName(String value) {
    lastName = value; // Swap the assignments
    notifyListeners();
  }

  void updateDateOfBirth(DateTime? value) {
    dateOfBirth = value;
    notifyListeners();
  }

  void updateAbout(String value) {
    about = value;
    notifyListeners();
  }

  void saveData() {
    notifyListeners();
  }

  void cancelChanges() {
    firstName = '';
    lastName = '';
    dateOfBirth = null;
    about = '';
    notifyListeners();
  }
}
