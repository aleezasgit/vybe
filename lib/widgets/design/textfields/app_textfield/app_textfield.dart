// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:vybe_app/configs/configs.dart';

// part 'enums.dart';

// class AppTextField extends StatefulWidget {
//   final String name;
//   final TextEditingController? controller;
//   final String? hint;
//   final bool? isPass;
//   final bool? enabled;
//   final double? width;
//   final String? label;
//   final String? helperText;
//   final String? topHelperIcon;
//   final String? labelHelperText;
//   final bool? autoFocus;
//   final FocusNode? node;
//   final bool readOnly;
//   final TextFieldType type;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final String? initialValue;
//   final TextInputType? textInputType;
//   final TextInputAction? textInputAction;
//   final TextCapitalization textCapitalization;
//   final String? errorText;
//   final String? Function(String?)? validator;
//   final void Function(String?)? onChanged;
//   final void Function()? onEditComplete;
//   final List<TextInputFormatter>? inputformatters;
//   final void Function()? onTap;
//   final int? maxLines;
//   final int? minLines;
//   final Color? fillColor;
//   final TextStyle? style;
//   final TextStyle? hintStyle;
//   final bool gradientOnFocusOnly;
//   final TextStyle? labelStyle;
//   final int? maxLength;
//   final bool onTapOutside;
//   final double? borderRadius;
//   final double? verticalPadding;
//   final double? horizontalPadding;

//   const AppTextField({
//     super.key,
//     required this.name,
//     this.node,
//     this.label,
//     this.controller,
//     this.enabled,
//     this.errorText,
//     this.autoFocus,
//     this.prefixIcon,
//     this.onChanged,
//     this.onEditComplete,
//     this.initialValue,
//     this.validator,
//     this.suffixIcon,
//     this.onTap,
//     this.hint,
//     this.readOnly = false,
//     this.isPass = false,
//     this.textInputType,
//     this.inputformatters,
//     this.width = double.infinity,
//     this.textInputAction = TextInputAction.done,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.maxLines,
//     this.minLines = 1,
//     this.type = TextFieldType.primary,
//     this.helperText,
//     this.topHelperIcon,
//     this.labelHelperText,
//     this.fillColor,
//     this.style,
//     this.hintStyle,
//     this.gradientOnFocusOnly = true,
//     this.labelStyle,
//     this.maxLength,
//     this.onTapOutside = true,
//     this.borderRadius,
//     this.verticalPadding,
//     this.horizontalPadding,
//   });

//   @override
//   State<AppTextField> createState() => AppTextFieldState();
// }

// class AppTextFieldState extends State<AppTextField> {
//   bool show = false;
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     show = widget.isPass ?? false;
//     _focusNode = widget.node ?? FocusNode();

