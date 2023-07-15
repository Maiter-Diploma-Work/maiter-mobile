import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/shared/maiter_bottom_navigation_bar.dart';

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
