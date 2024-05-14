import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_data_table_study/screens/home_page.dart';
import 'package:go_router_data_table_study/screens/login_page.dart';
import 'package:go_router_data_table_study/screens/logout_page.dart';
import 'package:go_router_data_table_study/screens/reg_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: "login",
      path: "/",
      // builder: (context, state) => LoginPage(),
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
      },
    ),
    GoRoute(
      name: "registration",
      path: "/registration",
      // builder: (context, state) => RegistrationPage(),
      pageBuilder: (context, state) {
        return MaterialPage(child: RegistrationPage());
      },
    ),
    GoRoute(
      name: "home",
      path: "/home",
      // builder: (context, state) => HomePage(),
      pageBuilder: (context, state) {
        return MaterialPage(child: HomePage());
      },
    ),
    GoRoute(
      name: "logout",
      path: "/logout",
      pageBuilder: (context, state) {
        return MaterialPage(child: LogoutPage());
      },
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
