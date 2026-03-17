part of '../support.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Support'),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(24),

            _SupportTile(
              iconPath: 'assets/svgs/call.svg',
              iconBgColor: AppTheme.c.primary.main!,
              title: 'Phone number',
              subtitle: '00-123-456-789',
              onTap: () {},
            ),
            Space.yf(12),
            _SupportTile(
              iconPath: 'assets/svgs/direct-inbox.svg',
              iconBgColor: AppTheme.c.secondary.main!,
              title: 'Email Address',
              subtitle: 'info@gmail.com',
              onTap: () {},
            ),
            Space.yf(12),
            _SupportTile(
              iconPath: 'assets/svgs/global.svg',
              iconBgColor: AppTheme.c.background.shade400!,
              title: 'Website',
              subtitle: 'www.website.com',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Support Tile
// ─────────────────────────────────────────────────────────────────────────────

class _SupportTile extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportTile({
    required this.iconPath,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(15),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppTheme.c.lightGrey.main!,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                    AppTheme.c.white!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Space.xf(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.b1bm),
                Space.yf(2),
                Text(
                  subtitle,
                  style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}