part of '../rewards.dart';

class _Body extends StatelessWidget {
  const _Body();

  static const List<Map<String, dynamic>> _rewards = [
    {
      'title': 'Free Entry Friday',
      'subtitle': 'The Velvet Room',
      'points': 500,
      'imagePath': 'assets/pngs/reward_1.png',
    },
    {
      'title': '2-for-1 Cocktails',
      'subtitle': 'Neon Garden',
      'points': 800,
      'imagePath': 'assets/pngs/reward_2.png',
    },
    {
      'title': 'VIP Booth Upgrade',
      'subtitle': 'Neon Garden',
      'points': 900,
      'imagePath': 'assets/pngs/reward_3.png',
    },
  ];

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
                Space.yf(24),

                // ─── Available Points ─────────────────────────────────
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Available Points',
                        style: AppText.b1?.cl(AppTheme.c.text.main!),
                      ),
                      Space.yf(8),
                      Text(
                        '2,450',
                        style: AppText.h1b,
                      ),
                      Space.yf(12),

                      // ─── Points chip ──────────────────────────────
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: AppTheme.c.primary.main!,
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/svgs/star.svg"
                            ,
                              width: 16.w,
                              height: 16.w,
                              colorFilter: ColorFilter.mode(
                                AppTheme.c.primary.main!,
                                BlendMode.srcIn,
                              ),
                            ),
                            Space.xf(6),
                            Text(
                              'Points',
                              style: AppText.l1bm?.cl(AppTheme.c.primary.main!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Space.yf(28),

                // ─── Earn Points Row ──────────────────────────────────
                Row(
                  children: [
                    _EarnCard(label: 'Check-In', points: '+50 pts'),
                    Space.xf(10),
                    _EarnCard(label: 'Review', points: '+100 pts'),
                    Space.xf(10),
                    _EarnCard(label: 'Upload', points: '+150 pts'),
                  ],
                ),

                Space.yf(28),

                // ─── Redeem Your Rewards ──────────────────────────────
                Text(
                  'Redeem Your Rewards',
                  style: AppText.b1b,
                ),

                Space.yf(14),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _rewards.length,
                  separatorBuilder: (_, __) => Space.yf(10),
                  itemBuilder: (context, index) {
                    final r = _rewards[index];
                    return _RewardTile(
                      title: r['title'],
                      subtitle: r['subtitle'],
                      points: r['points'],
                      imagePath: r['imagePath'],
                    );
                  },
                ),

                Space.yf(28),

                // ─── Redeem Button ────────────────────────────────────
                AppButton(
                  label: 'Redeem Points',
                  onPressed: () {},
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
// Earn Card
// ─────────────────────────────────────────────────────────────────────────────

class _EarnCard extends StatelessWidget {
  final String label;
  final String points;

  const _EarnCard({
    required this.label,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppTheme.c.lightGrey.main!,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppText.l1?.cl(AppTheme.c.text.main!),
            ),
            Space.yf(4),
            Text(
              points,
              style: AppText.b1b,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reward Tile
// ─────────────────────────────────────────────────────────────────────────────

class _RewardTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int points;
  final String imagePath;

  const _RewardTile({
    required this.title,
    required this.subtitle,
    required this.points,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(12),
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
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              imagePath,
              width: 58.w,
              height: 58.w,
              fit: BoxFit.cover,
            ),
          ),

          Space.xf(12),

          // Title & subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.b1b,
                ),
                Space.yf(4),
                Text(
                  subtitle,
                  style: AppText.l1?.cl(AppTheme.c.text.main!),
                ),
              ],
            ),
          ),

          Space.xf(10),

          // Points chip
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.main,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Text(
              '$points PTS',
              style: AppText.l1b?.cl(AppTheme.c.white!),
            ),
          ),
        ],
      ),
    );
  }
}