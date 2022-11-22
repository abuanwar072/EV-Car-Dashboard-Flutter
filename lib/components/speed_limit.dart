import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SpeedLimit extends StatelessWidget {
  const SpeedLimit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/speed_miter.svg",
          height: 32,
        ),
        const SizedBox(width: defaultPadding / 2),
        Text(
          "100 km/H",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: primaryColor),
        )
      ],
    );
  }
}
