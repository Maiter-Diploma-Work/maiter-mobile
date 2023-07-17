import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/maiter_bottom_navigation_bar.dart';

class MaiterDetailedScaffold extends StatelessWidget {
  final String title;
  final String backRoute;
  final Widget scaffoldBody;
  final int selectedNavigationItemIndex;

  const MaiterDetailedScaffold({
    super.key,
    required this.title,
    required this.scaffoldBody,
    required this.selectedNavigationItemIndex,
    required this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go(backRoute),
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
