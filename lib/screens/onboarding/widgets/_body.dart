part of '../onboarding.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      // AppRoutes.selectRole.pushReplace(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.background.main,
      body: Padding(
        padding: Space.hf(16).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 16.h,
          top: MediaQuery.of(context).padding.top,
          //  + 60.h
        ),
        child: Column(
          children: [
            /// PAGE VIEW (IMAGE + TEXT)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];

                  return Column(
                    children: [
                      Space.ym!,

                      /// IMAGE
                      SizedBox(
                        height: _currentIndex == 0
                            ? 222.h
                            : _currentIndex == 1
                            ? 273.h
                            : 240.h,
                        width: double.infinity,
                        child: Image.asset(item['image']!, fit: BoxFit.contain),
                      ),

                      Space.ym!,

                      /// DOTS INDICATOR
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (dotIndex) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                            height: 6.h,
                            width: _currentIndex == dotIndex ? 36.w : 6.w,
                            decoration: BoxDecoration(
                              color: AppTheme.c.white,
                              border: Border.all(
                                color: _currentIndex == dotIndex
                                    ? AppTheme.c.primary.main!
                                    : AppTheme.c.text.main!,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ),

                      Space.yf(26.5),

                      /// TEXT CONTENT
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Column(
                          key: ValueKey(item['title']),
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['title']!,
                              textAlign: TextAlign.center,
                              style: AppText.h2b!.cl(AppTheme.c.white!),
                            ),
                            Space.yf(12),
                            Text(
                              item['subtitle']!,
                              textAlign: TextAlign.center,
                              style: AppText.b1?.copyWith(
                                color: AppTheme.c.white,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Space.yf(32),

            /// BUTTONS
            AppButton(
              label: "Sign Up",
              onPressed: () => {},
              backgroundColor: AppTheme.c.white,
              textColor: AppTheme.c.text.shade800,
              hasShadow: true,
            ),

            Space.yf(12),
            AppButton(
              label: "Get Started",
              onPressed: _nextPage,
              backgroundColor: AppTheme.c.secondary.main,
              textColor: AppTheme.c.text.shade800,
              hasShadow: true,
            ),
          ],
        ),
      ),
    );
  }
}
