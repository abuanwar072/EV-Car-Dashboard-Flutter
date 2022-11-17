import 'package:flutter/material.dart';

class Gears extends StatefulWidget {
  const Gears({
    Key? key,
    this.gears = const ["S", "D", "N", "R", "P"],
  }) : super(key: key);

  final List<String> gears;

  @override
  State<Gears> createState() => _GearsState();
}

class _GearsState extends State<Gears> {
  int selectedGearIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.gears.length,
                (index) => Text(
                  widget.gears[index],
                  style: TextStyle(
                    color: index == selectedGearIndex
                        ? const Color(0xFF6D453A)
                        : Colors.white.withOpacity(0.16),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}