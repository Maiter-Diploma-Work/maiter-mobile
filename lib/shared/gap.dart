import 'package:flutter/widgets.dart';

class Gap extends StatelessWidget {
  final double verticalGap;
  final double horizontalGap;

  const Gap({
    super.key,
    required this.verticalGap,
    required this.horizontalGap,
  })  : assert(verticalGap >= 0),
        assert(horizontalGap >= 0);

  const Gap.cubic(double gap, {super.key})
      : assert(gap >= 0),
        verticalGap = gap,
        horizontalGap = gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalGap,
      width: horizontalGap,
    );
  }
}
