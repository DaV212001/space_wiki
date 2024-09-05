import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/animations.dart';

class EarthDistanceIndicator extends StatelessWidget {
  final double distanceInLightYears;
  final bool? isSolar;
  EarthDistanceIndicator(
      {Key? key, required this.distanceInLightYears, this.isSolar})
      : super(key: key);
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, 70),
        ),
      ],
    ),
  };
  @override
  Widget build(BuildContext context) {
    double MAX_DISTANCE = 1.0;
    return Row(
      children: [
        Text(
          'Distance from earth',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 2,
        ),
        if (isSolar!)
          Tooltip(
            message:
                '1 AU = Approx. 149.6 million km\n1 Light year = Approx. 9.461 trillion km',
            triggerMode: TooltipTriggerMode.tap,
            showDuration: Duration(seconds: 2),
            exitDuration: Duration(seconds: 2),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
            child: Icon(
              Icons.info_outline_rounded,
              color: Colors.white10,
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        Text(':'),
        SizedBox(width: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AnimatedProgressIndicator(
              isSolar: isSolar!,
              value: distanceInLightYears,
              maxDistance: MAX_DISTANCE,
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;
  final double maxDistance;
  final bool isSolar;
  const AnimatedProgressIndicator(
      {Key? key,
      required this.value,
      required this.maxDistance,
      required this.isSolar})
      : super(key: key);

  @override
  _AnimatedProgressIndicatorState createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animationText;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust duration as needed
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.value > 1
          ? widget.value < 10
              ? widget.value / 10
              : widget.value / 100
          : widget.value, // Value should be between 0 and 1
    ).animate(_controller);
    _animationText = Tween<double>(
      begin: 0,
      end: widget.value, // Value should be between 0 and 1
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double trueDistance = widget.value * widget.maxDistance;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '${_animationText.value.toStringAsFixed(2)}' +
                    (widget.isSolar ? ' AU' : " light years"),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LinearProgressIndicator(
              value: _animation.value,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        );
      },
    );
  }
}
