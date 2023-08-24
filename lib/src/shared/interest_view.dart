import 'package:amica/src/models/shared/interest.dart';
import 'package:flutter/material.dart';

typedef OnTap = void Function(Interest element);

class InterestView extends StatefulWidget {
  final Interest interest;
  final Color? color;
  final OnTap? onTap;
  final BoxConstraints? constraints;

  const InterestView({
    super.key,
    required this.interest,
    this.onTap,
    this.color,
    this.constraints,
  });

  @override
  State<InterestView> createState() => _InterestViewState();
}

class _InterestViewState extends State<InterestView> {
  Widget interestTextGenerator() {
    return Text(
      widget.interest.name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap != null ? widget.onTap!(widget.interest) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        constraints: widget.constraints,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: widget.color ?? const Color(0x99616161),
        ),
        child: interestTextGenerator(),
      ),
    );
  }
}
