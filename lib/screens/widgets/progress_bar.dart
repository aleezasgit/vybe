import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedLinearProgress extends StatelessWidget {
  final double value;
  final double height;
  final Color backgroundColor;
  final Color valueColor;
  final Gradient? gradient;
  final double borderRadius;
  final Duration duration;

  const RoundedLinearProgress({
    super.key,
    required this.value,
    this.height = 7,
    required this.backgroundColor,
    required this.valueColor,
    this.gradient,
    this.borderRadius = 40,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final progressWidth = value.clamp(0.0, 1.0) * totalWidth;

        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius.r),
          child: Container(
            height: height,
            color: backgroundColor,
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: duration,
              curve: Curves.easeInOut,
              width: progressWidth,
              decoration: BoxDecoration(
                color: gradient == null ? valueColor : null,
                gradient: gradient,
                borderRadius: BorderRadius.circular(borderRadius.r),
              ),
            ),
          ),
        );
      },
    );
  }
}