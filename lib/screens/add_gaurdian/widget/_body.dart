part of '../add_new_guardian.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add New Guardian',
      ),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: true,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Space.yf(16),

                    /// ─── Avatar + Tick ─────────────────────────
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 96.w,
                          height: 96.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.c.primary.main!,
                                AppTheme.c.primary.shade300!,
                              ],
                            ),
                            boxShadow:UIProps.buttonShadow,
                          ),
                      
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/pngs/Ellipse 1990.png'),
                          ),
                        ),
                        Positioned(
                          bottom: -4,
                          right: 24,
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: Color(0xFF22C55E),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.c.black!,
                                width: 4,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svgs/tick.svg',
                                width: 6.w,
                                height: 6.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Space.yf(16),

                    /// Name
                    Text(
                      'Sarah Jenkins',
                      style: AppText.h5b
                      ,
                    ),

                   // Space.yf(4),

                    Text(
                      'Selected from your contacts',
                      style:
                          AppText.b1?.cl(AppTheme.c.text.main!),
                    ),

                    Space.yf(16),

                    /// ─── Relationship ─────────────────────────
                    _SectionLabel(text: 'Relationship'),
                    Space.yf(16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _RelationChip(
                              label: 'Best Friend',
                              value: RelationshipType.bestFriend,
                              selected: state.selectedRelation,
                              onTap: state.selectRelation,
                            ),
                           Space.xf(10),
                            _RelationChip(
                              label: 'Family',
                              value: RelationshipType.family,
                              selected: state.selectedRelation,
                              onTap: state.selectRelation,
                            ),
                            SizedBox(width: 10.w),
                            _RelationChip(
                              label: 'Partner',
                              value: RelationshipType.partner,
                              selected: state.selectedRelation,
                              onTap: state.selectRelation,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            _RelationChip(
                              label: 'Colleague',
                              value: RelationshipType.colleague,
                              selected: state.selectedRelation,
                              onTap: state.selectRelation,
                            ),
                          ],
                        ),
                      ],
                    ),

                    Space.yf(16),

                    /// ─── Permissions ─────────────────────────
                    _SectionLabel(text: 'Set Permissions'),
                    Space.yf(12),

                    GlobalAccessTile(
                      iconPath: 'assets/svgs/location_b.svg',
                      iconBgColor: AppTheme.c.secondary.main!,
                      label: 'Share Live Location',
                      description: 'Only while in Nightlife mode',
                      value: state.shareLocation,
                      onChanged: state.toggleLocation,
                    ),

                    Space.yf(12),

                    GlobalAccessTile(
                      iconPath: 'assets/svgs/notification_b.svg',
                      iconBgColor: AppTheme.c.primary.main!,
                      label: 'Receive SOS Alerts',
                      description: 'Immediate push notifications',
                      value: state.sosAlerts,
                      onChanged: state.toggleSos,
                    ),

                    Space.yf(12),

                    GlobalAccessTile(
                      iconPath: 'assets/svgs/battery-charging.svg',
                      iconBgColor: AppTheme.c.white!,
                     // iconcolor: AppTheme.c.black!,
                      label: 'See Nightlife History',
                      description: 'Past events and safe arrivals',
                      value: state.nightlifeHistory,
                      onChanged: state.toggleHistory,
                    ),

                    Space.yf(16),
                  ],
                ),
              ),
            ),

            /// ─── Button ─────────────────────────
           AppButton(
  label: 'Confirm Guardian',
  onPressed: () {
    ConfirmBottomSheets.show(
      context,
      iconPath: 'assets/svgs/checkk.svg',
      iconBgColor: AppTheme.c.primary.main!, // purple circle
      title: 'Guardian Added Successfully!',
      description:
          "We've sent an invitation to join your network.\nThey’ll appear as active once they accept.",
      confirmLabel: 'Continue',
      onConfirm: () {
        Navigator.pop(context); // close sheet
      },
    );
  },
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppText.b1bm?.w(5).cl(AppTheme.c.text.main!),
      ),
    );
  }
}

class _RelationChip extends StatelessWidget {
  final String label;
  final RelationshipType value;
  final RelationshipType selected;
  final Function(RelationshipType) onTap;

  const _RelationChip({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == value;

    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        padding: Space.all(18, 10),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            width: 1.w,
            color: AppTheme.c.lightGrey.main!,
          ),
        ),
        child: Text(
          label,
          style: AppText.l1?.w(4).cl( AppTheme.c.white!),
        ),
      ),
    );
  }
}