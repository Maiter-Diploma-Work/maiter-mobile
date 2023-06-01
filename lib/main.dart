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
      theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
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
      body: Center(
        child: UserProfileView(
          profile: AnnaShapovalova,
        ),
      ),
      bottomSheet: Container(
          decoration: const BoxDecoration(color: Colors.indigo),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: const Center(
              child: Text(
            style: TextStyle(color: Colors.white),
            '',
          ))),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
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
