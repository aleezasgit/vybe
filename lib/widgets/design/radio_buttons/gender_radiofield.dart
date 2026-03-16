import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vybe_app/configs/configs.dart';

class GenderRadioField extends StatelessWidget {
  const GenderRadioField({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      initialValue: 'male',
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Gender',
              style: AppText.l1b!.w(6).cl(AppTheme.c.text.shade800!),
            ),
            Space.yf(12),
            Row(
              children: [
                _GenderOption(
                  label: 'Male',
                  iconPath: 'assets/svgs/male.svg',
                  value: 'male',
                  groupValue: field.value,
                  onTap: () => field.didChange('male'),
                ),
                Space.xf(24),
                _GenderOption(
                  label: 'Female',
                  iconPath: 'assets/svgs/female.svg',
                  value: 'female',
                  groupValue: field.value,
                  onTap: () => field.didChange('female'),
                ),
              ],
            ),
            if (field.hasError) ...[
              Space.yf(6),
              Text(field.errorText ?? '', style: AppText.l1b?.cl(Colors.red)),
            ],
          ],
        );
      },
    );
  }
}

// ─── Single Gender Option ─────────────────────────────────────────────────────

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.iconPath,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  final String label;
  final String iconPath;
  final String value;
  final String? groupValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Radio circle ──────────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 20.r,
            height: 20.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? AppTheme.c.primary.main
                  : AppTheme.c.background.shade100,
              border: Border.all(
                color: isSelected
                    ? AppTheme.c.primary.main ?? Colors.purple
                    : AppTheme.c.lightGrey.main!,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.c.black,
                      ),
                    ),
                  )
                : null,
          ),
          Space.xf(6),

          // ── Label ─────────────────────────────────────────────
          Text(
            label,
            style: AppText.h5?.cl(AppTheme.c.text.shade800 ?? Colors.white),
          ),
          Space.xf(6),

          // ── Icon ──────────────────────────────────────────────
          SvgPicture.asset(iconPath, width: 18.w, height: 18.h),
        ],
      ),
    );
  }
}
