import 'package:amica/src/shared/amica_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AmicaScaffold extends StatelessWidget {
  final String title;
  final Widget scaffoldBody;
  final Widget? scaffoldAppBarTitle;
  final List<Widget>? actions;
  final int selectedNavigationItemIndex;
  final bool isDetailed;
  final Color? appBarBackgroundColor;
  final Color? appBarForegroundColor;

  const AmicaScaffold({
    super.key,
    required this.title,
    required this.scaffoldBody,
    required this.selectedNavigationItemIndex,
    required this.isDetailed,
    this.appBarBackgroundColor,
    this.scaffoldAppBarTitle,
    this.actions,
    this.appBarForegroundColor,
  });

  Widget get _title {
    if (scaffoldAppBarTitle != null) {
      return scaffoldAppBarTitle!;
    }

    return Text(title);
  }

  Color _getAppBarBackgroundColor(BuildContext context) {
    if (appBarBackgroundColor != null) {
      return appBarBackgroundColor!;
    }

    if (isDetailed) {
      return Colors.transparent;
    }

    return Theme.of(context).colorScheme.primary;
  }

  Color _getAppBarForegroundColor(BuildContext context) {
    if (appBarForegroundColor != null) {
      return appBarForegroundColor!;
    }

    if (isDetailed) {
      return Theme.of(context).colorScheme.onBackground;
    }

    return Theme.of(context).colorScheme.onPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: isDetailed,
      appBar: AppBar(
        backgroundColor: _getAppBarBackgroundColor(context),
        foregroundColor: _getAppBarForegroundColor(context),
        elevation: 0,
        actions: actions ?? [],
        centerTitle: true,
        title: _title,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: AmicaBottomNavigationBar(
        selectedIndex: selectedNavigationItemIndex,
      ),
      body: scaffoldBody,
    );
  }
}
