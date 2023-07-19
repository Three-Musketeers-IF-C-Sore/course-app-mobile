import 'package:course_app/providers/theme_mode_provider.dart';
import 'package:course_app/screens/base_screen.dart';
import 'package:course_app/screens/register_screen.dart';
import 'package:course_app/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
    _password.dispose();
    super.dispose();
  }

  bool isLoginButtonEnabled() {
    final email = _email.text;
    final password = _password.text;
    return email.isNotEmpty && password.isNotEmpty;
  }

  void onLoginButtonPressed(BuildContext context) {
    if (isLoginButtonEnabled()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BasePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<ThemeModeProvider>(context);

    return Scaffold(
      backgroundColor: setting.backgroundColor,
      appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          backgroundColor: $primary500,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasePage(),
                ),
              );
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'Login',
                  style: $heading4Bold.copyWith(color: setting.textColor)
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 358,
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: setting.isDarkMode ? $primary300 : $primary200,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: setting.textColor
                      )
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: $black),
                    labelText: "Email",
                    helperText: "text@gmail.com",
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
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 358,
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: setting.isDarkMode ? $primary300 : $primary200,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: setting.textColor
                      )
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    labelStyle: const TextStyle(
                      color: $primary500, // Change the color to your desired color
                    ),
                    suffixIcon: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.circleXmark, color: $black,),
                      onPressed: () {
                        _password.clear();
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
              const Padding(padding: EdgeInsets.all(15)),
              SizedBox(
                width: 358,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      $primary500,
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () => onLoginButtonPressed(context),
                  child: const Text('Login'),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Not Registered?', style: TextStyle(color: setting.textColor),),
              const Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                width: 358,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>($primary500),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: $primary500,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
