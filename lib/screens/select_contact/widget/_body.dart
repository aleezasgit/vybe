part of '../select_contact.dart';



class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add New Guardian',
      ),
      extendBodyBehindAppBar: true,
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(16),
          
              /// ─── Title ─────────────────────────
              Text(
                'Select Contact',
                style: AppText.h5bm,
              ),
          
              Space.yf(16),
          
              /// ─── Search Bar (ADD HERE) ─────────
              SearchField(
  name: 'search_contact',
  hint: 'Search',
  fillColor: AppTheme.c.background.main, // matches your dark UI
  borderColor: AppTheme.c.lightGrey.main!,
  textColor: AppTheme.c.text.main!,
  iconColor: AppTheme.c.text.main!,
),
          
              Space.yf(16),
          
              /// ─── Suggested Contacts ────────────
              Text(
                'Suggested Contacts',
                style: AppText.b1bm?.cl(AppTheme.c.text.main!),
              ),
          
              Space.yf(16),
          
              /// ─── Contact Tiles ─────────────────
          
              _ContactTile(
                initials: 'JD',
                name: 'Jessica Davis',
                phone: '+1 (555) 012-3456',
              ),
          
              Space.yf(12),
          
              _ContactTile(
                initials: 'RT',
                name: 'Ryan Taylor',
                phone: '+1 (555) 987-6543',
              ),
          
              Space.yf(12),
          
              _ContactTile(
                initials: 'MB',
                name: 'Maya Brown',
                phone: '+1 (555) 234-5678',
              ),
          
              Space.yf(12),
          
              _ContactTile(
                initials: 'AL',
                name: 'Alex Lee',
                phone: '+1 (555) 456-7890',
              ),
          
              Space.yf(12),
          
              _ContactTile(
                initials: 'CW',
                name: 'Chris Wilson',
                phone: '+1 (555) 890-1234',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final String initials;
  final String name;
  final String phone;

  const _ContactTile({
    required this.initials,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(12, 12),
      decoration: BoxDecoration(
        color: AppTheme.c.background.main,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppTheme.c.lightGrey.main!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          /// ─── Avatar ─────────────────────────
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.c.lightGrey.main!,
              ),
            ),
            child: Center(
              child: Text(
                initials,
                style: AppText.h5b?.cl(  AppTheme.c.text.main!),
              ),
            ),
          ),

          Space.xf(12),

          /// ─── Name & Phone ───────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppText.b1b?.w(6),
                ),
                //Space.yf(4),
                Text(
                  phone,
                  style: AppText.l2?.cl(AppTheme.c.text.main!),
                ),
              ],
            ),
          ),

          /// ─── Add Button ─────────────────────
          Container(
            padding:Space.all(16,7),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              gradient: UIProps.primaryGradient,
            ),
            child: Text(
              'Add',
              style: AppText.l1bm?.cl(AppTheme.c.white!),
            ),
          ),
        ],
      ),
    );
  }
}