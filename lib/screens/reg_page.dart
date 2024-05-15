import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("RegistrationPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("RegistrationPage"),
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
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            MaterialButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("To Login"),
            )
          ],
        ),
      ),
    );
  }
}
