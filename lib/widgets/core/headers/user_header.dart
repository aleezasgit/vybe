import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/statics/app_statics.dart';

enum UserHeaderType { primary, agent }

class UserHeader extends StatelessWidget {
  final UserHeaderType type;
  final VoidCallback? onTapNotifications;
  final VoidCallback? onTapSearch;
  final VoidCallback? onTapFilter;
  const UserHeader({
    super.key,
    this.type = UserHeaderType.primary,
    this.onTapNotifications,
    this.onTapSearch,
    this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: Space.all(2),
          decoration: BoxDecoration(
            borderRadius: UIProps.buttonRadius,
            color: AppTheme.c.white!,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppStaticData.logo,
                width: 38.87.w,
                height: 38.87.h,
              ),
              Space.xf(13.3),
              Text('Hello, Anderson', style: AppText.b1bm!),
              Space.xf(20),
            ],
          ),
        ),

        Space.xm!,
        if (type == UserHeaderType.primary) ...[
          _buildCircleAvatar(
            'assets/svgs/bell.svg',
            onTapNotifications ??
                () {
                  // AppRoutes.notification.push(context);
                },
          ),

          Space.xf(6),
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/pngs/pp.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ] else if (type == UserHeaderType.agent) ...[
          _buildCircleAvatar(
            'assets/svgs/setting-4.svg',
            onTapFilter ?? () {},
            iconSize: 20.sp,
          ),
        ],
      ],
    );
  }

  Widget _buildCircleAvatar(
    String assetPath,
    VoidCallback onTap, {
    double? iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: CircleAvatar(
        radius: 21.5.r,
        backgroundColor: AppTheme.c.white!,
        child: SvgPicture.asset(
          assetPath,
          width: iconSize ?? 24.w,
          height: iconSize ?? 24.h,
        ),
      ),
    );
  }
}
