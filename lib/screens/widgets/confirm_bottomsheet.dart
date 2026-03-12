import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/statics/app_statics.dart';
import 'package:vybe_app/widgets/design/buttons/app_button/app_button.dart';

class ConfirmBottomSheet extends StatelessWidget {
  /// Icon asset path (SVG)
  final String iconPath;

  /// Background color of the icon circle
  final Color iconBgColor;

  /// Bold title e.g. "Are you sure?"
  final String title;

  /// Subtitle/description text
  final String description;

  /// Confirm button label e.g. "Log Out" / "Delete"
  final String confirmLabel;

  /// Confirm button background color (overrides gradient)
  final Color? confirmBgColor;

  /// Called when confirm button is tapped
  final VoidCallback onConfirm;

  /// Called when cancel is tapped (defaults to Navigator.pop)
  final VoidCallback? onCancel;

  const ConfirmBottomSheet({
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

  /// Convenience static method to show the sheet
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
      builder: (_) => ConfirmBottomSheet(
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
            Space.yf(8),

            // ─── Drag handle ─────────────────────────────────────
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

            Space.yf(12),

            // ─── Cancel button ───────────────────────────────────
            AppButton(
              label: 'Cancel',
              onPressed: onCancel ?? () => Navigator.pop(context),
              buttonType: ButtonType.outlined,
              hasShadow: false,
            ),

            Space.yf(24),
          ],
        ),
      ),
    );
  }
}