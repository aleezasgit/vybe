part of '../data_privacy.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Data & Privacy'),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),

              // ─── Privacy Shield Banner ───────────────────────────
              Container(
                width: double.infinity,
                padding: Space.all(14),
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
                      height: 42.w,
                      decoration: BoxDecoration(
                        gradient: UIProps.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svgs/shield-tick.svg',
                          width: 20.w,
                          height: 20.w,
                 
                       
                        ),
                      ),
                    ),
                    Space.xf(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Privacy Shield Active',
                          style: AppText.b1bm?.cl(AppTheme.c.white!),
                        ),
                        Space.yf(2),
                        Text(
                          'Your nightlife activity is encrypted',
                          style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Space.yf(16),

              // ─── Personal Data ───────────────────────────────────
              Text(
                'Personal Data',
                style: AppText.b1bm?.w(5).cl(AppTheme.c.text.main!),
              ),

              Space.yf(12),

              _OptionTile(
                iconPath: 'assets/svgs/user.svg',
                label: 'Account Info',
                onTap: () {},
              ),
              Space.yf(12),
              _OptionTile(
                iconPath: 'assets/svgs/user-edit.svg',
                label: 'Edit Profile',
                onTap: () {},
              ),

              Space.yf(16),

              // ─── Privacy Controls ────────────────────────────────
              Text(
                'Privacy Controls',
                style: AppText.b1bm?.w(5).cl(AppTheme.c.text.main!),
              ),

              Space.yf(12),

              // Live Location — toggle tile
              Container(
                width: double.infinity,
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
                    SvgPicture.asset(
                      'assets/svgs/location.svg',
                      width: 23.w,
                      height: 23.w,
                    ),
                    Space.xf(10),
                    Expanded(
                      child: Text(
                        'Live Location Sharing',
                        style: AppText.b1bm,
                      ),
                    ),
                    VybeSwitch(
                      value: state.liveLocationSharing,
                      onChanged: state.toggleLiveLocation,
                    ),
                  ],
                ),
              ),

              Space.yf(12),

              _OptionTile(
                iconPath: 'assets/svgs/eye.svg',
                label: 'Data Visibility',
                onTap: () {},
              ),
              Space.yf(12),
              _OptionTile(
                iconPath: 'assets/svgs/shield-security.svg',
                label: 'Guardian Permissions',
                onTap: () {},
              ),

              Space.yf(16),

              // ─── Delete Account ──────────────────────────────────
              AppButton(
                label: 'Delete Account',
                onPressed: () {},
                backgroundColor: AppTheme.c.accent.red!,
                iconPath: 'assets/svgs/trash.svg',
                iconColor: AppTheme.c.white!,
                buttonType: ButtonType.primaryWithIconLeft,
                hasShadow: false,
              ),

              Space.yf(12),

              // ─── Download my data ────────────────────────────────
              AppButton(
                label: 'Download my data',
                onPressed: () {},
                iconPath: 'assets/svgs/document-download.svg',
                iconColor: AppTheme.c.white!,
                buttonType: ButtonType.primaryWithIconLeft,
                hasShadow: false,
              ),

              Space.yf(32),
            ],
          ),
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

  const _OptionTile({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
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
            SvgPicture.asset(
              iconPath,
              width: 23.w,
              height: 23.h,
            ),
            Space.xf(10),
            Expanded(
              child: Text(label, style: AppText.b1),
            ),
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