//     _focusNode.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     if (widget.node == null) {
//       _focusNode.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     App.init(context);
//     ScreenUtil.init(context, designSize: const Size(375, 812));

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if ((widget.label != null &&
//                 widget.type == TextFieldType.withLableOnly) ||
//             widget.type == TextFieldType.withLabelAndIcon) ...[
//           Row(
//             children: [
//               Text(
//                 widget.label!,
//                 style: widget.labelStyle ?? AppText.l1b!.w(6),
//               ),
//               if (widget.labelHelperText != null) ...[
//                 Space.xf(4),
//                 Text(
//                   widget.labelHelperText!,
//                   style: AppText.b2bm!.cl(AppTheme.c.text.shade800!),
//                 ),
//               ],
//               if (widget.topHelperIcon != null) ...[
//                 Space.xf(4),
//                 SvgPicture.asset(
//                   widget.topHelperIcon!,
//                   width: 16.w,
//                   height: 16.h,
//                 ),
//               ],
//             ],
//           ),
//           Space.yf(4),
//         ],

//         /// ✅ Shadow Wrapper
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
//             border: _focusNode.hasFocus
//                 ? GradientBoxBorder(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.lerp(
//                           AppTheme.c.primaryGradient.startColor.withValues(
//                             alpha: 0.8,
//                           ),
//                           AppTheme.c.primaryGradient.endColor,
//                           0.5,
//                         )!,
//                         AppTheme.c.primaryGradient.endColor,
//                       ],
//                       stops: [0, 0.3],
//                     ),
//                     width: 1.w,
//                   )
//                 : null,
//             boxShadow: _focusNode.hasFocus
//                 ? [
//                     BoxShadow(
//                       color: const Color(0x305988F4), // #D5FE3E33
//                       blurRadius: 1,
//                       spreadRadius: 3,
//                       offset: const Offset(0, 0),
//                     ),
//                     BoxShadow(
//                       color: const Color(0x8F8E43EF), // #D5FE3E33
//                       blurRadius: 20.7,
//                       offset: const Offset(0, 0),
//                     ),
//                   ]
//                 : [],
//           ),
//           child: FormBuilderTextField(
//             name: widget.name,
//             controller: widget.controller,
//             focusNode: _focusNode,
//             maxLength: widget.maxLength,
//             minLines: widget.minLines,
//             maxLines: widget.maxLines ?? 1,
//             enabled: widget.enabled ?? true,
//             readOnly: widget.readOnly,
//             autofocus: widget.autoFocus ?? false,
//             keyboardType: widget.textInputType,
//             textInputAction: widget.textInputAction,
//             textCapitalization: widget.textCapitalization,
//             inputFormatters: widget.inputformatters,
//             initialValue: widget.initialValue,
//             obscureText: show,
//             style: widget.style ?? AppText.b1!.cl(AppTheme.c.text.shade800!),
//             cursorColor: AppTheme.c.secondary.main!,
//             onTap: widget.onTap,
//             onTapOutside: widget.onTapOutside
//                 ? (_) => FocusScope.of(context).unfocus()
//                 : null,
//             validator: widget.validator,
//             onChanged: widget.onChanged,
//             onEditingComplete: widget.onEditComplete,
//             decoration: InputDecoration(
//               errorText: widget.errorText,
//               hintText: widget.hint,
//               hintStyle:
//                   widget.hintStyle ?? AppText.b1!.cl(AppTheme.c.text.main!),
//               prefixIcon: widget.prefixIcon,
//               suffixIcon:
//                   widget.suffixIcon ??
//                   (widget.isPass == true
//                       ? IconButton(
//                           onPressed: () => setState(() => show = !show),
//                           icon: SvgPicture.asset(
//                             show
//                                 ? 'assets/svgs/eye-open.svg'
//                                 : 'assets/svgs/eye-disabled.svg',
//                             width: 16.w,
//                             height: 16.h,
//                             colorFilter: ColorFilter.mode(
//                               Color(0xFF989898),
//                               BlendMode.srcIn,
//                             ),
//                           ),
//                         )
//                       : null),
//               filled: true,
//               prefixIconConstraints: BoxConstraints(
//                 minWidth: 16.w,
//                 minHeight: 16.h,
//               ),
//               suffixIconConstraints: BoxConstraints(
//                 minWidth: 24.w,
//                 minHeight: 24.h,
//               ),
//               fillColor: (widget.fillColor ?? AppTheme.c.background.main),
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: widget.horizontalPadding ?? 16.w,
//                 vertical: widget.verticalPadding ?? 15.5.h,
//               ),

//               /// UNFOCUSED
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   widget.borderRadius ?? 16.r,
//                 ),
//                 borderSide: BorderSide(
//                   color: AppTheme.c.lightGrey.main!,
//                   width: 1,
//                 ),
//               ),

//               /// FOCUSED
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   widget.borderRadius ?? 16.r,
//                 ),
//                 borderSide: BorderSide(color: Colors.transparent, width: 0),
//               ),

//               /// ERROR
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   widget.borderRadius ?? 16.r,
//                 ),
//                 borderSide: BorderSide(
//                   color: AppTheme.c.error.main!,
//                   width: 1.w,
//                 ),
//               ),

//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                   widget.borderRadius ?? 16.r,
//                 ),
//                 borderSide: BorderSide(
//                   color: AppTheme.c.error.main!,
//                   width: 1.w,
//                 ),
//               ),
//             ),
//           ),
//         ),

//         if (widget.helperText != null) ...[
//           Space.yf(6),
//           Text(
//             widget.helperText!,
//             style: AppText.l2!.cl(AppTheme.c.text.main!),
//           ),
//         ],
//       ],
//     );
//   }
// }
