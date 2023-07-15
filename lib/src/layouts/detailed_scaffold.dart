import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/maiter_bottom_navigation_bar.dart';

class MaiterDetailedScaffold extends StatefulWidget {
  final String title;
  final Widget scaffoldBody;

  const MaiterDetailedScaffold({
    super.key,
    required this.title,
    required this.scaffoldBody,
  });

  @override
  State<MaiterDetailedScaffold> createState() => _MaiterDetailedScaffoldState();
}

class _MaiterDetailedScaffoldState extends State<MaiterDetailedScaffold> {
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
              onPressed: () => context.go('/search/user'),
            ),
            Text(widget.title),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MaiterBottomNavigationBar(),
      body: widget.scaffoldBody,
    );
  }
}
