import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef OnPressed = void Function(BuildContext context);

class LinkButton extends StatelessWidget {
  final String title;
  final String location;
  final String? selectedTitle;

  const LinkButton({
    super.key,
    required this.title,
    this.selectedTitle,
    required this.location,
  });

  Widget get selectedItem {
    if (selectedTitle == null) return Container();

    return Text(
      selectedTitle!,
      style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () => context.go(location),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selectedItem,
              const Icon(Icons.chevron_right),
            ],
          )
        ],
      ),
    );
  }
}
