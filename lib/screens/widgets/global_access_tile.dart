import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/screens/widgets/switch.dart';


class GlobalAccessTile extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? iconcolor;

  const GlobalAccessTile({
    super.key,
    required this.iconPath,
    required this.iconBgColor,
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
    required, this.iconcolor
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      width: double.infinity,
      padding: Space.all(15),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Row(
        children: [
          // Icon circle
          Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                colorFilter: ColorFilter.mode(
                  iconcolor ?? AppTheme.c.black!,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

          Space.xf(10),

          // Label + description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppText.b1bm),
                Space.yf(2),
                Text(
                  description,
                  style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                ),
              ],
            ),
          ),

          //Space.xf(20),

          VybeSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}