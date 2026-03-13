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
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStaticData.appBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ─── App Bar ────────────────────────────────── ─────────
              // Padding(
              //   padding: Space.hf(24),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         onTap: () => Navigator.pop(context),
              //         child: SvgPicture.asset(
              //           AppStaticData.arrowLeft,
              //           width: 24.w,
              //           height: 24.w,
              //         ),
              //       ),
              //       Expanded(
              //         child: Center(
              //           child: Text(
              //             'Reward Detail',
              //             style: AppText.b1b,
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 24.w),
              //     ],
              //   ),
              // ),

              // Space.yf(16),

              // ─── Scrollable content ────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: Space.hf(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ─── Hero Image ──────────────────────────────
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          'assets/pngs/reward_1.png',
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Space.yf(16),

                      // ─── Venue & Title row ───────────────────────
                      Text(
                        'The Velvet Room',
                        style: AppText.l1?.cl(AppTheme.c.text.main!),
                      ),
                      Space.yf(6),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Free Entry Friday',
                              style: AppText.h4b,
                            ),
                          ),
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
                              '500 PTS',
                              style: AppText.l1b?.cl(AppTheme.c.white!),
                            ),
                          ),
                        ],
                      ),

                      Space.yf(24),

                      // ─── QR Code card ────────────────────────────
                      Container(
                        width: double.infinity,
                        padding: Space.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.c.background.main,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppTheme.c.lightGrey.main!,
                            width: 1.w,
                          ),
                        ),
                        child: Column(
                          children: [
                            // QR code image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset(
                                'assets/pngs/qr_code.png',
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),

                            Space.yf(14),

                            // Voucher ID
                            Text(
                              'Voucher ID: VYB-882-901',
                              style: AppText.l1?.cl(AppTheme.c.text.main!),
                            ),
                          ],
                        ),
                      ),

                      Space.yf(24),

                      // ─── How to Use ──────────────────────────────
                      Text(
                        'How to Use',
                        style: AppText.b1b,
                      ),

                      Space.yf(12),

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
                                      width: 20.w,
                                      height: 20.w,
                                    ),
                                    Space.xf(10),
                                    Expanded(
                                      child: Text(
                                        item['text']!,
                                        style: AppText.b2
                                            ?.cl(AppTheme.c.text.main!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),

                      Space.yf(28),

                      // ─── Confirm Button ──────────────────────────
                      AppButton(
                        label: 'Confirm Redemption',
                        onPressed: () {},
                        hasShadow: false,
                      ),

                      Space.yf(32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}