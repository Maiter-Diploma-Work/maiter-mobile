import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AmicaBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;

  const AmicaBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _AmicaBottomNavigationBarState createState() =>
      _AmicaBottomNavigationBarState();
}

class _AmicaBottomNavigationBarState extends State<AmicaBottomNavigationBar> {
  void _onDestinationSelected(int idx, BuildContext context) {
    switch (idx) {
      case 0:
        context.go('/search/user');
        break;
      case 1:
        // context.go('/likes');
        break;
      case 2:
        context.go('/chat-list');
        break;
      case 3:
        context.go('/profile');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex ?? 0,
      onTap: (value) => _onDestinationSelected(value, context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'likes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile',
        ),
      ],
    );
  }
}