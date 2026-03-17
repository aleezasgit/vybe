part of '../rewards_detail.dart';

class _Body extends StatelessWidget {
  const _Body();

  static const List<Map<String, String>> _howToUse = [
    {'text': 'Show this QR Code to the staff at the entrance upon arrival'},
    {'text': 'The offer is valid for 1 person and must be used before 2pm'},
  ];

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Reward Detail'),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),

              // ─── Hero Image ──────────────────────────────────────
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/pngs/Frame 2147229325.png',
                  width: 327.w,
                  height: 260.h,
                  fit: BoxFit.cover,
                ),
              ),

              Space.yf(16),

              // ─── Venue & Title row ───────────────────────────────
              Text(
                'The Velvet Room',
                style: AppText.l1bm?.cl(AppTheme.c.text.main!),
              ),
              Space.yf(6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Free Entry Friday',
                      style: AppText.h4b?.w(4),
                    ),
                  ),
                  Container(
                    padding: Space.all(12, 7),
                    decoration: BoxDecoration(
                      color: AppTheme.c.primary.main,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      '500 PTS',
                      style: AppText.l1bm?.cl(AppTheme.c.white!),
                    ),
                  ),
                ],
              ),

              Space.yf(16),

              // ─── QR Code card ────────────────────────────────────
              Container(
                width: double.infinity,
                padding: Space.all(23.5, 18),
                decoration: BoxDecoration(
                  color: AppTheme.c.background.main,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppTheme.c.background.main!,
                    width: 1.w,
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        'assets/pngs/QR Code (1).png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Space.yf(14),
                    Text(
                      'Voucher ID: VYB-882-901',
                      style: AppText.b1!.s(15.sp).w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
              ),

              Space.yf(16),

              // ─── How to Use ──────────────────────────────────────
              Text('How to Use', style: AppText.b1?.w(4)),

              Space.yf(8),

              Column(
                children: _howToUse
                    .map(
                      (item) => Padding(
                        padding: Space.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppStaticData.checked,
                              width: 18.w,
                              height: 18.h,
                            ),
                            Space.xf(8),
                            Expanded(
                              child: Text(
                                item['text']!,
                                style: AppText.l1
                                    ?.w(4)
                                    .cl(AppTheme.c.text.main!),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),

              Space.yf(28),

              // ─── Confirm Button ──────────────────────────────────
              AppButton(
                label: 'Confirm Redemption',
                onPressed: () {},
                hasShadow: false,
              ),

              Space.yf(16),
            ],
          ),
        ),
      ),
    );
  }
}