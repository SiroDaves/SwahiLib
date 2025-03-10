part of '../home_screen.dart';

class UpdateNow extends StatelessWidget {
  final String title;
  final String titleRetry;
  final bool showRetry;
  final VoidCallback? onRetry;
  const UpdateNow({
    super.key,
    this.title =
        'Sorry, no data is available at the moment. Please check back later.',
    this.titleRetry = 'RETRY',
    this.showRetry = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgZeroState,
          height: 160,
          width: 160,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.bodyStyle1.size(16).textHeight(1.2),
        ).center().padding(all: Sizes.l),
        const SizedBox(height: Sizes.l),
        if (showRetry) ...[
          [
            AppButton(
              label: titleRetry,
              onPressed: onRetry,
              bgColor: Colors.white,
              foreColor: ThemeColors.primary,
              hoverColor: ThemeColors.primary,
              border: Border.all(width: 2, color: ThemeColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ).expanded(),
          ].toRow().padding(all: Sizes.l),
        ]
      ],
    );
  }
}
