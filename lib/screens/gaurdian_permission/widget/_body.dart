part of '../guardian_permissions.dart';

class _Body extends StatelessWidget {
  const _Body();

  static final List<Map<String, dynamic>> _guardians = [
    {
      'name': 'Sarah Jenkins',
      'imagePath': 'assets/pngs/Ellipse 1990.png',
      'isActive': true,
      'tags': [_PermTag.location, _PermTag.sos],
    },
    {
      'name': 'Sarah Jenkins',
      'imagePath': 'assets/pngs/Ellipse 1990.png',
      'isActive': false,
      'tags': <_PermTag>[],
    },
    {
      'name': 'Sarah Jenkins',
      'imagePath': 'assets/pngs/Ellipse 1990.png',
      'isActive': false,
      'tags': [_PermTag.history, _PermTag.location],
    },
  ];

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Guardian Permissions'),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),

              // ─── Public Presence ─────────────────────────────────
              _SectionLabel(text: 'Public Presence'),
              Space.yf(12),

              _ToggleCard(
                label: 'Show me as active at venues',
                description:
                    'When enabled, other users currently at the same club can see you on the heat map and venue guest list.',
                value: state.showAsActive,
                onChanged: state.toggleShowAsActive,
              ),

              Space.yf(16),

              // ─── Global Default Access ───────────────────────────
              _SectionLabel(text: 'Global Default Access'),
              Space.yf(12),

              GlobalAccessTile(
                iconPath: 'assets/svgs/call.svg',
                iconBgColor: AppTheme.c.primary.main!,
                label: 'Live Location',
                description: 'Share real-time GPS coordinates',
                value: state.liveLocation,
                onChanged: state.toggleLiveLocation,
              ),
              Space.yf(12),
              GlobalAccessTile(
                iconPath: 'assets/svgs/direct-inbox.svg',
                iconBgColor: AppTheme.c.secondary.main!,
                label: 'Automatic SOS',
                description: 'Notify if safety timer expires',
                value: state.automaticSos,
                onChanged: state.toggleAutomaticSos,
              ),
              Space.yf(12),
              GlobalAccessTile(
                iconPath: 'assets/svgs/global.svg',
                iconBgColor: AppTheme.c.background.shade100!,
                label: 'Nightlife History',
                description: 'Share recently visited venues',
                value: state.nightlifeHistory,
                onChanged: state.toggleNightlifeHistory,
              ),

              Space.yf(16),

              // ─── Individual Guardian Access ──────────────────────
              _SectionLabel(text: 'Individual Guardian Access'),
             Space.yf(12),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _guardians.length,
                separatorBuilder: (_, __) => Space.yf(14),
                itemBuilder: (context, index) {
                  final g = _guardians[index];
                  final tags = g['tags'] as List<_PermTag>;
                  return _GuardianPermTile(
                    name: g['name'],
                    imagePath: g['imagePath'],
                    isActive: g['isActive'],
                    tags: tags,
                    onTap: () {},
                  );
                },
              ),

             // Space.yf(32),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Label
// ─────────────────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppText.b1bm?.w(5).cl(AppTheme.c.text.main!));
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Toggle Card
// ─────────────────────────────────────────────────────────────────────────────

class _ToggleCard extends StatelessWidget {
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleCard({
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Space.all(12,20),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: AppText.b1bm)),
              VybeSwitch(value: value, onChanged: onChanged),
            ],
          ),
          Space.yf(6),
          Text(description, style: AppText.l1?.w(4).cl(AppTheme.c.text.main!)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Permission Tag enum
// ─────────────────────────────────────────────────────────────────────────────

enum _PermTag { location, sos, history }

extension _PermTagExt on _PermTag {
  String get label {
    switch (this) {
      case _PermTag.location: return 'Location';
      case _PermTag.sos:      return 'SOS';
      case _PermTag.history:  return 'History';
    }
  }

  Color get color {
    switch (this) {
      case _PermTag.location: return  AppTheme.c.secondary.main!; // secondary.main
      case _PermTag.sos:      return  AppTheme.c.primary.main!; // accent.red
      case _PermTag.history:  return AppTheme.c.primary.main!;// primary.main
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Guardian Permission Tile
// ─────────────────────────────────────────────────────────────────────────────

class _GuardianPermTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isActive;
  final List<_PermTag> tags;
  final VoidCallback onTap;

  const _GuardianPermTile({
    required this.name,
    required this.imagePath,
    required this.isActive,
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dotColor = isActive
        ? AppTheme.c.accent.green!
        : AppTheme.c.text.main!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: Space.all(14,16.5),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
        ),
        child: Row(
          children: [
            // Avatar + dot
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.c.lightGrey.main!,
                      width: 2.w,
                    ),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.c.background.main!,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Space.xf(16),

            // Name + tags
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppText.b1b?.w(6)),
                  Space.yf(4),
                  tags.isEmpty
                      ? _TagChip(
                          label: 'No custom access',
                          color: AppTheme.c.text.main!,
                        )
                      : Wrap(
                          spacing: 4.w,
                          children: tags
                              .map((t) => _TagChip(
                                    label: t.label,
                                    color: t.color,
                                  ))
                              .toList(),
                        ),
                ],
              ),
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

// ─────────────────────────────────────────────────────────────────────────────
// Tag Chip
// ─────────────────────────────────────────────────────────────────────────────

class _TagChip extends StatelessWidget {
  final String label;
  final Color color;

  const _TagChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(8, 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(45.r),
        border: Border.all(color: color, width: 1.w),
      ),
      child: Text(label, style: AppText.l1b?.w(6).cl(color)),
    );
  }
}