part of '../select_contact.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Add New Guardian'),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(12),
              Text('Select Contact', style: AppText.b1b),
              Space.yf(8),
              Text(
                'Suggested Contacts',
                style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
              ),
              Space.yf(12),

              _ContactTile(name: 'Jessica Davis', phone: '+1(555) 012-3456', initials: 'JD'),
              Space.yf(10),
              _ContactTile(name: 'Ryan Taylor', phone: '+1(555) 987-6543', initials: 'RT'),
              Space.yf(10),
              _ContactTile(name: 'Maya Brown', phone: '+1(555) 234-5678', initials: 'MB'),
              Space.yf(10),
              _ContactTile(name: 'Alex Lee', phone: '+1(555) 456-7890', initials: 'AL'),
              Space.yf(10),
              _ContactTile(name: 'Chris Wilson', phone: '+1(555) 890-1234', initials: 'CW'),

              Space.yf(32),
              AppButton(
                label: 'Add from Contacts',
                onPressed: () {},
                hasShadow: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final String name;
  final String phone;
  final String initials;

  const _ContactTile({
    required this.name,
    required this.phone,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(14),
      decoration: BoxDecoration(
        color: AppTheme.c.background.shade200,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppTheme.c.lightGrey.main!,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppTheme.c.lightGrey.main,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: AppText.b1b?.cl(AppTheme.c.white!),
              ),
            ),
          ),
          Space.xf(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppText.b1b),
                Space.yf(2),
                Text(
                  phone,
                  style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                ),
              ],
            ),
          ),
          AppButton(
            label: 'Add',
            onPressed: () {},
            hasShadow: false,
          ),
        ],
      ),
    );
  }
}