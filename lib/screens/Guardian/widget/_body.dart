part of '../guardian.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'My Guardians'),
      extendBodyBehindAppBar: true,
    
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(12),

              // ─── Guardian List ───────────────────────────────────
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _guardians.length,
                separatorBuilder: (_, __) => Space.yf(10),
                itemBuilder: (context, index) {
                  final g = _guardians[index];
                  return GuardianTile(
                    name: g['name'],
                    relation: g['relation'],
                    imagePath: g['imagePath'],
                    isActive: g['isActive'],
                    onTap: () {},
                  );
                },
              ),

              Space.yf(32),
            ],
          ),
        ),
      ),
    );
  }
}