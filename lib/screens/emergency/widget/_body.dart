part of '../emergency.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: ''),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: Space.hf(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Shield PNG ─────────────────────────────────────
                Image.asset(
                  'assets/pngs/Group 2085662702.png',
                  width: 200.w,
                  height: 200.w,
                ),

                Space.yf(24),

                // ── Title ──────────────────────────────────────────
                Text(
                  'Emergency Services',
                  style: AppText.h3b?.w(4).cl(AppTheme.c.white!),
                ),

                Space.yf(12),

                // ── Timer ──────────────────────────────────────────
                Text(
                  '00:08',
                  style: AppText.h4bm?.w(4).cl(AppTheme.c.text.main!),
                ),

                Space.yf(64),

                // ── Action buttons: row 1 ──────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ActionButton(
                      iconPath: 'assets/svgs/Container.svg',
                      label: 'Mute',
                      onTap: state.toggleMute,
                    ),
                    Space.xf(48),
                    _ActionButton(
                      iconPath: 'assets/svgs/Container (1).svg',
                      label: 'Keypad',
                      onTap: () {},
                    ),
                  ],
                ),

                Space.yf(32),

                // ── Action buttons: row 2 ──────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ActionButton(
                      iconPath: 'assets/svgs/Container (2).svg',
                      label: 'Speaker',
                      isActive: state.isSpeaker,
                      onTap: state.toggleSpeaker,
                    ),
                    Space.xf(48),
                    _ActionButton(
                      iconPath: 'assets/svgs/Container (3).svg',
                      label: 'Add Guardian',
                      onTap: () {},
                    ),
                  ],
                ),

                Space.yf(64),

                // ── End Call button ────────────────────────────────
                AppButton(
                  label: 'End Call',
                  onPressed: () {},
                  backgroundColor: AppTheme.c.accent.red!,
                  iconPath: 'assets/svgs/Container (4).svg',
                  iconColor: AppTheme.c.white!,
                  buttonType: ButtonType.primaryWithIconLeft,
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
// Action Button
// ─────────────────────────────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ActionButton({
    required this.iconPath,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: AppTheme.c.background.main,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.c.lightGrey.main!,
                width: 1.w,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
          Space.yf(8),
          Text(
            label,
            style: AppText.l1bm?.cl(AppTheme.c.text.main!),
          ),
        ],
      ),
    );
  }
}