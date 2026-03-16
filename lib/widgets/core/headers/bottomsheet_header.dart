// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:referral_app/configs/configs.dart';

// class BottomsheetHeader extends StatelessWidget {
//   final String? title;
//   final bool hasBackAction;
//   final VoidCallback? onBackPressed;
//   const BottomsheetHeader({
//     super.key,
//     this.title,
//     this.hasBackAction = false,
//     this.onBackPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     App.init(context);
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: hasBackAction
//               ? MainAxisAlignment.start
//               : MainAxisAlignment.spaceBetween,
//           children: [
//             if (hasBackAction) ...[
//               GestureDetector(
//                 onTap: onBackPressed ?? () => Navigator.pop(context),
//                 child: SvgPicture.asset(
//                   AppStaticData.backArrow,
//                   width: 20.w,
//                   height: 20.h,
//                 ),
//               ),
//               Space.xf(10),
//             ],
//             if (title != null)
//               Text(title!, style: AppText.h5b!.w(6).copyWith(height: 1.0)),
//             if (title == null || hasBackAction) Space.xm!,
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: SvgPicture.asset(
//                 AppStaticData.cross,
//                 width: 20.w,
//                 height: 20.h,
//               ),
//             ),
//           ],
//         ),

//         Space.yf(16),
//         Container(
//           width: double.infinity,
//           height: 1.h,
//           color: AppTheme.c.lightGrey.main,
//         ),
//       ],
//     );
//   }
// }
