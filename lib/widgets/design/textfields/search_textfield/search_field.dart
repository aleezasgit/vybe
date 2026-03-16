import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vybe_app/configs/configs.dart';

part 'enums.dart';

class SearchField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final String? errorText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputformatters;
  final SearchFieldType type;
  final VoidCallback? onTapAdd;
  final Color? textColor;
  final Color? fillColor;
  final Color? iconColor;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasShadow;

  const SearchField({
    super.key,
    this.controller,
    this.enabled,
    this.initialValue,
    this.suffixIcon,
    required this.name,
    this.hint,
    this.readOnly = false,
    this.textInputType,
    this.inputformatters,
    this.errorText,
    this.validator,
    this.type = SearchFieldType.primary,
    this.onTapAdd,
    this.textColor,
    this.fillColor,
    this.iconColor,
    this.borderRadius,
    this.borderColor,
    this.hasShadow = false,
  });

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(375, 812));

    final textColor = widget.textColor ?? AppTheme.c.text.shade800!;

    return IgnorePointer(
      ignoring: widget.enabled == false || widget.readOnly,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 80.r),
          boxShadow: _focusNode.hasFocus
              ? [
                  BoxShadow(
                    color: const Color(0x33D5FE3E), // #D5FE3E33
                    blurRadius: 1,
                    spreadRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ]
              : [],
        ),
        child: FormBuilderTextField(
          controller: widget.controller,
          inputFormatters: widget.inputformatters,
          focusNode: _focusNode,
          style: AppText.b1!.copyWith(color: textColor),
          cursorColor: textColor,
          enabled: widget.enabled ?? true,
          initialValue: widget.initialValue,
          name: widget.name,
          keyboardType: widget.textInputType,
          readOnly: widget.readOnly,
          onTapOutside: (_) {
            _focusNode.unfocus();
          },
          decoration: InputDecoration(
            errorText: widget.errorText,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 8.w),
              child:
                  widget.suffixIcon ??
                  SvgPicture.asset(
                    'assets/svgs/search.svg',
                    width: 16.w,
                    height: 16.h,
                    colorFilter: ColorFilter.mode(
                      widget.iconColor ?? AppTheme.c.text.shade800!,
                      BlendMode.srcIn,
                    ),
                  ),
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 16.w,
              minHeight: 16.h,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 16.w,
              minHeight: 16.h,
            ),
            filled: true,
            fillColor: widget.fillColor ?? AppTheme.c.white,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 15.5.h,
            ),
            hintText: widget.hint ?? 'Search',
            hintStyle: AppText.b1!.cl(textColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 80.r),
              borderSide: BorderSide(
                width: 1.w,
                color: widget.borderColor ?? AppTheme.c.lightGrey.main!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 80.r),
              borderSide: BorderSide(
                width: 1.w,
                color: widget.borderColor ?? AppTheme.c.secondary.main!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 80.r),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.5),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.5),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                width: AppDimensions.normalize(0.75),
                color: AppTheme.c.white!,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
