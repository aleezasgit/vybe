part of '../profile.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    App.init(context);
    

    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStaticData.appBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: Space.hf(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(12),

                // ─── User Card ───────────────────────────────────────
                const _UserCard(),

                Space.yf(16),

                // ─── Unlock Premium Banner ───────────────────────────
                const _PremiumBanner(),

                Space.yf(24),

                // ─── Menu Items ──────────────────────────────────────
                _OptionTile(
                  iconPath: 'assets/svgs/user-edit.svg',
                  label: 'Edit Profile',
                  onTap: () {},
                ),
                Space.yf(10),
                _OptionTile(
                  iconPath: 'assets/svgs/setting-2.svg',
                  label: 'Settings',
                  onTap: () {
                    AppRoutes.settings.push(context);
                  },
                ),
                Space.yf(10),
                _OptionTile(
                  iconPath: 'assets/svgs/forward-item.svg',
                  label: 'Rewards',
                  onTap: () {},
                ),
                Space.yf(10),
                _OptionTile(
                  iconPath: 'assets/svgs/mirror.svg',
                  label: 'Support',
                  onTap: () {
                    // AppRoutes.support.push(context);
                  },
                ),
                Space.yf(10),
                _OptionTile(
                  iconPath: 'assets/svgs/message-question.svg',
                  label: "FAQ's",
                  onTap: () {
                    AppRoutes.faq.push(context);
                  },
                ),

                Space.yf(28),

                // ─── Delete Account ──────────────────────────────────
                AppButton(
                  label: 'Delete Account',
                  onPressed: () {
                    ConfirmBottomSheet.show(
  context,
  iconPath: 'assets/svgs/trash.svg',
  iconBgColor: AppTheme.c.error.main!,
  title: 'Are you sure?',
  description: 'Do you really want to delete your account?',
  confirmLabel: 'Delete',
  confirmBgColor: AppTheme.c.error.main,
  onConfirm: () { /* delete logic */ },
);
                  },
                  backgroundColor: AppTheme.c.error.main,
                  iconPath: 'assets/svgs/trash.svg',
                  iconColor: AppTheme.c.white,
                  buttonType: ButtonType.primaryWithIconLeft,
                  hasShadow: false,
                ),

                Space.yf(12),

                // ─── Logout ──────────────────────────────────────────
                AppButton(
                
                  label: 'Logout',
                  hasShadow: true,
                  onPressed: () {
                    ConfirmBottomSheet.show(
  context,
  iconPath: 'assets/svgs/logout.svg',
  iconBgColor: AppTheme.c.primary.main!,
  title: 'Are you sure?',
  description: 'Do you really want to logout to your account?',
  confirmLabel: 'Log Out',
  onConfirm: () { /* logout logic */ },
);
                  },
                  buttonType: ButtonType.primaryWithIconLeft,
                  iconPath: 'assets/svgs/logout.svg',
                  iconColor: AppTheme.c.white,
                 
                ),

                Space.yf(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// User Card
// ─────────────────────────────────────────────────────────────────────────────

class _UserCard extends StatelessWidget {
  const _UserCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(12),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(65.r),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 42.w,
            height: 42.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/pngs/Ellipse 1990.png',
              fit: BoxFit.cover,
            ),
          ),

          Space.xf(12),

          // Name & Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eoin Morgan',
                  style: AppText.b1b?.cl(AppTheme.c.white!),
                ),
                Space.yf(2),
                Text(
                  'eoinmorgan224@gmail.com',
                  style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Premium Banner
// ─────────────────────────────────────────────────────────────────────────────

class _PremiumBanner extends StatelessWidget {
  const _PremiumBanner();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: Space.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65.r),
          gradient: UIProps.primaryGradient
        ),
        child: Row(
          children: [
            // Crown icon circle
            Container(
              width: 42.w,
              height: 42.h,
              decoration: BoxDecoration(
                color: AppTheme.c.background.main,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/crown.svg',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),

            Space.xf(10),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unlock Premium',
                    style: AppText.b1bm!.cl(AppTheme.c.black!),
                  ),
                  Space.yf(2),
                  Text(
                    'You enjoy everything with premium.',
                    style: AppText.l1?.w(4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Option Tile
// ─────────────────────────────────────────────────────────────────────────────

class _OptionTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  const _OptionTile({
    required this.iconPath,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: Space.all(15),
        decoration: BoxDecoration(
          color:Color( 0xFF050815),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppTheme.c.lightGrey.main!,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            // Leading icon
            SvgPicture.asset(
              iconPath,
              width: 23.w,
              height: 23.h,
            ),

            Space.xf(10),

            // Label
            Expanded(
              child: Text(
                label,
                style: AppText.b1,
              ),
            ),

            // Trailing chevron
            SvgPicture.asset(
              AppStaticData.arrowRight,
              width: 23.w,
              height: 23.h,
            ),
          ],
        ),
      ),
    );
  }
}