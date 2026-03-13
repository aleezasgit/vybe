part of '../guardian.dart';



class _Body extends StatelessWidget {
  const _Body();


  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStaticData.appBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: Space.hf(24),
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
      ),
    );
  }
}