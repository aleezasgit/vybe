import 'package:flutter/material.dart';
import 'package:vybe_app/configs/configs.dart';

class SeeAllHeading extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool hasHorizontalPadding;
  final double? fontSize;
  final Color? titleTextColor;
  final String? seeAllText;
  final int? fontWeight;
  final bool isTiltleOnly;
  final Color? seeAllTextColor;
  const SeeAllHeading({
    super.key,
    required this.title,
    this.onTap,
    this.hasHorizontalPadding = false,
    this.fontSize,
    this.seeAllText,
    this.titleTextColor,
    this.fontWeight,
    this.isTiltleOnly = false,
    this.seeAllTextColor,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Padding(
      padding: hasHorizontalPadding ? Space.hf(24) : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: isTiltleOnly
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppText.h5bm!
                .w(fontWeight ?? 5)
                .copyWith(
                  fontSize: fontSize,
                  letterSpacing: 0,
                  color: titleTextColor ?? AppTheme.c.text.shade800,
                ),
          ),
          if (!isTiltleOnly)
            GestureDetector(
              onTap: onTap,
              child: Text(
                seeAllText ?? 'See all',
                style: AppText.b2!
                    .cl(seeAllTextColor ?? AppTheme.c.text.main!)
                    .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: seeAllTextColor ?? AppTheme.c.text.main!,
                      height: 1.5,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
