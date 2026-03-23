part of '../emergency_alert.dart';

class _Body extends StatelessWidget {
  const _Body();

  static const List<String> _guardianImages = [
    'assets/pngs/Ellipse 1990.png',
    'assets/pngs/Ellipse 1990.png',
    'assets/pngs/Ellipse 1990.png',
  ];

  static const int _extraGuardians = 1;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Emergency Alert'),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Space.yf(16),

              // ─── SOS PNG ─────────────────────────────────────────
              Image.asset(
                'assets/pngs/club.png',
                width: 220.w,
                height: 220.w,
              ),

              Space.yf(28),

              // ─── Need Help text ──────────────────────────────────
              Text('Need Help?', style: AppText.h5b?.w(4)),

              Space.yf(6),

              Text(
                'Your guardians will receive your location and a\nsafety alert immediately.',
                style: AppText.b1?.w(4).cl(AppTheme.c.text.main!),
                textAlign: TextAlign.center,
              ),

              Space.yf(16),

              // ─── Active Guardians tile ───────────────────────────
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
                    // Stacked avatars
                    _StackedAvatars(
                      imagePaths: _guardianImages,
                      extra: _extraGuardians,
                    ),

                    Space.xf(8),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Active Guardians', style: AppText.b1b),
                        Space.yf(2),
                        Text(
                          '4 Online',
                          style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Space.yf(16),

              // ─── Share live location toggle ──────────────────────
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
                    Expanded(
                      child: Text('Share live location', style: AppText.b1bm),
                    ),
                    VybeSwitch(
                      value: state.shareLiveLocation,
                      onChanged: state.toggleShareLocation,
                    ),
                  ],
                ),
              ),

              Space.yf(12),

              // ─── Send message to Guardian ────────────────────────
              _OptionTile(
                label: 'Send message to Guardian',
                onTap: () {},
              ),

              Space.yf(10),

              // ─── Call Emergency Service ──────────────────────────
              _OptionTile(
                label: 'Call Emergency Service',
                onTap: () {},
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
// Stacked Avatars
// ─────────────────────────────────────────────────────────────────────────────

class _StackedAvatars extends StatelessWidget {
  final List<String> imagePaths;
  final int extra;

  const _StackedAvatars({
    required this.imagePaths,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    const double avatarSize = 25;
    const double overlap = 20;
    final total = imagePaths.length;
    final width = avatarSize + (total - 1) * overlap + (extra > 0 ? overlap : 0);

    return SizedBox(
      width: width.w,
      height: avatarSize.w,
      child: Stack(
        children: [
          // Avatar images
          ...imagePaths.asMap().entries.map((e) {
            return Positioned(
              left: (e.key * overlap).w,
              child: _Avatar(imagePath: e.value, size: avatarSize),
            );
          }),

          // +N badge
          if (extra > 0)
            Positioned(
              left: (total * overlap).w,
              child: Container(
                width: avatarSize.w,
                height: avatarSize.w,
                decoration: BoxDecoration(
                  color:Color(0xFF1E293B),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.c.background.main!,
                    width: 1.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    '+$extra',
                    style: AppText.l2b?.cl(AppTheme.c.white!),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String imagePath;
  final double size;

  const _Avatar({required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppTheme.c.background.main!,
          width: 1.5.w,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Option Tile (no icon, arrow only)
// ─────────────────────────────────────────────────────────────────────────────

class _OptionTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OptionTile({required this.label, required this.onTap});

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
            Expanded(child: Text(label, style: AppText.b1bm)),
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