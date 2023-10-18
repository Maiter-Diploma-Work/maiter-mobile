import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';

typedef OnTap = void Function();

class RegistrationScreen extends StatefulWidget {
  final String title;
  final String stepTitle;
  final Widget body;

  final OnTap onBackTapped;
  final OnTap onForwardTapped;

  final EdgeInsets? padding;

  const RegistrationScreen({
    super.key,
    required this.title,
    required this.stepTitle,
    required this.body,
    required this.onBackTapped,
    required this.onForwardTapped,
    this.padding,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  EdgeInsets? get _paddings {
    if (widget.padding == null) {
      return const EdgeInsets.only(
        // top: 64,
        left: 32,
        right: 32,
        // bottom: 64,
      );
    }

    return widget.padding;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF192142),
        title: AmicaTitle(
          text: widget.stepTitle,
          fontStyle: const TextStyle(fontSize: 32),
        ),
      ),
      body: Container(
        padding: _paddings,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xFF192142),
        ),
        child: Column(
          children: [
            Expanded(child: widget.body),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF192142),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AmicaRoundIconButton(
                onTap: widget.onBackTapped,
                icon: const Icon(Icons.chevron_left),
              ),
              AmicaRoundIconButton(
                onTap: widget.onForwardTapped,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
