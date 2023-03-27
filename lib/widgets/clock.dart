// package to create analog clock

import 'package:flutter/material.dart';
import 'package:flutterend/presentation/responsive/responsive_config.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
// building the app widgets
  Widget build(BuildContext context) => SizedBox(
    height: Responsive.isMobile(context) ? 65 : 100,
    //  width: 100,
    child: DigitalClock(
      digitAnimationStyle: Curves.elasticOut,
      is24HourTimeFormat: false,
      areaDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      hourMinuteDigitTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 50,
      ),
      amPmDigitTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
