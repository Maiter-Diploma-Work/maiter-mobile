import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AmicaBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const AmicaBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  void _onDestinationSelected(int idx, BuildContext context) {
    switch (idx) {
      case 0:
        context.go('/search');
        break;
      case 1:
        context.go('/events');
        break;
      case 2:
        context.go('/chat');
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
    bool isLightTheme =
        Theme.of(context).colorScheme.brightness == Brightness.light;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Theme.of(context).colorScheme.primary,
            ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Theme.of(context).colorScheme.surface,
        unselectedItemColor: isLightTheme ? Colors.black87 : Colors.white70,
        selectedIconTheme: IconThemeData(
          shadows: [
            Shadow(
              offset: Offset.zero,
              blurRadius: 32.0,
              color: isLightTheme ? Colors.black26 : Colors.white24,
            )
          ],
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w800,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (value) => _onDestinationSelected(value, context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'people',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'discover',
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
      ),
    );
  }
}
