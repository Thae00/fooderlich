import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // TODO: LoginScreen MaterialPage Helper

  final String? username;

  LoginScreen({
    this.username,
  });

  final Color rwColor = Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage(
                    'assets/fooderlich_assets/rw_logo.png',
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildTextfield(username ?? '🍔 username'),
              SizedBox(height: 16),
              buildTextfield('🎹 password'),
              SizedBox(height: 16),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          // TODO: Login -> Navigate to home
        },
      ),
    );
  }

  Widget buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(height: 0.5),
      ),
    );
  }
}
