import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/utils/app_util.dart';
import '../../../common/repository/local_storage.dart';
import '../../../common/widgets/inputs/radio_input.dart';
import '../../../core/di/injectable.dart';
import '../../../core/theme/bloc/theme_bloc.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_styles.dart';
import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  late ThemeBloc _themeBloc;
  late SettingsScreenState parent;
  late LocalStorage _localStorage;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  String appTheme = '';

  @override
  void initState() {
    super.initState();
    _localStorage = getIt<LocalStorage>();
    _themeBloc = context.read<ThemeBloc>();
    appTheme = getThemeModeString(_localStorage.getThemeMode());
  }

  void onThemeChanged(ThemeMode themeMode) {
    _localStorage.updateThemeMode(themeMode);
    _themeBloc.add(ThemeModeChanged(themeMode));
  }

  @override
  Widget build(BuildContext context) {
    var bodyWidget = BlocProvider(
      create: (context) => SettingsBloc()..add(SettingsInit()),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              Card(
                margin: EdgeInsets.all(Sizes.xs),
                color: ThemeColors.bgColorBW(context),
                child: ListTile(
                  leading: Icon(Icons.color_lens),
                  title: const Text('App Theme'),
                  subtitle: Text(appTheme),
                  onTap: () => selectThemeDialog(context),
                ),
              ),
            ],
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: bodyWidget,
    );
  }

  Future<void> selectThemeDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: SizedBox(
            height: 135,
            child: RadioInput(
              initValue: appTheme,
              options: const ['System Theme', 'Light', 'Dark'],
              vertical: true,
              onChanged: (String? newValue) {
                setState(() {
                  switch (newValue) {
                    case 'Light':
                      onThemeChanged(ThemeMode.light);
                      break;
                    case 'Dark':
                      onThemeChanged(ThemeMode.dark);
                      break;
                    default:
                      onThemeChanged(ThemeMode.system);
                      break;
                  }
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
        );
      },
    );
  }
}
