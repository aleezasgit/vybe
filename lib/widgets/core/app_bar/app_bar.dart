import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/widgets/design/buttons/back_button.dart';

part 'enums.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType type;
  final String? title;
  final double? space;
  final double? verticalPadding;
  final VoidCallback? onBackPressed;
  final Widget? trailingWidget;
  final Widget? stepperWidget;
  final VoidCallback? onFilterTap;
  final Color? itemColor;
  final Color? iconColor;
  final bool hasLeadingIcon;
  const CustomAppBar({
    super.key,
    this.type = AppBarType.primary,
    this.title,
    this.space,
    this.onBackPressed,
    this.trailingWidget,
    this.verticalPadding,
    this.onFilterTap,
    this.itemColor,
    this.stepperWidget,
    this.iconColor,
    this.hasLeadingIcon = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return SafeArea(
      child: Padding(
        padding: Space.all(24, verticalPadding ?? 12),
        child: Row(
          children: [
            if (hasLeadingIcon &&
                type != AppBarType.textOnly &&
                type != AppBarType.textOnlyLeft &&
                !(type == AppBarType.withWidget && hasLeadingIcon == false))
              GestureDetector(
                onTap: onBackPressed ?? () => Navigator.pop(context),
                child: AppBackButton(),
              )
            else
              SizedBox.shrink(),

            if (type == AppBarType.withText && title != null) ...[
              Space.xf(space ?? 0),
              type == AppBarType.withText
                  ? Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title!,
                            style: AppText.h5b!
                                .cl(itemColor ?? AppTheme.c.text.shade800!)
                                .copyWith(height: 1.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Space.xf(16),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ] else if (type == AppBarType.withWidget && title != null) ...[
              (space != null) ? Space.xf(space!) : Space.xm!,
              Text(
                title!,
                style: AppText.h5b!
                    .cl(itemColor ?? AppTheme.c.text.shade800!)
                    .copyWith(height: 1.0),
              ),
              Space.xm!,

              trailingWidget ?? SizedBox.shrink(),
            ] else if (type == AppBarType.textOnly ||
                type == AppBarType.textOnlyLeft) ...[
              Expanded(
                child: Row(
                  mainAxisAlignment: type == AppBarType.textOnlyLeft
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? '',
                      style: AppText.h5b!
                          .cl(itemColor ?? AppTheme.c.text.shade800!)
                          .copyWith(height: 1.0),
                    ),
                  ],
                ),
              ),
            ] else if (type == AppBarType.withTextCenter) ...[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? '',
                      style: AppText.h5b!
                          .cl(itemColor ?? AppTheme.c.text.shade800!)
                          .copyWith(height: 1.0),
                    ),
                  ],
                ),
              ),
            ] else if (type == AppBarType.stepper) ...[
              Space.xf(space ?? 0),
              stepperWidget ?? SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }
}
