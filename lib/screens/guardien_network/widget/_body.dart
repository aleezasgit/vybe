part of '../faq.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'FAQs'),
      extendBodyBehindAppBar: true,
    
      body: AppBackground(
        includeTopPadding: true,
        includeBottomPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.yf(12),

              // ─── FAQ Cards ───────────────────────────────────────
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _faqs.length,
                separatorBuilder: (_, __) => Space.yf(10),
                itemBuilder: (context, index) {
                  return _FaqCard(
                    question: _faqs[index]['question']!,
                    answer: _faqs[index]['answer']!,
                    isExpanded: state.expandedIndices.contains(index),
                    onTap: () => state.onTileToggled(index),
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

class _FaqCard extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FaqCard({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: UIProps.duration,
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: Space.all(16, 12),
        decoration: BoxDecoration(
          color: AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Question row ─────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(question, style: AppText.b1bm),
                ),
                Space.xf(22),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0.0,
                  duration: UIProps.duration,
                  curve: Curves.easeInOut,
                  child: SvgPicture.asset(
                    AppStaticData.upwardArrow,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ],
            ),

            // ─── Answer (animated expand) ─────────────────────────
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.yf(10),
                  Text(
                    answer,
                    style: AppText.l1?.w(4).cl(AppTheme.c.text.main!),
                  ),
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: UIProps.duration,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}