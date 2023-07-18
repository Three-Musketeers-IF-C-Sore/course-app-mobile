import 'package:bp/providers/theme_mode_provider.dart';
import 'package:bp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bp/theme/typography.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  void dispose() {
    _email.dispose();
    super.dispose();
    _password.dispose();
    super.dispose();
    _name.dispose();
    super.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  bool isRegisterButtonEnabled() {
    final name = _name.text;
    final email = _email.text;
    final password = _password.text;
    final confirmPassword = _confirmpassword.text;

    return name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty;
  }

  void onRegisterButtonPressed(BuildContext context) {
    if (isRegisterButtonEnabled()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
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
        title: const Text("Register"),
        centerTitle: true,
        backgroundColor: $primary500, // Replace with your desired color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'Register',
                  style: $heading4Bold.copyWith(color: setting.textColor)
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 358,
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: setting.isDarkMode ? $primary300 : $primary200,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: setting.textColor
                      )
                    ),
                    labelText: "Name",
                    hintText: "Name",
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
                        color: setting.textColor,// Change the color to your desired color
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
                  controller: _email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: setting.isDarkMode ? $primary300 : $primary200,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: setting.textColor
                      )
                    ),
                    labelText: "Email",
                    hintText: "Email",
                    labelStyle: const TextStyle(
                      color: $primary500, // Change the color to your desired color
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
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 358,
                child: TextField(
                  controller: _confirmpassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: setting.isDarkMode ? $primary300 : $primary200,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: setting.textColor
                      )
                    ),
                    labelText: "Password Confirmation",
                    hintText: "Password Confirmation",
                    labelStyle: const TextStyle(
                      color: $primary500, // Change the color to your desired color
                    ),
                    suffixIcon: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.circleXmark, color: $black,),
                      onPressed: () {
                        _confirmpassword.clear();
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
                  onPressed: () => onRegisterButtonPressed(context),
                  child: const Text('Register'),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Already have an account?', style: TextStyle(color: setting.textColor),),
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
