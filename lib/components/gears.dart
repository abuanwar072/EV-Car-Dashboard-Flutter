import 'package:flutter/material.dart';

import '../constants.dart';

class Gears extends StatefulWidget {
  const Gears({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  State<Gears> createState() => _GearsState();
}

class _GearsState extends State<Gears> {
  final List<String> gears = ["S", "D", "N", "R", "P"];
  int selectedGearIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth * 0.13,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            gears.length,
            (index) => Text(
              gears[index],
              style: TextStyle(
                color: selectedGearIndex == index
                    ? primaryColor
                    : Colors.white.withOpacity(0.16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
