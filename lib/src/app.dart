import 'package:amica/src/auth.dart';
import 'package:amica/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Amica extends StatefulWidget {
  final String title;

  const Amica({Key? key, required this.title}) : super(key: key);

  @override
  _AmicaState createState() => _AmicaState();
}

class _AmicaState extends State<Amica> {
  final AmicaAuth _auth = AmicaAuth();

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
    return AmicaAuthScope(
      notifier: _auth,
      child: MaterialApp.router(
        title: widget.title,
        themeMode: ThemeMode.system,
        theme: ThemeData(
            primarySwatch: Colors.red,
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFFDB3264),
              secondary: Color(0xFF7E18FF),
              tertiary: Color(0xFFFFBC58),
              error: Color(0xFFe95184),
              background: Color(0xFFEEEEEE),
              surface: Color(0xFFECEEEE),
              inverseSurface: Color(0xFF131111),
              onPrimary: Colors.white,
              onBackground: Colors.black,
              onError: Colors.black,
              onSurface: Colors.black,
              onSecondary: Colors.white,
              onInverseSurface: Colors.white,
            )),
        darkTheme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xFFDB3264),
            secondary: Color(0xFF7E18FF),
            tertiary: Color(0xFFFFBC58),
            error: Color(0xFFe95184),
            background: Color(0xFF121212),
            surface: Color(0xFF212121),
            inverseSurface: Color(0xFFECEEEE),
            onPrimary: Colors.white,
            onBackground: Colors.white,
            onError: Colors.white,
            onSurface: Colors.white,
            onSecondary: Colors.black,
            onInverseSurface: Colors.black,
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
