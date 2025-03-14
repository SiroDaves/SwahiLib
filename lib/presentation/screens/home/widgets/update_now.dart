part of '../home_screen.dart';

class UpdateNow extends StatelessWidget {
  final AppUpdate update;
  const UpdateNow({
    super.key,
    required this.update,
  });

  Future<void> launchPlayStore() async {
    String appUrl = '';
    if (Platform.isAndroid) {
      appUrl = update.appLinks!.android!;
    } else if (Platform.isIOS) {
      appUrl = update.appLinks!.ios!;
    } else if (Platform.isWindows) {
      appUrl = update.appLinks!.windows!;
    } else if (Platform.isMacOS) {
      appUrl = update.appLinks!.macos!;
    } else if (Platform.isLinux) {
      appUrl = update.appLinks!.linux!;
    }
    if (!await launchUrl(Uri.parse(appUrl))) {
      throw Exception('Could not launch updater');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.system_update,
                    size: 25,
                    color: ThemeColors.primary,
                  ),
                ),
                const Text(
                  'There\'s a new update',
                  style: TextStyle(
                    color: ThemeColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ].toRow(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Version: ${update.version}',
                style: TextStyles.bodyStyle1.size(20).textHeight(1.2),
              ),
              const SizedBox(height: 30),
              const Text(
                "What's new:",
                style: TextStyle(
                  color: ThemeColors.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                update.description!,
                textAlign: TextAlign.center,
                style: TextStyles.bodyStyle1.size(18).textHeight(1.2),
              ),
              const SizedBox(height: 20),
              AppButton(
                label: 'UPDATE NOW',
                onPressed: launchPlayStore,
                bgColor: ThemeColors.primary,
                foreColor: Colors.white,
                hoverColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ).center()
            ],
          ),
        ),
      ),
    );
  }
}
