import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef DisplayTimerBuilder = Widget Function(
    String hours, String minutes, String seconds);

class DisplayTimer extends StatefulWidget {
  const DisplayTimer({
    super.key,
    required this.timerDuration,
    required this.displayTimerBuilder,
    this.onTimerEnd,
  });

  final Duration timerDuration;
  final DisplayTimerBuilder displayTimerBuilder;
  final AsyncCallback? onTimerEnd;

  @override
  State<DisplayTimer> createState() => _DisplayTimerState();
}

class _DisplayTimerState extends State<DisplayTimer> {
  late int timerDurationInSeconds = widget.timerDuration.inSeconds;
  late int hours = widget.timerDuration.inHours;

  int get hoursLeft => secondsLeft ~/ 3600;
  int get minutesLeft => (secondsLeft % 3600) ~/ 60;
  int secondsLeft = 0;
  int currentSeconds = 0;

  String get displayHours => hoursLeft.toString().padLeft(2, '0');
  String get displayMinutes => minutesLeft.toString().padLeft(2, '0');
  String get displaySeconds => (secondsLeft % 60).toString().padLeft(2, '0');

  void startPeriodicTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          currentSeconds = timer.tick;
          secondsLeft = timerDurationInSeconds - currentSeconds;
          if (timer.tick >= timerDurationInSeconds) {
            timer.cancel();

            if (widget.onTimerEnd != null) {
              widget.onTimerEnd!();
            }
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startPeriodicTimer();
  }

  @override
  Widget build(BuildContext context) {
    return widget.displayTimerBuilder(displayHours, displayMinutes, displaySeconds);
  }
}
