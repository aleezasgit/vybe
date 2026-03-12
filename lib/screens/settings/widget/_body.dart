part of '../settings.dart';

class _body extends StatelessWidget {
  const _body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

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

                // ─── Toggle Tiles ────────────────────────────────────
                _ToggleTile(
                  label: 'Share location',
                  value: state.shareLocation,
                  onChanged: state.toggleShareLocation,
                ),
                Space.yf(12),
                _ToggleTile(
                  label: 'Ghoost Check-in mode',
                  value: state.ghostCheckInMode,
                  onChanged: state.toggleGhostCheckIn,
                ),

                Space.yf(12),

                // ─── Arrow Tiles ─────────────────────────────────────
                _OptionTile(
                  label: 'Vybe Guardian Network',
                  onTap: () {},
                ),
                Space.yf(12),
                _OptionTile(
                  label: 'Send Emergency Alert',
                  onTap: () {},
                ),
                Space.yf(12),
                _OptionTile(
                  label: 'Privacy Policy',
                  onTap: () {},
                ),
                Space.yf(12),
                _OptionTile(
                  label: 'Data Management',
                  onTap: () {},
                ),

                Space.yf(16),

                // ─── Delete Account ──────────────────────────────────
                AppButton(
                  label: 'Delete Account',
                  onPressed: () {},
                  backgroundColor: AppTheme.c.error.main,
                  iconPath: 'assets/svgs/trash.svg',
                  iconColor: AppTheme.c.white,
                  buttonType: ButtonType.primaryWithIconLeft,
                  hasShadow: true,
                ),

                Space.yf(12),

                // ─── Logout ──────────────────────────────────────────
                AppButton(
                  label: 'Logout',
                  onPressed: () {},
                  buttonType: ButtonType.primaryWithIconLeft,
                  iconPath: 'assets/svgs/logout.svg',
                  iconColor: AppTheme.c.white,
                  hasShadow: false,
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
// User Card (with Edit button)
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

          Space.xf(10),

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

          Space.xf(40),

          // Edit Button
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: Space.all(16, 7),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.c.primary.shade500!,
                    AppTheme.c.primary.main!,
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Edit',
                style: AppText.l1bm?.cl(AppTheme.c.white!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Toggle Tile
// ─────────────────────────────────────────────────────────────────────────────

class _ToggleTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Text(
              label,
              style: AppText.b1bm,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.c.white,
            activeTrackColor: AppTheme.c.primary.main,
            inactiveThumbColor: AppTheme.c.background.shade100,
            inactiveTrackColor: AppTheme.c.background.main,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Option Tile (arrow, no icon)
// ─────────────────────────────────────────────────────────────────────────────

class _OptionTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OptionTile({
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
            Expanded(
              child: Text(
                label,
                style: AppText.b1,
              ),
            ),
            SvgPicture.asset(
              AppStaticData.arrowRight,
              width: 23.w,
              height: 23.w,
            ),
          ],
        ),
      ),
    );
  }
}