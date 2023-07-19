import 'dart:io';
import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/screens/profile_edit_screen.dart';
import 'package:flutter/material.dart';
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
  File? _profileImage;

  void _pickImageBackground() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _chosenImage = File(pickedFile.path);
      });
    }

  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _textName;
    _aboutController.text = _textAbout;
  }

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
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

  Widget _profilePic() {
    if (_profileImage != null) {
      return Image.file(_profileImage!);
    } else {
      return const ColoredBox(
        color: Color.fromRGBO(221, 221, 221, 1),
      );
    }
  }

  Widget nameEditText() {
    final userProfileProvider = Provider.of<ProfileProvider>(context);
    final setting = Provider.of<ThemeModeProvider>(context);

    return Padding(
        padding: const EdgeInsets.only(left: 0, top: 5),
        child:Text(
            userProfileProvider.firstName == '' ? "Jonathan ${userProfileProvider.lastName}" : "${userProfileProvider.firstName} ${userProfileProvider.lastName}",
            textAlign: TextAlign.center,
            style: $heading5Bold.copyWith(color: setting.textColor),
          ),
    );
  }

  Widget aboutEditText() {
    double screenWidth = MediaQuery.of(context).size.width;
    final userProfileProvider = Provider.of<ProfileProvider>(context);
    final setting = Provider.of<ThemeModeProvider>(context);
    return Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, bottom: 30),
        child: SizedBox(
            width: screenWidth * 1.5,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'About',
                      style: $heading5Bold.copyWith(color: setting.textColor),
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
                        style: $caption2Light.copyWith(color: setting.textColor),
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
    final setting = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Indexer(
            children: [
              Indexed(
                index: 0,
                child: SingleChildScrollView(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SizedBox(
                          width: screenWidth * 1,
                          height: 335,
                          child: _buildColoredBox(),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: $primary500,
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: $white,
                            ),
                            onPressed: () {
                            _pickImageBackground();
                            },
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ),
              Indexed(
                  index: 5,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 283),
                      child: ClipOval(
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 140,
                                height: 140,
                                child: _profilePic(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 80, top: 80),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: $primary500,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: $white,
                                    ),
                                    onPressed: () {
                                    _pickImage();
                                    },
                                  ),
                                ),
                              )
                            ]
                          ))
                        ),
                    ),
                  ),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile_Edit_Page()));
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
