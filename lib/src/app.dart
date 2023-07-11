import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/auth.dart';
import 'package:maiter/src/routes.dart';

class Maiter extends StatefulWidget {
  final String title;

  const Maiter({Key? key, required this.title}) : super(key: key);

  @override
  _MaiterState createState() => _MaiterState();
}

class _MaiterState extends State<Maiter> {
  int _selectedIndex = 0;
  final MaiterAuth _auth = MaiterAuth();

  void navigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleAuthStateChanged() {
    if (!_auth.signedIn) {
      context.go('/');
      return;
    }

    context.go('/home');
  }

  @override
  void initState() {
    super.initState();
    _auth.addListener(_handleAuthStateChanged);
  }

  @override
  Widget build(BuildContext context) {
    return MaiterAuthScope(
      notifier: _auth,
      child: MaterialApp.router(
        title: widget.title,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF303F9F),
            secondary: Color(0xFF7E18FF),
            tertiary: Color(0xFFFFBC58),
            error: Color(0xFFe95184),
            background: Color(0xFFFFFFFF),
            surface: Color(0xFF131111),
            onPrimary: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
            onSurface: Colors.black,
            onSecondary: Colors.black,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
        routerConfig: router,
      ),
    );
  }

  @override
  void dispose() {
    _auth.removeListener(_handleAuthStateChanged);
    super.dispose();
  }
}
