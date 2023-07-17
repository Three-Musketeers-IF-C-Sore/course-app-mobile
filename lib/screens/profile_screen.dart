import 'dart:io';
import 'package:bp/screens/profile_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indexed/indexed.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _chosenImage;

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _chosenImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildColoredBox() {
    if (_chosenImage != null) {
      return Image.file(_chosenImage!);
    } else {
      return const ColoredBox(
        color: Color.fromRGBO(67, 55, 55, 100),
      );
    }
  }

  Widget nameEditText() {
    final userProfileProvider = Provider.of<ProfileProvider>(context);
    return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: SizedBox(
          width: 300,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  userProfileProvider.firstName,
                  textAlign: TextAlign.right,
                  style: $heading4Regular,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  userProfileProvider.lastName,
                  textAlign: TextAlign.left,
                  style: $heading4Regular,
                ),
              ),
            ],
          ),
        ));
  }

  Widget aboutEditText() {
    double screenWidth = MediaQuery.of(context).size.width;
    final userProfileProvider = Provider.of<ProfileProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(40),
        child: SizedBox(
            width: screenWidth * 1,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'About',
                      style: $heading5Regular,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        userProfileProvider.about,
                        textAlign: TextAlign.justify,
                        style: $caption2Light,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      backgroundColor: $white,
      body: SingleChildScrollView(
        child: Column(children: [
          Indexer(
            children: [
              Indexed(
                index: 0,
                child: Center(
                  child: SizedBox(
                    width: screenWidth * 1,
                    height: 335,
                    child: GestureDetector(
                      onLongPress: () {
                        _pickImage();
                      },
                      child: _buildColoredBox(),
                    ),
                  ),
                ),
              ),
              Indexed(
                  index: 5,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 283),
                      child: ClipOval(
                          child: SizedBox(
                        width: 144,
                        height: 144,
                        child: GestureDetector(
                          onDoubleTap: () {
                            _pickImage();
                          },
                          child: ColoredBox(
                              color: Color.fromRGBO(217, 217, 217, 1)),
                        ),
                      )),
                    ),
                  )),
              Indexed(
                  index: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 420),
                      child: nameEditText(),
                    ),
                  )),
              Indexed(
                index: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 430),
                  child: aboutEditText(),
                ),
              )
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(91, 80, 216, 0.8),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Profile_Edit_Page()));
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
