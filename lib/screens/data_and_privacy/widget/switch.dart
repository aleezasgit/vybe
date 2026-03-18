import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vybe_app/configs/configs.dart';

/// A reusable switch widget that matches the Vybe design system.
///
/// Wraps [Switch] in a small scale transform and applies the app's
/// color tokens and outline behavior.
class VybeSwitch extends StatelessWidget {
  const VybeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.scale = 0.8,
    this.width = 44,
    this.height = 24,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final double scale;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: AppTheme.c.primary.main,
          inactiveThumbColor: AppTheme.c.background.shade100,
          inactiveTrackColor: AppTheme.c.background.main,
          trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return 0; // no outline when selected
            }
            return 0.95;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent; // no outline when selected
            }
            return AppTheme.c.lightGrey.main;
          }),
        ),
      ),
    );
  }
}
