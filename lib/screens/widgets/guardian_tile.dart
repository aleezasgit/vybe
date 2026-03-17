import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/statics/app_statics.dart';

class GuardianTile extends StatelessWidget {
  final String name;
  final String relation;
  final String imagePath;
  final bool isActive;
  final VoidCallback onTap;

  const GuardianTile({
    super.key,
    required this.name,
    required this.relation,
    required this.imagePath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    // Active vs inactive styling
    final Color borderColor = isActive
        ? AppTheme.c.primary.main!
        : AppTheme.c.lightGrey.main!;

    final Color relationBorderColor = isActive
        ? AppTheme.c.primary.main!
        : AppTheme.c.lightGrey.main!;

    final Color relationTextColor = isActive
        ? AppTheme.c.primary.main!
        : AppTheme.c.text.main!;

    final Color dotColor = isActive
        ? AppTheme.c.accent.green!
        : AppTheme.c.text.main!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: Space.all(14),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
           color: AppTheme.c.lightGrey.main!,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            // ─── Avatar with status dot ───────────────────────────
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Avatar
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                     image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:AppTheme.c.lightGrey.main!,
                      width: 2.w,
                     
                    ),
                  ),
                 
                ),
            
                // Status dot
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.c.lightGrey.main!,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Space.xf(16),

            // ─── Name & relation tag ──────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppText.b1b?.w(6),
                  ),
                  Space.yf(4),

                  // Relation chip
                  Container(
                    padding: Space.all(8,4),
                  
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(
                        color: relationBorderColor,
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      relation,
                      style: AppText.l1?.w(6).cl(relationTextColor),
                    ),
                  ),
                ],
              ),
            ),

            // ─── Chevron ──────────────────────────────────────────
            SvgPicture.asset(
              AppStaticData.arrowRight,
              width: 23.w,
              height: 23.h,
            ),
          ],
        ),
      ),
    );
  }
}