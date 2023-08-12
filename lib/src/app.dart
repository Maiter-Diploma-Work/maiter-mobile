import 'package:amica/src/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amica/src/routes.dart';

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
    Color primaryColor = const Color(0xFF282B67);
    Color secondaryColor = const Color(0xFF7E18FF);
    Color tertiaryColor = const Color(0xFFFFBC58);
    Color errorColor = const Color(0xFFe95184);
    Color backgroundColor = const Color(0xFF080D20);
    Color surfaceColor = const Color(0xFF131111);
    Color inverseSurface = Colors.white;
    Color onPrimaryColor = Colors.white;
    Color onBackgroundColor = Colors.white;
    Color onErrorColor = Colors.white;
    Color onSurfaceColor = Colors.white;
    Color onSecondaryColor = Colors.black;
    Color onInverseSurface = Colors.black;

    return AmicaAuthScope(
      notifier: _auth,
      child: MaterialApp.router(
        title: widget.title,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: primaryColor,
            secondary: secondaryColor,
            tertiary: tertiaryColor,
            error: errorColor,
            background: backgroundColor,
            surface: surfaceColor,
            inverseSurface: inverseSurface,
            onPrimary: onPrimaryColor,
            onBackground: onBackgroundColor,
            onError: onErrorColor,
            onSurface: onSurfaceColor,
            onSecondary: onSecondaryColor,
            onInverseSurface: onInverseSurface,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: primaryColor,
            selectedItemColor: tertiaryColor,
            selectedLabelStyle: TextStyle(
              color: tertiaryColor,
              fontWeight: FontWeight.w500,
            ),
            unselectedItemColor: onPrimaryColor,
            type: BottomNavigationBarType.fixed,
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
