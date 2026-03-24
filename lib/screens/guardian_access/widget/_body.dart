part of '../guardian_access.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Guardian Access'),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(12),

              // ─── Profile card ────────────────────────────────────
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 88.w,
                          height: 88.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.c.primary.main!,
                              width: 2.w,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x4DBF7EFF),
                                blurRadius: 30,
                                offset: Offset(0, 0),
                              ),
                              BoxShadow(
                                color: Color(0x8000F2FF),
                                blurRadius: 15,
                                offset: Offset(0, 0),
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('assets/pngs/Ellipse 1990.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -12.h,
                          child: Container(
                            padding: Space.all(8, 4),
                            decoration: BoxDecoration(
                              color: AppTheme.c.primary.main,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Text(
                              'Best Friend',
                              style: AppText.l2b?.cl(AppTheme.c.white!),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Space.yf(20),

                    Text('Sarah Jenkins', style: AppText.h5b),
                    Space.yf(2),
                    Text(
                      'Trusted since Oct 2023',
                      style: AppText.b1?.w(4).cl(AppTheme.c.text.main!),
                    ),
                  ],
                ),
              ),

              Space.yf(20),

              // ─── Safety Level ────────────────────────────────────
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Safety Level',
                          style: AppText.l1b?.w(6).cl(AppTheme.c.text.main!),
                        ),
                        Text('High Access', style: AppText.b1b),
                      ],
                    ),
                    Space.yf(10),
                    RoundedLinearProgress(
                      value: 0.85,
                      height: 6,
                      backgroundColor: AppTheme.c.lightGrey.main!,
                      valueColor: AppTheme.c.primary.main!,
                      gradient: UIProps.primaryGradient,
                    ),
                  ],
                ),
              ),

              Space.yf(16),

              Text(
                'Permissions',
                style: AppText.b1bm?.cl(AppTheme.c.text.main!),
              ),

              Space.yf(12),

              GlobalAccessTile(
                iconPath: 'assets/svgs/location_b.svg',
                iconBgColor: AppTheme.c.secondary.main!,
                label: 'Real-time GPS Location',
                description: 'Live position during active vybes',
                value: state.gpsLocation,
                onChanged: state.toggleGps,
              ),
              Space.yf(14),
              GlobalAccessTile(
                iconPath: 'assets/svgs/notification_b.svg',
                iconBgColor: AppTheme.c.primary.main!,
                label: 'SOS Alert Notifications',
                description: 'Receive critical emergency pings',
                value: state.sosAlerts,
                onChanged: state.toggleSos,
              ),
              Space.yf(14),
              GlobalAccessTile(
                iconPath: 'assets/svgs/battery-charging.svg',
                iconBgColor: AppTheme.c.white!,
                label: 'Battery Level Alerts',
                description: 'Notify when my phone is low',
                value: state.batteryAlerts,
                onChanged: state.toggleBattery,
              ),
              Space.yf(14),
              GlobalAccessTile(
                iconPath: 'assets/svgs/location-tick.svg',
                iconBgColor: AppTheme.c.secondary.shade700!,
                label: 'Venue Check-ins',
                description: "See where I've arrived safely",
                value: state.venueCheckIns,
                onChanged: state.toggleVenue,
              ),

              Space.yf(16),

              AppButton(
                label: 'Save Changes',
                onPressed: () {},
                hasShadow: true,
              ),

              Space.yf(12),

              AppButton(
                label: 'Remove Guardian',
                onPressed: () {},
                backgroundColor: AppTheme.c.accent.red!,
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