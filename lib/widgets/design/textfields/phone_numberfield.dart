// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:referral_app/configs/configs.dart';

// class PhoneCountry {
//   final String flag; // emoji flag
//   final String code; // country code

//   const PhoneCountry({required this.flag, required this.code});
// }

// class AppPhoneNumberField extends StatefulWidget {
//   final String countryFieldName;
//   final String numberFieldName;
//   final double? margin;
//   final String? hint;

//   const AppPhoneNumberField({
//     super.key,
//     required this.countryFieldName,
//     required this.numberFieldName,
//     this.margin,
//     this.hint,
//   });

//   @override
//   State<AppPhoneNumberField> createState() => _AppPhoneNumberFieldState();
// }

// class _AppPhoneNumberFieldState extends State<AppPhoneNumberField> {
//   late FocusNode _focusNode;

//   final countries = const [
//     PhoneCountry(flag: 'assets/pngs/USA.png', code: '+1'),
//     PhoneCountry(flag: 'assets/pngs/UK.png', code: '+44'),
//     PhoneCountry(flag: 'assets/pngs/pak.png', code: '+92'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();

//     _focusNode.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isFocused = _focusNode.hasFocus;

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(80.r),

//         /// ✅ SAME SHADOW AS AppTextField
//         boxShadow: isFocused
//             ? [
//                 const BoxShadow(
//                   color: Color(0x33D5FE3E),
//                   blurRadius: 1,
//                   spreadRadius: 3,
//                   offset: Offset(0, 0),
//                 ),
//               ]
//             : [],
//       ),
//       child: Container(
//         height: 52.h,
//         padding: Space.hf(16),
//         decoration: BoxDecoration(
//           color: AppTheme.c.white,
//           borderRadius: BorderRadius.circular(80.r),
//           border: Border.all(
//             color: isFocused
//                 ? AppTheme.c.secondary.main!
//                 : AppTheme.c.lightGrey.main!,
//             width: 1.w,
//           ),
//         ),
//         child: Row(
//           children: [
//             /// Country Dropdown
//             Expanded(
//               flex: 2,
//               child: FormBuilderDropdown<PhoneCountry>(
//                 name: widget.countryFieldName,
//                 initialValue: countries.first,
//                 icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   isDense: true,
//                 ),
//                 iconSize: 20.sp,
//                 iconDisabledColor: AppTheme.c.text.main,
//                 iconEnabledColor: AppTheme.c.text.main,
//                 items: countries.map((country) {
//                   return DropdownMenuItem(
//                     value: country,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 16.w,
//                           height: 16.h,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(country.flag),
//                               fit: BoxFit.cover,
//                             ),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         Space.xf(4),
//                         Text(
//                           country.code,
//                           style: AppText.b1!.cl(AppTheme.c.text.main!),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             Space.xf(4),

//             /// Phone Number Field
//             Expanded(
//               flex: 7,
//               child: FormBuilderTextField(
//                 name: widget.numberFieldName,
//                 focusNode: _focusNode,
//                 keyboardType: TextInputType.phone,
//                 style: AppText.b1!.cl(AppTheme.c.text.shade800!),
//                 decoration: InputDecoration(
//                   hintText: widget.hint ?? '54848-484',
//                   hintStyle: AppText.b1!.cl(AppTheme.c.text.shade800!),
//                   border: InputBorder.none,
//                   isDense: true,
//                   contentPadding: Space.vf(12),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
