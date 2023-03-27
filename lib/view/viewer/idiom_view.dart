import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/viewer/idiom_vm.dart';
import '../../widget/provider/provider_widget.dart';

class IdiomView extends StatefulWidget {
  static const String routeName = RouteNames.idiomScreen;

  const IdiomView({
    Key? key,
  }) : super(key: key);

  @override
  IdiomViewState createState() => IdiomViewState();
}

@visibleForTesting
class IdiomViewState extends State<IdiomView>
    with BackNavigatorMixin
    implements IdiomNavigator {
  TextStyle titleTxtStyle =
      TextStyles.CalloutFocus.bold.size(25).textColor(ThemeColors.primary);
  TextStyle bodyTxtStyle =
      TextStyles.Body1.size(20).textColor(ThemeColors.primary);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ProviderWidget<IdiomVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        final idiomTitle = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(vm.itemTitle!, style: titleTxtStyle),
        );
        final idiomMeaning = ListView.builder(
            shrinkWrap: true,
            itemCount: vm.meanings.length,
            itemBuilder: (context, index) {
              final meaning = vm.meanings[index]!;
              final extra = meaning.split(":");
              if (extra.length == 2) {
                return Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      minLeadingWidth: 5,
                      leading: Text('${index + 1}.', style: bodyTxtStyle),
                      title: Text(
                        extra[0],
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Html(
                        data: "<p><b>Mfano:</b> ${extra[1]}</p>",
                        style: {
                          "p": Style(
                            fontSize: const FontSize(18),
                          ),
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return Card(
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      minLeadingWidth: 5,
                      leading: Text('${index + 1}.', style: bodyTxtStyle),
                      title:
                          Text(extra[0], style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                );
              }
            });

        final idiomSynoyms = ListView.builder(
            shrinkWrap: true,
            itemCount: vm.synonyms.length,
            itemBuilder: (context, index) {
              final synonym = vm.synonyms[index]!;
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.arrow_circle_right),
                  title: Text(synonym, style: const TextStyle(fontSize: 20)),
                ),
              );
            });

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(AppConstants.appKamusi),
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    ThemeColors.accent,
                    ThemeColors.primary
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                idiomTitle,
                SizedBox(
                  height: size.height - 145,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        idiomMeaning,
                        if (vm.synonyms.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Divider(color: Colors.white),
                          ),
                        if (vm.synonyms.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'VISAWE',
                              style: titleTxtStyle,
                            ),
                          ),
                        if (vm.synonyms.isNotEmpty) idiomSynoyms,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
