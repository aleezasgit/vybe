part of '../guardian_network.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Guardian Network',

      ),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space.yf(16),

                    /// ─── Active Guardians ─────────────────────────
                    _SectionLabel(text: 'Active Guardians'),
                    Space.yf(12),

                    /// Your existing Guardian Tile (use twice like SS)
                    GuardianTile(
                      name: 'Sarah Jenkins',
                      relation: 'Best Friend',
                      isActive: true,
                      imagePath: 'assets/pngs/Ellipse 1990.png',
                      onTap: () {
                        
                      },
                    ),

                    Space.yf(14),
                    GuardianTile(
                      name: 'Sarah Jenkins',
                      relation: 'Best Friend',
                      isActive: false,
                      imagePath: 'assets/pngs/Ellipse 1990.png',
                      onTap: () {
                        
                      },
                    ),

                    Space.yf(16),

                    /// ─── Permissions ──────────────────────────────
                    _SectionLabel(text: 'Permissions'),
                    Space.yf(12),

                    /// Share Location
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
                            height: 23.h,
                          ),
                          Space.xf(10),
                          Expanded(
                            child: Text(
                              'Share real-time location',
                              style: AppText.b1bm,
                            ),
                          ),
                          VybeSwitch(
                            value: state.shareLiveLocation,
                            onChanged: state.toggleShareLocation,
                          ),
                        ],
                      ),
                    ),

                    Space.yf(12),

                    /// SOS Notification
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
                            'assets/svgs/notification.svg',
                            width: 23.w,
                            height: 23.h,
                          ),
                          Space.xf(10),
                          Expanded(
                            child: Text(
                              'SOS Notification',
                              style: AppText.b1bm,
                            ),
                          ),
                          VybeSwitch(
                            value: state.sosEnabled,
                            onChanged: state.toggleSos,
                          ),
                        ],
                      ),
                    ),

                    Space.yf(16),

                    /// ─── Bottom Button ─────────────────────────────
               AppButton(
                label: 'Add new Guardian',
                onPressed: () {},
                iconPath: 'assets/svgs/user-add.svg',
                iconColor: AppTheme.c.white!,
                buttonType: ButtonType.primaryWithIconLeft,
                hasShadow: true,
              ),
                  ],
                ),
              ),
            ),

            
          
          ],
        ),
      ),
    );
  }
}


class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppText.b1bm?.w(5).cl(AppTheme.c.text.main!),
    );
  }
}
