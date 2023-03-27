import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repo/storage/local_storage.dart';
import '../../util/constants/app_constants.dart';
import '../../widget/general/toast.dart';

@injectable
class InfoVm with ChangeNotifierEx {
  final LocalStorage localStorage;
  late final InfoNavigator navigator;

  InfoVm(this.localStorage);

  Future<void> init(InfoNavigator screenNavigator) async {
    navigator = screenNavigator;
  }

  Future<void> goToHowItWorks() async {
    
  }

  Future<void> goToPlayStore() async {
    final Uri url = Uri.parse(AppConstants.playstoreLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToEmail() async {
    final Uri url = Uri.parse('mailto:swahilibke' '@' 'gmail.com');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToCalling() async {
    final Uri url = Uri.parse('tel:+' '254115' '586529');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToSms() async {
    final Uri url = Uri.parse('sms:+'
        '254115'
        '586529'
        '&body=Hi there, I use SongLib app. I am contacting you with regards to');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToWhatsapp() async {
    final Uri url = Uri.parse('https://wa.me/+' '254115' '586529');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToTelegram() async {
    final Uri url = Uri.parse('https://t.me/JacksiroKe');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> goToMerchandise() async {
    final Uri url = Uri.parse('https://forms.gle/iMq8GXjMGmUSJg949');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> copyText(int type) async {
    String text1 = '', text2 = '';
    switch (type) {
      case 0:
        text1 =
            'SongLib is an easy to use app that gives you offline access to your church hymns. '
            'Install it today ${AppConstants.playstoreLink}';
        text2 = 'App link';
        break;

      case 1:
        text1 = 'swahilibke' '@' 'gmail.com';
        text2 = 'Email address';
        break;

      case 2:
        text1 = '+254' '115' '586' '529';
        text2 = 'Phone number';
        break;
    }

    try {
      await Clipboard.setData(
        ClipboardData(text: text1),
      );
      showToast(
        text: '$text2 ${AppConstants.textCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  Future<void> copyNumber() async {
    try {
      await Clipboard.setData(
        const ClipboardData(text: '+254' '115' '586' '529'),
      );
      showToast(
        text: 'Phone number ${AppConstants.textCopied}',
        state: ToastStates.success,
      );
    } catch (_) {}
  }

  Future<void> donateViaPaypal() async {
    final Uri url = Uri.parse(AppConstants.donationPaypalLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> donateViaPaetron() async {
    final Uri url = Uri.parse(AppConstants.donationPatreaonLink);
    if (await canLaunchUrl(url)) await launchUrl(url);
  }
}

abstract class InfoNavigator {
  void goToHome();
  void goToDonation();
}
