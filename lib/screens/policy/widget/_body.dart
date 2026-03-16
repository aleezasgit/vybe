part of '../policy.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
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
              CustomAppBar(title: 'Privacy Policy'),

              Expanded(
                child: SingleChildScrollView(
                  padding: Space.hf(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.yf(20),

                      // ── 1. Information We Collect ──────────────────
                      _SectionTitle(text: '1. Information We Collect'),
                      Space.yf(8),
                      _BodyText(
                        text:
                            'Vybe may collect certain information to provide and improve your experience on the app. This includes basic account details such as your name, username, email address, profile photo, optional age, and personal preferences like music type, venue type, and budget.',
                      ),

                      Space.yf(20),

                      // ── 2. How We Use Your Information ────────────
                      _SectionTitle(text: '2. How We Use Your Information'),
                      Space.yf(8),
                      _BodyText(text: 'We use your data to:'),
                      Space.yf(10),
                      _CheckItem(text: 'Provide real-time crowd insights'),
                      _CheckItem(text: 'Personalize venue recommendations'),
                      _CheckItem(text: 'Improve AI-powered suggestions'),
                      _CheckItem(text: 'Reward points and track check-ins'),
                      _CheckItem(text: 'Prevent fraud and misuse'),

                      Space.yf(20),

                      // ── 3. Location Privacy ────────────────────────
                      _SectionTitle(text: '3. Location Privacy'),
                      Space.yf(8),
                      _BodyText(text: 'Location sharing is optional. You can:'),
                      Space.yf(10),
                      _CheckItem(text: 'Enable live sharing'),
                      _CheckItem(text: 'Share anonymously'),
                      _CheckItem(text: 'Disable location access at any time'),
                      Space.yf(10),
                      _BodyText(
                        text:
                            'We do not store precise location data long-term without consent.',
                      ),

                      Space.yf(20),

                      // ── 4. Data Security ───────────────────────────
                      _SectionTitle(text: '4. Data Security'),
                      Space.yf(8),
                      _BodyText(
                        text:
                            'We use industry-standard encryption and secure servers to protect your information. Data is encrypted in transit and at rest.',
                      ),

                      Space.yf(20),

                      // ── 5. Your Rights ─────────────────────────────
                      _SectionTitle(text: '5. Your Rights'),
                      Space.yf(8),
                      _BodyText(text: 'You can:'),
                      Space.yf(10),
                      _CheckItem(text: 'Update your profile information'),
                      _CheckItem(text: 'Request deletion of your account and data'),
                      _CheckItem(text: 'Opt out of marketing communications'),
                      _CheckItem(text: 'Export your personal data'),
                      _CheckItem(text: 'Withdraw consent for location sharing at any time'),
                      Space.yf(10),
                      _BodyText(
                        text:
                            'To exercise any of these rights, contact us at privacy@vybe.app.',
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

// ─────────────────────────────────────────────────────────────────────────────
// Section Title
// ─────────────────────────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppText.h5b);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Body Text
// ─────────────────────────────────────────────────────────────────────────────

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppText.b2?.cl(AppTheme.c.text.shade800!),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Check Item
// ─────────────────────────────────────────────────────────────────────────────

class _CheckItem extends StatelessWidget {
  final String text;
  const _CheckItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppStaticData.checked,
            width: 20.w,
            height: 20.w,
          ),
          Space.xf(10),
          Expanded(
            child: Text(
              text,
              style: AppText.b2?.cl(AppTheme.c.text.shade800!),
            ),
          ),
        ],
      ),
    );
  }
}