import 'package:amica/src/shared/amica_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AmicaScaffold extends StatelessWidget {
  final String title;
  final Widget scaffoldBody;
  final Widget? scaffoldAppBarTitle;
  final int selectedNavigationItemIndex;
  final bool isDetailed;
  final Color? appBarBackgroundColor;

  const AmicaScaffold({
    super.key,
    required this.title,
    required this.scaffoldBody,
    required this.selectedNavigationItemIndex,
    required this.isDetailed,
    this.appBarBackgroundColor,
    this.scaffoldAppBarTitle,
  });

  Widget get _title {
    if (scaffoldAppBarTitle != null) {
      return scaffoldAppBarTitle!;
    }

    return Text(title);
  }

  Color getAppBarBackgroundColor(BuildContext context) {
    if (appBarBackgroundColor != null) {
      return appBarBackgroundColor!;
    }

    if (isDetailed) {
      return Colors.transparent;
    }

    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: isDetailed,
      appBar: AppBar(
        backgroundColor: getAppBarBackgroundColor(context),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => {},
          ),
        ],
        centerTitle: true,
        title: _title,
      ),
      bottomNavigationBar: AmicaBottomNavigationBar(
        selectedIndex: selectedNavigationItemIndex,
      ),
      body: scaffoldBody,
    );
  }
}
