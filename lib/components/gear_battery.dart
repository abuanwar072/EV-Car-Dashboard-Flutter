import 'package:flutter/material.dart';

import '../dashboard.dart';
import 'gears.dart';

class GearAndBattery extends StatelessWidget {
  const GearAndBattery({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blueGrey.withOpacity(0.15),
      width: constraints.maxWidth * 0.74,
      height: constraints.maxHeight * 0.22,
      child: LayoutBuilder(
        builder: (context, gearConstraints) => Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: GearPrinter(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Gears(),
                  Text.rich(
                    TextSpan(
                      text: "Rest. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                      children: const [
                        TextSpan(
                          text: "465km",
                          style: TextStyle(
                            color: Color(0xFF77C000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: gearConstraints.maxWidth * 0.72,
                      child: Row(
                        children: [
                          Text(
                            "E",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.16),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 8,
                              child: ClipPath(
                                clipper: BatteryStatusCliper(),
                                child: CustomPaint(
                                  painter: DashLinePainter(progress: 1),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "100%",
                              style: TextStyle(
                                color: Color(0xFF77C000),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: gearConstraints.maxHeight * 0.10,
              left: gearConstraints.maxWidth * 0.16,
              width: gearConstraints.maxWidth * 0.17,
              height: gearConstraints.maxHeight * 0.38,
              child: CustomPaint(
                painter: AvgWattPerKmPrinter(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: gearConstraints.maxWidth * 0.025),
                    Text(
                      "Avg. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                    Text(
                      "11.3 w/km",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: gearConstraints.maxHeight * 0.10,
              right: gearConstraints.maxWidth * 0.16,
              width: gearConstraints.maxWidth * 0.17,
              height: gearConstraints.maxHeight * 0.38,
              child: CustomPaint(
                painter: OdoPrinter(),
                child: Row(
                  children: [
                    Text(
                      "ODO. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                    Text(
                      "6666.6km",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatteryStatusCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.05, 0)
      ..lineTo(size.width * 0.95, 0)
      ..lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AvgWattPerKmPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF6B4339)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
    const double strokeWidth = 4;
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.27, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.27, strokeWidth);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OdoPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF6B4339)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
    const double strokeWidth = 4;
    Path path = Path()
      ..lineTo(size.width * 0.73, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.73, strokeWidth);
    // ..lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
