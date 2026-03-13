part of '../rewards.dart';

class _Body extends StatelessWidget {
  const _Body();

  static const List<Map<String, dynamic>> _rewards = [
    {
      'title': 'Free Entry Friday',
      'subtitle': 'The Velvet Room',
      'points': 500,
      'imagePath': 'assets/pngs/Ellipse 1990.png',
    },
    {
      'title': '2-for-1 Cocktails',
      'subtitle': 'Neon Garden',
      'points': 800,
      'imagePath': 'assets/pngs/Ellipse 1990.png',
    },
    {
      'title': 'VIP Booth Upgrade',
      'subtitle': 'Neon Garden',
      'points': 900,
      'imagePath': 'assets/pngs/Ellipse 1990.png',
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
                Space.yf(16),

                // ─── Available Points ─────────────────────────────────
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Available Points',
                        style: AppText.h5?.w(4).cl(AppTheme.c.text.main!),
                      ),
                      Space.yf(5),
                      Text(
                        '2,450',
                        style: AppText.h1b,
                      ),
                      Space.yf(5),

                      // ─── Points chip ──────────────────────────────
                      Container(
                        padding:Space.all(17,10)
                        ,
                        decoration: BoxDecoration(
                          color: AppTheme.c.background.main,
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: AppTheme.c.lightGrey.main!,
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("assets/svgs/star.svg"
                            ,
                              width: 18.w,
                              height: 18.w,
                            
                            ),
                            Space.xf(5),
                            Text(
                              'Points',
                              style: AppText.l1?.w(4).cl(AppTheme.c.primary.main!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Space.yf(16),

                // ─── Earn Points Row ──────────────────────────────────
                Row(
                  children: [
                    _EarnCard(label: 'Check-In', points: '+50 pts'),
                    Space.xf(11),
                    _EarnCard(label: 'Review', points: '+100 pts'),
                    Space.xf(11),
                    _EarnCard(label: 'Upload', points: '+150 pts'),
                  ],
                ),

                Space.yf(14),

                // ─── Redeem Your Rewards ──────────────────────────────
                Text(
                  'Redeem Your Rewards',
                  style: AppText.b1b?.w(6),
                ),

                Space.yf(8),

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

                Space.yf(16),

                // ─── Redeem Button ────────────────────────────────────
                AppButton(
                  label: 'Redeem Points',
                  onPressed: () {},
                  hasShadow: false,

                  backgroundColor: AppTheme.c.primary.main,
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
          borderRadius: BorderRadius.circular(12.r),
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
              style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
            ),
            Space.yf(8),
            Text(
              points,
              style: AppText.h5?.w(4),
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
      padding: Space.all(7),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppTheme.c.lightGrey.main!,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              imagePath,
              width: 57.w,
              height: 57.w,
              fit: BoxFit.cover,
            ),
          ),

          Space.xf(8),

          // Title & subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.b1b?.w(6),
                ),
                Space.yf(3),
                Text(
                  subtitle,
                  style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                ),
              ],
            ),
          ),

          Space.xf(16),

          // Points chip
          Container(
            padding:Space.all(12,7),
            
            decoration: BoxDecoration(
              color: AppTheme.c.primary.main,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              '$points PTS',
              style: AppText.l1bm?.cl(AppTheme.c.white!),
            ),
          ),
        ],
      ),
    );
  }
}