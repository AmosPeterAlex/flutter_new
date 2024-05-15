import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("HomePage"),
            ElevatedButton(
                onPressed: () {
                  context.go("/logout");
                },
                child: const Text("Go to LogOut")),
            ElevatedButton(
                onPressed: () {
                  context.go("/");
                },
                child: const Text("Go to Login")),
            ElevatedButton(
                onPressed: () {
                  context.go("/registration");
                },
                child: const Text("Go to Reg"))
          ],
        ),
      ),
    );
  }
}
