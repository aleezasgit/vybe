

 part of '../data_visibility.dart';


// // ─────────────────────────────────────────────────────────────────────────────
// // HELPERS
// // ─────────────────────────────────────────────────────────────────────────────

String _mapPrivacyToString(ProfilePrivacy privacy) {
  switch (privacy) {
    case ProfilePrivacy.everyone:
      return 'Everyone';
    case ProfilePrivacy.friends:
      return 'Friends';
    case ProfilePrivacy.onlyMe:
      return 'Only me';
  }
}

ProfilePrivacy _mapStringToPrivacy(String value) {
  switch (value) {
    case 'Everyone':
      return ProfilePrivacy.everyone;
    case 'Friends':
      return ProfilePrivacy.friends;
    case 'Only me':
      return ProfilePrivacy.onlyMe;
    default:
      return ProfilePrivacy.everyone;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION LABEL
// ─────────────────────────────────────────────────────────────────────────────

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

// ─────────────────────────────────────────────────────────────────────────────
// TOGGLE CARD
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
      padding: Space.all(12, 20),
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
          Row(
            children: [
              Expanded(child: Text(label, style: AppText.b1bm)),
              VybeSwitch(value: value, onChanged: onChanged),
            ],
          ),
          Space.yf(6),
          Text(
            description,
            style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
          ),
        ],
      ),
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Data Visibility'),
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

              // ─── Profile Privacy ─────────────────────────────────
              _SectionLabel(text: 'Profile Privacy'),
              Space.yf(12),

              _StyledRadioTile(
                label: 'Everyone',
                value: ProfilePrivacy.everyone,
                groupValue: state.selectedPrivacy,
                onTap: () =>
                    state.selectPrivacy(ProfilePrivacy.everyone),
              ),

              Space.yf(12),

              _StyledRadioTile(
                label: 'Friends',
                value: ProfilePrivacy.friends,
                groupValue: state.selectedPrivacy,
                onTap: () =>
                    state.selectPrivacy(ProfilePrivacy.friends),
              ),

              Space.yf(12),

              _StyledRadioTile(
                label: 'Only me',
                value: ProfilePrivacy.onlyMe,
                groupValue: state.selectedPrivacy,
                onTap: () =>
                    state.selectPrivacy(ProfilePrivacy.onlyMe),
              ),

              Space.yf(16),

              // ─── Public Presence (2) ─────────────────────────────
              _SectionLabel(text: 'Public Presence'),
              Space.yf(12),

              _ToggleCard(
                label: 'Show when I am online',
                description:
                    "Allow your friends to see when you're active on Vybe. You won't be able to see their status if this is off.",
                value: state.showWhenOnline,
                onChanged: state.toggleShowWhenOnline,
              ),

              Space.yf(32),
            ],
          ),
        ),
      ),
    );
  }
}

class _StyledRadioTile extends StatelessWidget {
  final String label;
  final ProfilePrivacy value;
  final ProfilePrivacy groupValue;
  final VoidCallback onTap;

  const _StyledRadioTile({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: Space.all(14, 16),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(22.r),
          
        ),
        child: Row(
          children: [
            // Radio Circle
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22.r,
              height: 22.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppTheme.c.primary.main
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.c.primary.main!
                      : AppTheme.c.lightGrey.main!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: BoxDecoration(
                          color: AppTheme.c.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),

            Space.xf(12),

            Text(
              label,
              style: AppText.b1!.cl(AppTheme.c.white!),
            ),
          ],
        ),
      ),
    );
  }
}