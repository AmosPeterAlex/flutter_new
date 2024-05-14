import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("LoginPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("LoginPage"),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            MaterialButton(
              onPressed: () {
                context.go("/home");
              },
              child: Text("To HOME Page"),
            ), MaterialButton(
              onPressed: () {
                context.go("/registration");
              },
              child: Text("To Reg Page"),
            ), MaterialButton(
              onPressed: () {
                context.go("/logout");
              },
              child: Text("To LogOut Page"),
            ),
          ],
        ),
      ),
    );
  }
}
