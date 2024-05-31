import 'package:flutter/material.dart';
import 'package:go_router_data_table_study/extras/new.dart';
// import 'package:your_app/services/login_service.dart'; // Adjust the import path as necessary

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _loginService = LoginService();

  void _performLogin() async {
   Map<String, dynamic> payload = {
  "query": '''
query Auth_Login(\$loginData: LoginInput!) {
  Auth_Login(loginData: \$loginData) {
    accessToken
  }
}
''',
  "variables": {
    "loginData": {
      "_deviceType": 0,
      "_email": "developer.fayizalinp@gmail.com",
      "_password": "0RneWfb0",
      "_userType": 0,
      "deviceId": "",
      "deviceName": "test",
      "deviceToken": "test",
      "grant_type": "password"
    }
  }
};

    try {
      final response = await _loginService.logService(payload);
      // Handle the response
      print("Login successful: $response");
    } catch (e) {
      // Handle the error
      print("Login failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _performLogin,
          child: Text("Login"),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
