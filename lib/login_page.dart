import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  String _errorMessage = '';
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.deepPurple,
            ],
          ),
        ),
        child: _isLoggedIn ? HomePage() : buildLoginForm(),
      ),
    );
  }

  Widget buildLoginForm() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      children: <Widget>[
        SizedBox(height: 80.0),
        Column(
          children: <Widget>[
            // Image.asset('assets/login_logo.png', height: 120),
            SizedBox(height: 16.0),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 120.0),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            filled: true,
            labelText: 'Username',
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 12.0),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            filled: true,
            labelText: 'Password',
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 8.0),
        if (_errorMessage.isNotEmpty)
          Text(
            _errorMessage,
            style: const TextStyle(
              color: Color.fromARGB(255, 2, 0, 0),
            ),
          ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            String username = _usernameController.text;
            String password = _passwordController.text;

            if (username == 'admin' &&
                password.length >= 6 &&
                _isPasswordValid(password)) {
              setState(() {
                _isLoggedIn = true;
              });
            } else {
              setState(() {
                _errorMessage =
                    'Password harus memiliki minimal 6 karakter dan mengandung huruf besar, huruf kecil, serta angka.';
              });
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHomePage() {
    return Container(
      child: Text(
        'Welcome to the Home Page!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  bool _isPasswordValid(String password) {
    // Implementasi logika validasi password
    // Return true jika password valid, false sebaliknya
    // validasi password: minimal 6 karakter, memiliki huruf besar dan huruf kecil
    if (password.length >= 6 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return true;
    } else {
      return false;
    }
  }
}
