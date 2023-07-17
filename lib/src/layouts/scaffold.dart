import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/shared/maiter_bottom_navigation_bar.dart';

class MaiterScaffold extends StatelessWidget {
  final String title;
  final Widget scaffoldBody;
  final int selectedNavigationItemIndex;

  const MaiterScaffold({
    super.key,
    required this.title,
    required this.scaffoldBody,
    required this.selectedNavigationItemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => {},
            ),
            Text(title),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaiterBottomNavigationBar(
        selectedIndex: selectedNavigationItemIndex,
      ),
      body: scaffoldBody,
    );
  }
}
