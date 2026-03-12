import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/statics/app_statics.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool includeTopPadding;
  final bool includeBottomPadding;

  const AppBackground({
    super.key,
    required this.child,
    this.horizontalPadding,
    this.verticalPadding,
    this.includeTopPadding = false, // default: false
    this.includeBottomPadding = true,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final mediaPadding = MediaQuery.of(context).padding;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage ?? AppStaticData.appBg),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(
        left: horizontalPadding ?? 24.w,
        right: horizontalPadding ?? 24.w,
        top:
            (verticalPadding ?? 0) +
            (includeTopPadding ? mediaPadding.top + 16.h : 0),
        bottom:
            (verticalPadding ?? 0) +
            (includeBottomPadding ? mediaPadding.bottom : 0),
      ),
      child: child,
    );
  }
}
