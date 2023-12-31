import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/theme/typography.dart';
import 'package:intl/intl.dart';
import 'package:course_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final setting = Provider.of<ThemeModeProvider>(context);

    return Consumer<ProfileProvider>(
      builder: (context, userProfileProvider, child) {
        return Scaffold(
          backgroundColor: setting.backgroundColor,
          appBar: AppBar(
            title: const Text("Profile"),
            centerTitle: true,
            backgroundColor: $primary500, // Replace with your desired color
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: 
                        Text(
                          'Edit Profile',
                          style: $heading4Bold.copyWith(color: setting.textColor)
                        ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 25)),
                    SizedBox(
                      width: 358,
                      child: TextField(
                        controller: _name,
                        onChanged: (value) {
                          userProfileProvider.updateFirstName(value);
                        },
                        style: const TextStyle(color: $black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: setting.isDarkMode ? $primary300 : $primary200,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: setting.textColor
                            )
                          ),
                          hintText: "First Name",
                          labelText: "First Name",
                          helperText: "This name will be displayed publicly",
                          helperStyle: TextStyle(color: setting.textColor),
                          labelStyle: const TextStyle(
                            color: $primary500, // Change the color to your desired color
                          ),
                          suffixIcon: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.circleXmark, color: $black,),
                            onPressed: () {
                              _name.clear();
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: setting.textColor, // Change the color to your desired color
                              width: 2.0, // Adjust the width as needed
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    SizedBox(
                      width: 358,
                      child: TextField(
                        controller: _email,
                        onChanged: (value) {
                          userProfileProvider.updateLastName(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: setting.isDarkMode ? $primary300 : $primary200,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: setting.textColor)
                          ),
                          labelText: "Last Name",
                          hintText: "Last Name",
                          helperText: "This name will be displayed publicly",
                          helperStyle: TextStyle(color: setting.textColor),
                          labelStyle: const TextStyle(
                            color:
                                $primary500, // Change the color to your desired color
                          ),
                          suffixIcon: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.circleXmark, color: $black,),
                            onPressed: () {
                              _email.clear();
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: setting.textColor, // Change the color to your desired color
                              width: 2.0, // Adjust the width as needed
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    SizedBox(
                      width: 358,
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
                                _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
                              });
                              userProfileProvider.updateDateOfBirth(_selectedDate);
                            }
                          });
                        },
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: setting.isDarkMode ? $primary300 : $primary200,
                            border: const UnderlineInputBorder(),
                            labelText: "Date",
                            hintText: "Date",
                            helperText: "YYYY-MM-DD",
                            helperStyle: TextStyle(color: setting.textColor),
                            labelStyle: const TextStyle(
                              color: $primary500, // Change the color to your desired color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: setting.textColor, // Change the color to your desired color
                                width: 2.0, // Adjust the width as needed
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
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
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    SizedBox(
                      width: 358,
                      child: TextField(
                        controller: _about,
                        onChanged: (value) {
                          userProfileProvider.updateAbout(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: setting.isDarkMode ? $primary300 : $primary200,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color : setting.textColor),
                          ),
                          labelText: "About",
                          hintText: "About",
                          labelStyle: const TextStyle(
                            color:
                                $primary500,
                          ),
                          suffixIcon: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.circleXmark, color: $black,),
                            onPressed: () {
                              _about.clear();
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: setting.textColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 105,
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
                        const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
                        SizedBox(
                          width: 105,
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
          ),
        );
      },
    );
  }
}
