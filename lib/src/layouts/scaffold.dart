import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaiterScaffold extends StatefulWidget {
  final String title;
  final Widget scaffoldBody;

  const MaiterScaffold({
    super.key,
    required this.title,
    required this.scaffoldBody,
  });

  @override
  State<MaiterScaffold> createState() => _MaiterScaffoldState();
}

class _MaiterScaffoldState extends State<MaiterScaffold> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int idx, BuildContext context) {
    setState(() {
      _selectedIndex = idx;
    });

    switch (idx) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/likes');
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
    return Scaffold(
      body: AdaptiveNavigationScaffold(
        selectedIndex: _selectedIndex,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => {},
            ),
          ],
        ),
        onDestinationSelected: (idx) => _onDestinationSelected(idx, context),
        body: widget.scaffoldBody,
        destinations: const [
          AdaptiveScaffoldDestination(icon: Icons.home, title: 'home'),
          AdaptiveScaffoldDestination(icon: Icons.favorite, title: 'likes'),
          AdaptiveScaffoldDestination(icon: Icons.chat, title: 'chat'),
          AdaptiveScaffoldDestination(icon: Icons.person, title: 'profile'),
        ],
      ),
    );
  }
}
