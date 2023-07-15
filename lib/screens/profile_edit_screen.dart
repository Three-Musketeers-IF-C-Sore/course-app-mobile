import 'package:intl/intl.dart';
import 'package:bp/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../theme/colors.dart';

class Profile_Edit_Page extends StatefulWidget {
  const Profile_Edit_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Edit_Page> createState() => _Profile_Edit_PageState();
}

class _Profile_Edit_PageState extends State<Profile_Edit_Page> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _about = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    final userProfileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    _name.text = userProfileProvider.firstName;
    _email.text = userProfileProvider.lastName;
    _about.text = userProfileProvider.about;
    _selectedDate = userProfileProvider.dateOfBirth;
    if (_selectedDate != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _about.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, userProfileProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
            centerTitle: true,
            backgroundColor: $primary500, // Replace with your desired color
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: $primary500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: 358,
                    height: 40,
                    child: TextField(
                      controller: _name,
                      onChanged: (value) {
                        userProfileProvider.updateFirstName(value);
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "First Name",
                        labelStyle: const TextStyle(
                          color:
                              $primary500, // Change the color to your desired color
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _name.clear();
                          },
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                $primary500, // Change the color to your desired color
                            width: 2.0, // Adjust the width as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 358,
                    height: 40,
                    child: TextField(
                      controller: _email,
                      onChanged: (value) {
                        userProfileProvider.updateLastName(value);
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Last Name",
                        labelStyle: const TextStyle(
                          color:
                              $primary500, // Change the color to your desired color
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _email.clear();
                          },
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                $primary500, // Change the color to your desired color
                            width: 2.0, // Adjust the width as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 358,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                              _dateController.text = DateFormat('yyyy-MM-dd')
                                  .format(_selectedDate!);
                            });
                            userProfileProvider
                                .updateDateOfBirth(_selectedDate);
                          }
                        });
                      },
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Date",
                          labelStyle: TextStyle(
                            color:
                                $primary500, // Change the color to your desired color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  $primary500, // Change the color to your desired color
                              width: 2.0, // Adjust the width as needed
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: _selectedDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ).then((pickedDate) {
                                if (pickedDate != null) {
                                  setState(() {
                                    _selectedDate = pickedDate;
                                    _dateController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(_selectedDate!);
                                  });
                                  userProfileProvider
                                      .updateDateOfBirth(_selectedDate);
                                }
                              });
                            },
                          ),
                        ),
                        controller: _dateController,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 358,
                    height: 40,
                    child: TextField(
                      controller: _about,
                      onChanged: (value) {
                        userProfileProvider.updateAbout(value);
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "About",
                        labelStyle: const TextStyle(
                          color:
                              $primary500, // Change the color to your desired color
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _about.clear();
                          },
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                $primary500, // Change the color to your desired color
                            width: 2.0, // Adjust the width as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 171,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: $primary500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                color: $primary500,
                                width: 1,
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Cancel button logic
                            userProfileProvider.cancelChanges();
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      SizedBox(
                        width: 171,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: $primary500,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Save button logic
                            userProfileProvider.saveData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
