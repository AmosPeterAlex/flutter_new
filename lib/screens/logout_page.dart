import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("LogoutPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("LogoutPage"),
            ElevatedButton(
                onPressed: () {
                  context.go("/");
                },
                child: Text("to login"))
          ],
        ),
      ),
    );
  }
}
