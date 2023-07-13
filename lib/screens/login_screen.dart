import 'package:bp/main.dart';
import 'package:bp/screens/register_screen.dart';
import 'package:bp/theme/typography.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                            'Login',
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
              const SizedBox(height: 70),
              SizedBox(
                width: 358,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>($primary500),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: ''),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 30),
              const Text('Not Registered?'),
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
