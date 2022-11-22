import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class TimeAndTem extends StatelessWidget {
  const TimeAndTem({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth * 0.21,
      height: constraints.maxHeight * 0.11,
      child: Row(
        children: [
          const Text("05:21 PM"),
          const Spacer(),
          SvgPicture.asset(
            "assets/icons/sun.svg",
            height: 32,
          ),
          const SizedBox(width: defaultPadding / 4),
          const Text("18 °C")
        ],
      ),
    );
  }
}
