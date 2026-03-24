import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/statics/app_statics.dart';
import 'package:vybe_app/widgets/design/buttons/app_button/app_button.dart';

class ConfirmBottomSheets extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final String title;
  final String description;
  final String confirmLabel;
  final Color? confirmBgColor;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmBottomSheets({
    super.key,
    required this.iconPath,
    required this.iconBgColor,
    required this.title,
    required this.description,
    required this.confirmLabel,
    required this.onConfirm,
    this.confirmBgColor,
    this.onCancel,
  });

  static Future<void> show(
    BuildContext context, {
    required String iconPath,
    required Color iconBgColor,
    required String title,
    required String description,
    required String confirmLabel,
    required VoidCallback onConfirm,
    Color? confirmBgColor,
    VoidCallback? onCancel,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ConfirmBottomSheets(
        iconPath: iconPath,
        iconBgColor: iconBgColor,
        title: title,
        description: description,
        confirmLabel: confirmLabel,
        onConfirm: onConfirm,
        confirmBgColor: confirmBgColor,
        onCancel: onCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: Space.hf(24),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Drag Handle
             Container(
              width: 38.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: AppTheme.c.white,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),

            Space.yf(24),

            // ─── Close button ────────────────────────────────────
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onCancel ?? () => Navigator.pop(context),
                child:SvgPicture.asset( 
                  AppStaticData.close,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),

            Space.yf(16),
            Container(
              width: double.infinity,
              height: 1.h,
              color: AppTheme.c.lightGrey.main,
            ),
            Space.yf(16),

            // ─── Icon circle ─────────────────────────────────────
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 24.w,
                  height: 24.w,
                 
                ),
              ),
            ),

            Space.yf(20),

            // ─── Title ───────────────────────────────────────────
            Text(
              title,
              style: AppText.h5bm,
              textAlign: TextAlign.center,
            ),

            Space.yf(8),

            // ─── Description ─────────────────────────────────────
            Text(
              description,
              style: AppText.b1?.w(4).cl(AppTheme.c.text.main!),
              textAlign: TextAlign.center,
            ),

            Space.yf(24),

            // ─── Confirm button ──────────────────────────────────
            AppButton(
              label: confirmLabel,
              onPressed: onConfirm,
              backgroundColor: confirmBgColor,
              hasShadow: true,
            ),


         
          ],
        ),
      ),
    );
  }
}