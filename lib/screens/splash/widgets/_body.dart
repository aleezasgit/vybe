part of '../splash.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  void _navigateToOnBoarding() {
    AppRoutes.onBoarding.pushReplace(context);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), _navigateToOnBoarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      extendBody: false,

      body: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 23.h,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pngs/splash_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.ym!,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppStaticData.splashLogo, height: 35.12.h),
              ],
            ),
            Space.ym!,
            SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
