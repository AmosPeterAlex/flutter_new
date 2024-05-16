import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("LogoutPage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("LogoutPage"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go("/");
                },
                child: const Text("to login"))
          ],
        ),
      ),
    );
  }
}
