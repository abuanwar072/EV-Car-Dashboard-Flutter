import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

import 'components/car_indicators.dart';
import 'components/current_speed.dart';
import 'components/gear_battery.dart';
import 'components/time_and_temp.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<double> speedLineOpacities = [1, 0.8, 0.6, 0.4, 0.3, 0.2, 0.15, 0.1];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: (size.width > 1184 && size.height > 604)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    constraints: const BoxConstraints(
                      minWidth: 1184,
                      maxWidth: 1480,
                      minHeight: 456,
                      maxHeight: 604,
                    ),
                    // alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: 2.59,
                      child: LayoutBuilder(
                        builder: (context, constraints) => CustomPaint(
                          painter: PathPainter(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TimeAndTemp(constraints: constraints),
                              Expanded(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        const CarIndicators(),
                                        const Spacer(),
                                        const CurrentSpeed(speed: 54),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/speed_miter.svg",
                                              height: 32,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Text(
                                                "100 km/H",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        color: const Color(
                                                            0xFF6B4339)),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        GearAndBattery(
                                            constraints: constraints),
                                      ],
                                    ),
                                    ...List.generate(
                                      speedLineOpacities.length,
                                      (index) => Positioned(
                                        bottom: 20 + (2 * index).toDouble(),
                                        left: constraints.maxWidth * 0.13 -
                                            (30 * index),
                                        height: constraints.maxHeight * 0.8,
                                        width: constraints.maxWidth * 0.31,
                                        child: Opacity(
                                          opacity: speedLineOpacities[index],
                                          child: CustomPaint(
                                            painter: SpeedLinePainter(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ...List.generate(
                                      speedLineOpacities.length,
                                      (index) => Positioned(
                                        bottom: 20 + (2 * index).toDouble(),
                                        right: constraints.maxWidth * 0.13 -
                                            (30 * index),
                                        height: constraints.maxHeight * 0.8,
                                        width: constraints.maxWidth * 0.31,
                                        child: Transform.scale(
                                          scaleX: -1,
                                          child: Opacity(
                                            opacity: speedLineOpacities[index],
                                            child: CustomPaint(
                                              painter: SpeedLinePainter(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                    "The screen is too small to display the UI \n It can't be viewed on a phone. Try resizing your browser if you are on the web."),
              ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      // ..color = Colors.red
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        // end: a,
        colors: [
          Color(0xFF6B4339),
          Color(0xFF52342C),
        ],
      ).createShader(const Offset(0, 0) & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    // paint.shader = LinearGradient(colors: colors)

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width * 0.13, size.height * 0.05);
    path.lineTo(size.width * 0.31, 0);
    path.lineTo(size.width * 0.39, size.height * 0.11);
    path.lineTo(size.width * 0.60, size.height * 0.11);
    path.lineTo(size.width * 0.69, 0);
    path.lineTo(size.width * 0.87, size.height * 0.05);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.87, size.height);
    path.lineTo(size.width * 0.13, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_0.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_0.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_0.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_0.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2325310, size.height * 0.1075232),
        Offset(size.width * 0.05690000, size.height * 0.3567081),
        [const Color(0xff6B4339).withOpacity(1), const Color(0xff8B7268)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_1.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_1.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_1.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_1.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.radial(
      const Offset(0, 0),
      size.width * 0.001769912,
      [
        const Color(0xffE2BDAD).withOpacity(0.85),
        const Color(0xffE2BDAD).withOpacity(0),
      ],
      [0, 1],
    );
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_2.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_2.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_2.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_2.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
        Offset(size.width * 1.251189, size.height * 1.259853),
        Offset(size.width * 0.1584545, size.height * 0.01942938), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff6B4339).withOpacity(0)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AverageMillagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.28, size.height * 0);
    path_0.lineTo(size.width, size.height * 0.00);
    path_0.lineTo(size.width * 0.295, size.height * 0.086);
    path_0.lineTo(size.width * 0.00, size.height * 0.98);
    path_0.lineTo(size.width * 0.28, size.height * 0.00);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9125874, size.height * -0.000008129217),
        Offset(size.width * 0.8369860, size.height * 1.762893), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff7D7472).withOpacity(0.79)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GearPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF52342C)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
    const double strokeWidth = 2;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.17, size.height * 0.5);
    path.lineTo(size.width * 0.34, size.height * 0.5);
    path.lineTo(size.width * 0.42, 0);
    path.lineTo(size.width * 0.48, 0);
    path.lineTo(size.width * 0.48, strokeWidth);
    path.lineTo(size.width * 0.42, strokeWidth);
    path.lineTo(size.width * 0.34, size.height * 0.5 + strokeWidth);
    path.lineTo(size.width * 0.17, size.height * 0.5 + strokeWidth);
    // path.moveTo(size.width * 0.52, 0);

    path.close();
    canvas.drawPath(path, paint);

    Path path2 = Path();
    path2.moveTo(size.width * 0.52, 0);
    path2.lineTo(size.width * 0.58, 0);
    path2.lineTo(size.width * 0.66, size.height * 0.5);
    path2.lineTo(size.width * 0.83, size.height * 0.5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width * 0.83, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.66, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.58, strokeWidth);
    path2.lineTo(size.width * 0.52, strokeWidth);

    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DashLinePainter extends CustomPainter {
  final double progress;

  DashLinePainter({required this.progress});

  final Paint _paint = Paint()
    ..color = const Color(0xFF52342C)
    ..strokeWidth = 10.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * progress, size.height / 2);

    Path dashPath = Path();

    double dashWidth = 24.0;
    double dashSpace = 2.0;
    double distance = 0.0;

    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(DashLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class SpeedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double stockWidth = 8;
    Path path_0 = Path()
      ..moveTo(size.width * 0.76, 0)
      ..lineTo(size.width, size.height * 0.30)
      ..lineTo(size.width - stockWidth, size.height * 0.30)
      ..close();

    Path path1 = Path()
      ..moveTo(size.width, size.height * 0.30)
      ..lineTo(40, size.height - 20)
      ..lineTo(size.width - stockWidth, size.height * 0.30)
      ..close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9125874, size.height * -0.000008129217),
        Offset(size.width * 0.8369860, size.height * 1.762893), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff7D7472).withOpacity(0.79)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
    canvas.drawPath(path1, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
