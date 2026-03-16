import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vybe_app/configs/configs.dart';

part 'content.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      body: navItems[_currentIndex].screen,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      height: 72.h + bottomPadding,
      padding: Space.hf(22).copyWith(bottom: bottomPadding, top: 8.h),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        border: Border(
          top: BorderSide(color: AppTheme.c.lightGrey.main!, width: 1.w),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A64748B),
            blurRadius: 64.7,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(navItems.length, (index) {
          final isSelected = _currentIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            behavior: HitTestBehavior.translucent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// ICON / PROFILE
                SvgPicture.asset(
                  navItems[index].icon,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? AppTheme.c.text.shade800!
                        : AppTheme.c.text.main!,
                    BlendMode.srcIn,
                  ),
                ),

                Space.yf(4),

                /// LABEL
                Text(
                  navItems[index].label,
                  style: AppText.l1!.copyWith(
                    color: isSelected
                        ? AppTheme.c.text.shade800!
                        : AppTheme.c.text.main!,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),

                Space.yf(4),

                /// SELECTION DOT
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 6.h,
                  width: 6.h,
                  decoration: BoxDecoration(
                    gradient: isSelected ? UIProps.primaryGradient : null,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
