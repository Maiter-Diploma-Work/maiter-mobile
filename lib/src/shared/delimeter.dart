import 'package:flutter/material.dart';

class Delimeter extends StatefulWidget {
  final double? topMargin;
  final double? bottomMargin;

  const Delimeter({
    Key? key,
    this.topMargin,
    this.bottomMargin,
  }) : super(key: key);

  @override
  _DelimeterState createState() => _DelimeterState();
}

class _DelimeterState extends State<Delimeter> {
  EdgeInsets get padding {
    return EdgeInsets.only(
      bottom: widget.bottomMargin ?? 0,
      top: widget.topMargin ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 1,
          ),
        ),
      ),
      margin: EdgeInsets.only(
        top: widget.topMargin ?? 0,
        bottom: widget.bottomMargin ?? 0,
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
}
