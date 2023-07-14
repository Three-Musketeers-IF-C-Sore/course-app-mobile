import 'package:bp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../main.dart';
import '../theme/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

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
    return Scaffold(
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
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: $primary500,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: 358,
                height: 40,
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Name",
                    labelStyle: TextStyle(
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Login",
                    labelStyle: TextStyle(
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
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color:
                          $primary500, // Change the color to your desired color
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _password.clear();
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
                  controller: _confirmpassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password Confirmation",
                    labelStyle: TextStyle(
                      color:
                          $primary500, // Change the color to your desired color
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _confirmpassword.clear();
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
              const SizedBox(height: 30),
              const Text('Already have an account?'),
              const SizedBox(height: 10),
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
                        side: BorderSide(
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
