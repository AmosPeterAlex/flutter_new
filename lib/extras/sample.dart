import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

// Navigator keys
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

// Router configuration
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          BottomNavigationBarScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/chat',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => ChatPage(),
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => SettingsPage(),
          routes: [
            GoRoute(
              path: 'terms',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => TermsOfServicesPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/settings/sajin',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => SajinPage(),
        )
      ],
    ),
  ],
);

class BottomNavigationBarScaffold extends StatefulWidget {
  final Widget child;

  BottomNavigationBarScaffold({required this.child});

  @override
  _BottomNavigationBarScaffoldState createState() =>
      _BottomNavigationBarScaffoldState();
}

class _BottomNavigationBarScaffoldState
    extends State<BottomNavigationBarScaffold> {
  int _selectedIndex = 0;

  static const List<String> _routes = [
    '/',
    '/chat',
    '/settings',
    '/settings/sajin'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    GoRouter.of(context).go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Sajin',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Pages
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Home Page')),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Center(child: Text('Chat Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Settings Page'),
            ElevatedButton(
              onPressed: () =>
                  GoRouter.of(context).go('/settings/terms'),
              child: Text('Terms of Services'),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsOfServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms of Services')),
      body: Center(child: Text('Terms of Services Page')),
    );
  }
}

class TermsOfServicesPagein2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms of Services')),
      body: Center(child: Text('Terms of Services Page\n2')),
    );
  }
}

class TermsOfServicesPagein1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms of Services')),
      body: Center(child: Text('Terms of Services Page \n1')),
    );
  }
}

class SajinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sajin')),
      body: Center(child: Text('sajin Page')),
    );
  }
}
