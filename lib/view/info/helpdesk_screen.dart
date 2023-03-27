import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/info/info_vm.dart';
import '../../widget/provider/provider_widget.dart';

/// Help desk screen
class HelpDeskScreen extends StatefulWidget {
  static const String routeName = RouteNames.helpdeskScreen;

  const HelpDeskScreen({
    Key? key,
  }) : super(key: key);

  @override
  HelpDeskScreenState createState() => HelpDeskScreenState();
}

@visibleForTesting
class HelpDeskScreenState extends State<HelpDeskScreen>
    with BackNavigatorMixin
    implements InfoNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<InfoVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        Card merchandise = Card(
          child: ExpansionTile(
            leading: const Icon(Icons.display_settings),
            title: const Text('Support SongLib'),
            subtitle: const Text('Tap for more actions'),
            children: [
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Donate for the Project'),
                subtitle: const Text('Give Once, Weekly, Monthly or Quartely'),
                onTap: () => goToDonation(),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text('Buy our Merchandise'),
                subtitle: const Text('Order our branded T-Shirts (Kenya Only)'),
                onTap: () => viewModel.goToMerchandise(),
              ),
            ],
          ),
        );
        Card telegram = Card(
          child: ExpansionTile(
            leading: const Icon(Icons.display_settings),
            title: const Text('Mobile Phone'),
            subtitle: const Text('Tap for more actions'),
            children: [
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text('Call'),
                onTap: () => viewModel.goToCalling(),
                onLongPress: () => viewModel.copyText(2),
              ),
              ListTile(
                leading: const Icon(Icons.sms),
                title: const Text('SMS'),
                onTap: () => viewModel.goToSms(),
              ),
              ListTile(
                leading: const Icon(IconData(0xf05a6, fontFamily: 'MaterialIcons')),
                title: const Text('WhatsApp'),
                onTap: () => viewModel.goToWhatsapp(),
              ),
              ListTile(
                leading: const Icon(Icons.telegram),
                title: const Text('TeleGram'),
                onTap: () => viewModel.goToTelegram(),
              ),
            ],
          ),
        );
        return Scaffold(
          backgroundColor: ThemeColors.accent,
          appBar: AppBar(
            title: const Text(AppConstants.helpdeskTitle),
          ),
          body: ListView(
            padding: const EdgeInsets.all(5),
            children: [
              merchandise,
              Card(
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('How it works'),
                  subtitle:
                      const Text('Revisit the onboarding screen once again'),
                  onTap: () => viewModel.goToHowItWorks(),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: const Text('This app on Google PlayStore'),
                  subtitle:
                      const Text('Go to Play Store or Long Press to copy link'),
                  onTap: () => viewModel.goToPlayStore(),
                  onLongPress: () => viewModel.copyText(0),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email Address'),
                  subtitle: const Text('swahilibke(at)gmail[.]com'),
                  onTap: () => viewModel.goToEmail(),
                  onLongPress: () => viewModel.copyText(1),
                ),
              ),
              telegram,
            ],
          ),
        );
      },
    );
  }

  @override
  void goToHome() => MainNavigator.of(context).goToHome();

  @override
  void goToDonation() => MainNavigator.of(context).goToDonation();
}
