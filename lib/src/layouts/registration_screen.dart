import 'package:amica/src/shared/title.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:flutter/material.dart';

typedef OnTap = void Function();

class RegistrationScreen extends StatefulWidget {
  final String title;
  final String stepTitle;
  final Widget body;

  final OnTap onBackTapped;
  final OnTap onForwardTapped;

  const RegistrationScreen({
    super.key,
    required this.title,
    required this.stepTitle,
    required this.body,
    required this.onBackTapped,
    required this.onForwardTapped,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xFF192142),
        ),
        child: Column(
          children: [
            AmicaTitle(text: widget.stepTitle),
            Text(widget.stepTitle),
            Expanded(child: widget.body),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            )
          ],
        ),
      ),
    );
  }
}
