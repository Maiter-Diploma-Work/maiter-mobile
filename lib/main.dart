import 'package:flutter/material.dart';
import 'package:maiter/user_profile_view/anna_shapovalova.dart';
import 'package:maiter/user_profile_view/user_profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF303F9F),
          secondary: Color(0xFFFAD300),
          error: Color(0xFFb43f3f),
          background: Color(0xFFD9D9D9),
          surface: Color(0xFFD9D9D9),
          onPrimary: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          onSurface: Colors.black,
          onSecondary: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Maiter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void navigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void appBarMenuButtonTapped() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(widget.title),
        ),
      ),
      body: UserProfileView(profile: AnnaShapovalova),
      bottomSheet: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            '',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: 'create'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'likes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: navigationBarItemTapped,
      ),
    );
  }
}
