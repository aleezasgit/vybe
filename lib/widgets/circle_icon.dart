import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vybe_app/configs/configs.dart';

class CircleIcon extends StatelessWidget {
  final String iconPath;
  const CircleIcon({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        gradient: UIProps.primaryGradient,
        shape: BoxShape.circle,
      ),
      alignment: AlignmentGeometry.center,
      child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
    );
  }
}
